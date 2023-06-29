# Waste-Management-Case-Study-

## Scenario 
You are a data engineer hired by a solid waste management company. The company collects and recycles solid waste across major cities in the country of Brazil. The company operates hundreds of trucks of different types to collect and transport solid waste. The company would like to create a data warehouse so that it can create reports like  

* total waste collected per year per city 
* total waste collected per month per city 
* total waste collected per quarter per city 
* total waste collected per year per trucktype 
* total waste collected per trucktype per city 
* total waste collected per trucktype per station per city 

You will use your data warehousing skills to design and implement a data warehouse for the company.

## Approach 
For Designing a data warehouse for a solid waste management company, we'll,

* Identify requirements
   
   Before an organization starts to build a data warehouse, it must identify its analytics requirements. Once a data warehouse is built, it would be difficult to use it to generate analytics that it was not designed for. Understanding and collecting analytics requirements is an important first step in the design process of a data warehouse.

1) **Organization level analytics requirements** </br>
Identify what are the analytics requirements that are needed at the over all organazation level.

2) **Department level analytics requirements**</br>
Identify what are the analytics requirements that are needed at the level or various departments in the organization.

3)**Performance analytics requirements**</br>
Performance analytics help an organazation to track how its operations are being carried out. For example these include reports like:

How many products sold in the last quarter.
How many tons of raw material used per product.
Total sales per product in the last month.
Granularity of reports

4) **Granularity**</br>
Granularity has a major impact on the dataware house design. When you identify the grain, you specify exactly what a fact table record contains. The grain conveys the level of detail that is associated with the fact table measurements. When you identify the grain, you also decide on the level of detail you want to make available in the dimensional model. 
The level of detail that is available in a star schema is known as the grain. Each fact and dimension table has its own grain or granularity. Each table (either fact or dimension) contains some level of detail that is associated with it. The grain of the dimensional model is the finest level of detail that is implied when the fact and dimension tables are joined.

For example, the granularity of a dimensional model that consists of the dimensions Date, Store, and Product is product sold in store by day.


5) **Diagnostic analytics requirements**</br>

Diagnostic analytics are used, when an organazation wishes to analyze why a certain thing happened. For example, an organization wishes to know, why a particular product’s sales has declined. These analytics, usually are trends over a period of time.


6) **Ad-Hoc Analytics requirements**</br>

In spite of all the requirement collection process, it would never be possible to collect or anticipate all the analytics requirements. So when we design a data warehouse, we need to keep in mind, that there would always be an ad-hoc analytics requirement that may come up from time to time. The data warehouse design should be in such a way, that it should be able to accomodate ad hoc analytics needs to some reasonable extent.

### Git metadata

The uploads consists a dashboard made using [IBM Cognos](https://www.ibm.com/products/cognos-analytics) </br>
A graphical design modelling of facts & dimensions </br>
An sql file that implements the design model </br>
Note that midway the data received to load didnt comply with initial design so the design was slightly adjusted to support loading successfully </br>

### Tools used

[IBM Db2](https://www.ibm.com/products/db2) </br>
[IBM Cognos](https://www.ibm.com/products/cognos-analytics)

