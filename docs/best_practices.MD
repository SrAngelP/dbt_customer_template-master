## DBT / SQL Best Practices

#### Use only small latter - snake case
Even for abbreviations. It will create less mistakes in the future. some app like metriql does not support capital letter and it is complicated to remember where is capital and where is not. 

#### Use CTE in your SQL
[CTE - Common Table Expression](https://learnsql.com/blog/when-to-use-cte/)

* improves readability
* multi-level aggregation

#### SQL Formating

```sql
SELECT DATE_TRUNC('day', o.created_at) AS day,
       i.item_category,
       COUNT(o.id) AS orders,
       COUNT(DISTINCT u.id) AS customers,
       SUM(o.price) AS revenue
  FROM orders o
  JOIN customers c
    ON c.id = o.customer.id
  JOIN items i
    ON i.id = o.item_id
   AND i.item_category != 'gift_card'
 WHERE o.is_return = FALSE
```

There should be a gutter six spaces in, because it looks nice. SQL keywords are uppercase; table and column names are lowercase. The **ON** clauses are on different lines than the joins. The first clause in a join condition (e.g., the **a** in **ON a = b**) references the table in the join, and the second clause references prior tables. Table aliases should be short, initials if possible. And, as should go without saying, select statements use trailing commas.

#### Jinja formating

Use tabs in blocks **if**, **else**, **endif**

```jinja
    {% if target.type == 'bigquery' %}
        {% set rows_count = 1 %}
    {% else %}
        {% set rc_result = run_query(query_rows_count) %}
        {% set rows_count = rc_result.rows[0]['rows_count'] %}
    {% endif %}
```

#### Macros

##### DBT-Utils

* Many macroses depends on **dbt-utils** - package of macroses. F.e. if you want to use **mcr_star** you should install **dbt-utils** first.
* First you need to create in root project folder file named **packages.yml**
* Copy to this file next code:

```yaml
packages:
  - package: dbt-labs/dbt_utils
    version: 1.0.0
```

* Next you need to run in terminal:
```
./run_inside_docker.sh dbt deps
```

* If you need to use some macroses from dbt_utils on CI, you need ask devops for adding dbt-deps command in Dockerfile confugure.

##### How we write macros

```jinja
{% macro *mcr_star*(from, relation_alias=False, except=[]) -%}
   {{ return(adapter.dispatch('star', None)(from=from, 
                                            relation_alias=relation_alias, 
                                            except=except)) }}
{% endmacro %}

{% macro default__star(from, relation_alias=False, except=[]) -%}
    return {{"Hello"}}    
{%- endmacro %}
```

* you can split your macro into interface (mcr_star) and implementation (default__star);

* interface macros always have a prefix in their name: "mcr_";

* if your macro has optional fields, then set the default arguments # relation_alias = False;

##### How we use macros

```jinja
select
    {{mcr_star(ref('dim_companies'))}},
    {{mcr_star(from = ref('stg_sfdc_opportunities'), relation_alias = 'sa') }},
    {{mcr_star(from = ref( 'stg_sfdc_opportunity_stages'),
               relation_alias = 'os',
               except=['opportunity_stage_name','opportunity_id']) }},
...
```

* use short calls if the order of the arguments in the macro allows it;

* use explicit argument passing if there are more than one. Write down the input parameters;

* use line breaks at the level of passing parameters to the macro so that it does not look too long

