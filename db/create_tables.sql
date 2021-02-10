create database ttm;



create table companies(
id serial PRIMARY KEY,
symbol varchar(10),
name varchar(50),
sector varchar(50),
subSector varchar(50),
headQuarter varchar(50),
dateFirstAdded date,
cik char(10),
founded varchar(25)
);

create table incomeStatement (
id serial PRIMARY KEY,
company_id int NOT NULL,
retrievedDate date not null default CURRENT_DATE,
symbol VARCHAR(10),
reportedCurrency VARCHAR(5),
fillingDate date,
acceptedDate timestamp,
period varchar(5),
revenue numeric,
costOfRevenue numeric,
grossProfit numeric,
grossProfitRatio float,
researchAndDevelopmentExpenses numeric,
generalAndAdministrativeExpenses numeric,
sellingAndMarketingExpenses numeric,
otherExpenses numeric,
operatingExpenses numeric,
costAndExpenses numeric,
interestExpense numeric,
depreciationAndAmortization numeric,
ebitda numeric,
ebitdaratio float,
operatingIncome numeric,
operatingIncomeRatio float,
totalOtherIncomeExpensesNet numeric,
incomeBeforeTax numeric,
incomeBeforeTaxRatio float,
incomeTaxExpense numeric,
netIncome numeric,
netIncomeRatio float,
eps float,
epsdiluted float,
weightedAverageShsOut numeric,
weightedAverageShsOutDil numeric,
link varchar(255),
finalLink varchar(255),
foreign key (company_id) references companies(id)
);

create table balanceSheet (
id serial PRIMARY KEY,
company_id int NOT NULL,
retrievedDate date not null default CURRENT_DATE,
symbol VARCHAR(10),
fillingDate timestamp,
acceptedDate timestamp,
period varchar(5),
cashAndCashEquivalents numeric,
shortTermInvestments numeric,
cashAndShortTermInvestments numeric,
netReceivables numeric,
inventory numeric,
otherCurrentAssets numeric,
totalCurrentAssets numeric,
propertyPlantEquipmentNet numeric,
goodwill float,
intangibleAssets float,
goodwillAndIntangibleAssets float,
longTermInvestments numeric,
taxAssets float,
otherNonCurrentAssets numeric,
totalNonCurrentAssets numeric,
otherAssets numeric,
totalAssets numeric,
accountPayables numeric,
shortTermDebt numeric,
taxPayables float,
deferredRevenue numeric,
otherCurrentLiabilities numeric,
totalCurrentLiabilities numeric,
longTermDebt numeric,
deferredRevenueNonCurrent float,
deferredTaxLiabilitiesNonCurrent float,
otherNonCurrentLiabilities numeric,
totalNonCurrentLiabilities numeric,
otherLiabilities numeric,
totalLiabilities numeric,
commonStock numeric,
retainedEarnings numeric,
accumulatedOtherComprehensiveIncomeLoss numeric,
othertotalStockholdersEquity numeric,
totalStockholdersEquity numeric,
totalLiabilitiesAndStockholdersEquity numeric,
totalInvestments numeric,
totalDebt numeric,
netDebt numeric,
link varchar(255),
finalLink varchar(255),
foreign key (company_id) references companies(id)
);

create table cashFlowStatement (
id serial PRIMARY KEY,
company_id int NOT NULL,
retrievedDate date not null default CURRENT_DATE,
symbol VARCHAR(10),
fillingDate timestamp,
acceptedDate timestamp,
period varchar(5),
netIncome numeric,
depreciationAndAmortization numeric,
deferredIncomeTax numeric,
stockBasedCompensation numeric,
changeInWorkingCapital numeric,
accountsReceivables numeric,
inventory numeric,
accountsPayables numeric,
otherWorkingCapital numeric,
otherNonCashItems numeric,
netCashProvidedByOperatingActivities numeric,
investmentsInPropertyPlantAndEquipment numeric,
acquisitionsNet numeric,
purchasesOfInvestments numeric,
salesMaturitiesOfInvestments numeric,
otherInvestingActivites numeric,
netCashUsedForInvestingActivites numeric,
debtRepayment numeric,
commonStockIssued numeric,
commonStockRepurchased numeric,
dividendsPaid float,
otherFinancingActivites numeric,
netCashUsedProvidedByFinancingActivities numeric,
effectOfForexChangesOnCash float,
netChangeInCash numeric,
cashAtEndOfPeriod numeric,
cashAtBeginningOfPeriod numeric,
operatingCashFlow numeric,
capitalExpenditure numeric,
freeCashFlow numeric,
link varchar(255),
finalLink varchar(255),
foreign key (company_id) references companies(id)
);

