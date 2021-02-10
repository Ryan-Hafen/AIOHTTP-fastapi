import json
import requests
import aiohttp
import asyncio
import asyncpg
import config



limit = 120
finType = 'income-statement'

async def write_to_db(connection, params, columns = ('company_id','retrievedDate','symbol','reportedCurrency','fillingDate','acceptedDate','period','revenue','costOfRevenue','grossProfit','grossProfitRatio','researchAndDevelopmentExpenses',
                'generalAndAdministrativeExpenses','sellingAndMarketingExpenses','otherExpenses','operatingExpenses','costAndExpenses','interestExpense','depreciationAndAmortization','ebitda','ebitdaratio',
                'operatingIncome','operatingIncomeRatio','totalOtherIncomeExpensesNet','incomeBeforeTax','incomeBeforeTaxRatio','incomeTaxExpense','netIncome','netIncomeRatio','eps','epsdiluted','weightedAverageShsOut',
                'weightedAverageShsOutDil','link','finalLink')):
    
    result =  await connection.copy_records_to_table('incomeStatement', records=params)
    print(result)

async def get_fin(pool, company_id, url):
    try:
        async with pool.acquire() as connection:
            async with aiohttp.ClientSession() as session:
                async with session.get(url=url) as r:
                    resp = await r.read()
                    response = json.loads(resp)[0]
                    params = [(company_id, response['date'], response['symbol'], response['reportedCurrency'], response['fillingDate'], 
                                response['acceptedDate'], response['period'], response['revenue'], response['costOfRevenue'], response['grossProfit'], 
                                response['grossProfitRatio'], response['researchAndDevelopmentExpenses'], response['generalAndAdministrativeExpenses'], 
                                response['sellingAndMarketingExpenses'], response['otherExpenses'], response['operatingExpenses'], response['costAndExpenses'],
                                response['interestExpense'], response['depreciationAndAmortization'], response['ebitda'], response['ebitdaratio'], 
                                response['operatingIncome'], response['operatingIncomeRatio'], response['totalOtherIncomeExpensesNet'],
                                response['incomeBeforeTax'], response['incomeBeforeTaxRatio'], response['incomeTaxExpense'], response['netIncome'], 
                                response['netIncomeRatio'], response['eps'], response['epsdiluted'], response['weightedAverageShsOut'], response['weightedAverageShsOutDil'],
                                response['link'], response['finalLink'])]
                    await write_to_db(connection, params)
    except Exception as e:
        print(e)
        # print(f'Unable to get url {url} due to {e.__class__}')

async def get_fins(pool, company_url):
    try:
        ret = await asyncio.gather(*[get_fin(pool, id, company_url[id]) for id in company_url])
        print(f"Finalized all. Return list of {len(ret)} outputs.")
    except Exception as e:
        print(e)

async def get_company_fin():
    pool = await asyncpg.create_pool(user=config.dbUser, password=config.dbPassword, database=config.dbName, host=config.dbHost, command_timeout=60)
    
    async with pool.acquire() as connection:
        companies = await connection.fetch('select * from companies')
        company_url = {}
        for company in companies:
            symbol = company['symbol']
            company_url[company['id']] = f'{config.baseUrl}/{finType}/{symbol}?limit={limit}&apikey={config.apiKey}'
    await get_fins(pool, company_url)

asyncio.get_event_loop().run_until_complete(get_company_fin())