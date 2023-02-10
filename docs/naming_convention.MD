## DBT Naming Convention

#### Overview

Here’s the document that define our internal rules for tables/views and columns/fields naming. That will help us be more transparent and understandable.

### Rules

#### Rule № 1: Column across all staging models should have an unique name

*For example:* All fields that related to Opportunity name in SFDC should be named like **sfdc_opportunity_name**
Not like this: **opportunity_name**, **agreement_opportunity_name**, etc


#### Rule № 2: All models from datasources should have prefixes from these datasources 

Example of datasources: sfdc (salesforce), jira, google, github, etc

>**For example**:
>
>--- sfdc_oportunity_id
>
>--- jira_company_name

Case where we don’t follow the rule:

* we have field: agency_id (because this one is from the product database). 
* and we also have different field/columns dts_agency_id and this column value is different. 

How to deal with it? We decided that *agency_id* is a key improvado term

#### Rule № 3:  All columns that we will build for DIM models should be coalesce 

>**For example:**
>
>dim_domain id - that will coalesce from domain_id(product),  sfdc_domain_id, jira_domain_id

#### Rule № 4: Plural naming for tables/views and single for columns/fields 

>**For example**:
>
>Table - sfdc_tasks
>
>Columns: sfdc_task_status

#### Rule № 5:  We use prefix and postfix for specific type of fields

>**Boolean Fields** - *use prefix '“**is**”*
>
>**For example**: *is_sfdc_active_customers*
>
>**Date Fields** - *use postfix “***date**”*
>
>**For example**: *created_date*
>
>**DateTime Fields** - *use postfix “**dttm**”*
>
>**For example**: *created_dttm*


#### Rule № 6: (not naming) minumum (as Reasonable possible) operations in one CTE

**instead of** 

```sql
some_cte as ( 

...

join

group by
```

**use**

```sql
add_field_name as (

... 

join 

group_by_filed_name as (

...

group by
```

#### Rule № 7: last cte in model has alias

>model mrt_something has last cte:

```sql
mrt_something as ()

-- final

select * from mrt_something
```





```sql

SELECT
    A1.sell_date,
    Count(DISTINCT A1.product) AS num_sold,
    GROUP_CONCAT(DISTINCT A1.product
        ORDER BY A1.product ASC SEPARATOR ',') AS products
FROM
    Activities AS A1
GROUP BY
    A1.sell_date
```