create table financialRatios( 
id serial PRIMARY KEY,
company_id int NOT NULL,
retrievedDate date not null default CURRENT_DATE,
dividendYielTTM float,
dividendYielPercentageTTM float,
peRatioTTM float,
pegRatioTTM float,
payoutRatioTTM float,
currentRatioTTM float,
quickRatioTTM float,
cashRatioTTM float,
daysOfSalesOutstandingTTM float,
daysOfInventoryOutstandingTTM float,
operatingCycleTTM float,
daysOfPayablesOutstandingTTM float,
cashConversionCycleTTM float,
grossProfitMarginTTM float,
operatingProfitMarginTTM float,
pretaxProfitMarginTTM float,
netProfitMarginTTM float,
effectiveTaxRateTTM float,
returnOnAssetsTTM float,
returnOnEquityTTM float,
returnOnCapitalEmployedTTM float,
netIncomePerEBTTTM float,
ebtPerEbitTTM float,
ebitPerRevenueTTM float,
debtRatioTTM float,
debtEquityRatioTTM float,
longTermDebtToCapitalizationTTM float,
totalDebtToCapitalizationTTM float,
interestCoverageTTM float,
cashFlowToDebtRatioTTM float,
companyEquityMultiplierTTM float,
receivablesTurnoverTTM float,
payablesTurnoverTTM float,
inventoryTurnoverTTM float,
fixedAssetTurnoverTTM float,
assetTurnoverTTM float,
operatingCashFlowPerShareTTM float,
freeCashFlowPerShareTTM float,
cashPerShareTTM float,
operatingCashFlowSalesRatioTTM float,
freeCashFlowOperatingCashFlowRatioTTM float,
cashFlowCoverageRatiosTTM float,
shortTermCoverageRatiosTTM float,
capitalExpenditureCoverageRatioTTM float,
dividendPaidAndCapexCoverageRatioTTM float,
priceBookValueRatioTTM float,
priceToBookRatioTTM float,
priceToSalesRatioTTM float,
priceEarningsRatioTTM float,
priceToFreeCashFlowsRatioTTM float,
priceToOperatingCashFlowsRatioTTM float,
priceCashFlowRatioTTM float,
priceEarningsToGrowthRatioTTM float,
priceSalesRatioTTM float,
dividendYieldTTM float,
enterpriseValueMultipleTTM float,
priceFairValueTTM float,
foreign key (company_id) references companies(id)
);

create table keyMetricsAnnual(
id serial PRIMARY KEY,
company_id int NOT NULL,
retrievedDate date not null default CURRENT_DATE,
revenuePerShare float,
netIncomePerShare float,
operatingCashFlowPerShare float,
freeCashFlowPerShare float,
cashPerShare float,
bookValuePerShare float,
tangibleBookValuePerShare float,
shareholdersEquityPerShare float,
interestDebtPerShare float,
marketCap float,
enterpriseValue float,
peRatio float,
priceToSalesRatio float,
pocfratio float,
pfcfRatio float,
pbRatio float,
ptbRatio float,
evToSales float,
enterpriseValueOverEBITDA float,
evToOperatingCashFlow float,
evToFreeCashFlow float,
earningsYield float,
freeCashFlowYield float,
debtToEquity float,
debtToAssets float,
netDebtToEBITDA float,
currentRatio float,
interestCoverage float,
incomeQuality float,
dividendYield float,
payoutRatio float,
salesGeneralAndAdministrativeToRevenue float,
researchAndDdevelopementToRevenue float,
intangiblesToTotalAssets float,
capexToOperatingCashFlow float,
capexToRevenue float,
capexToDepreciation float,
stockBasedCompensationToRevenue float,
grahamNumber float,
roic float,
returnOnTangibleAssets float,
grahamNetNet float,
workingCapital float,
tangibleAssetValue float,
netCurrentAssetValue numeric,
investedCapital float,
averageReceivables numeric,
averagePayables numeric,
averageInventory numeric,
daysSalesOutstanding float,
daysPayablesOutstanding float,
daysOfInventoryOnHand float,
receivablesTurnover float,
payablesTurnover float,
inventoryTurnover float,
roe float,
capexPerShare float ,
foreign key (company_id) references companies(id)
);


create table keyMetricsTTM ( 
id serial PRIMARY KEY,
company_id int NOT NULL,
retrievedDate date not null default CURRENT_DATE,
revenuePerShareTTM float,
netIncomePerShareTTM float,
operatingCashFlowPerShareTTM float,
freeCashFlowPerShareTTM float,
cashPerShareTTM float,
bookValuePerShareTTM float,
tangibleBookValuePerShareTTM float,
shareholdersEquityPerShareTTM float,
interestDebtPerShareTTM float,
marketCapTTM numeric,
enterpriseValueTTM numeric,
peRatioTTM float,
priceToSalesRatioTTM float,
pocfratioTTM float,
pfcfRatioTTM float,
pbRatioTTM float,
ptbRatioTTM float,
evToSalesTTM float,
enterpriseValueOverEBITDATTM float,
evToOperatingCashFlowTTM float,
evToFreeCashFlowTTM float,
earningsYieldTTM float,
freeCashFlowYieldTTM float,
debtToEquityTTM float,
debtToAssetsTTM float,
netDebtToEBITDATTM float,
currentRatioTTM float,
interestCoverageTTM float,
incomeQualityTTM float,
dividendYieldTTM float,
dividendYieldPercentageTTM float,
payoutRatioTTM float,
salesGeneralAndAdministrativeToRevenueTTM float,
researchAndDevelopementToRevenueTTM float,
intangiblesToTotalAssetsTTM float,
capexToOperatingCashFlowTTM float,
capexToRevenueTTM float,
capexToDepreciationTTM float,
stockBasedCompensationToRevenueTTM float,
grahamNumberTTM float,
roicTTM float,
returnOnTangibleAssetsTTM float,
grahamNetNetTTM float,
workingCapitalTTM numeric,
tangibleAssetValueTTM float,
netCurrentAssetValueTTM float,
investedCapitalTTM float,
averageReceivablesTTM numeric,
averagePayablesTTM numeric,
averageInventoryTTM numeric,
daysSalesOutstandingTTM float,
daysPayablesOutstandingTTM float,
daysOfInventoryOnHandTTM float,
receivablesTurnoverTTM float,
payablesTurnoverTTM float,
inventoryTurnoverTTM float,
roeTTM float,
capexPerShareTTM float,
foreign key (company_id) references companies(id)
);

create table financialGrowth(
id serial PRIMARY KEY,
company_id int NOT NULL,
retrievedDate date not null default CURRENT_DATE,
revenueGrowth float,
grossProfitGrowth float,
ebitgrowth float,
operatingIncomeGrowth float,
netIncomeGrowth float,
epsgrowth float,
epsdilutedGrowth float,
weightedAverageSharesGrowth float,
weightedAverageSharesDilutedGrowth float,
dividendsperShareGrowth float,
operatingCashFlowGrowth float,
freeCashFlowGrowth float,
tenYRevenueGrowthPerShare float,
fiveYRevenueGrowthPerShare float,
threeYRevenueGrowthPerShare float,
tenYOperatingCFGrowthPerShare float,
fiveYOperatingCFGrowthPerShare float,
threeYOperatingCFGrowthPerShare float,
tenYNetIncomeGrowthPerShare float,
fiveYNetIncomeGrowthPerShare float,
threeYNetIncomeGrowthPerShare float,
tenYShareholdersEquityGrowthPerShare float,
fiveYShareholdersEquityGrowthPerShare float,
threeYShareholdersEquityGrowthPerShare float,
tenYDividendperShareGrowthPerShare float,
fiveYDividendperShareGrowthPerShare float,
threeYDividendperShareGrowthPerShare float,
receivablesGrowth float,
inventoryGrowth float,
assetGrowth float,
bookValueperShareGrowth float,
debtGrowth float,
rdexpenseGrowth float,
sgaexpensesGrowth float,
foreign key (company_id) references companies(id)
);
