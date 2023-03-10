# DBT Customer Template Master

This repository is the result of the work and practice for the Improvado Internee and is proof of the process made by Angel Pat.

## Initial process

First we needed to prepare the enviroment in the local machine to use. We employ the docker program to use its containers. In the containers we proceded to install dbt core and prepared the keys for the connections. For all that we used the template provided by the company, meanwhile, we also installed the extensions needed to made the container more useful. We created two accounts in differents databases to have a wide range of possibilities to try. For every account we took note and download the info and keys, proceded to employ them and tested te connections with each data source. At the same time, we search for the packages from fivetran to analize data. We chose the google_ads packages and used an example data to test the models it include.

## Catching errors
After having the enviroment started and the data loaded in the sources, we continued to test the models by trying to made errors, or erasing info, with the purpose of checking the behaviuor of the models, and also to prepare in the process of troubleshooting.
We did twp types of catching errors: 

### Query Log
The query log is a log that records all and every query received, and every client connected and disconnected.
For this option we literally tried to submit queries with wrong name of columns, columns we have already deleted, or with wrong name of tables/datasets, the results vary from data source, but at the same time were the same. With different messages they indicated that the actions coulnd't complete.

![Query example](https://github.com/SrAngelP/dbt_customer_template-master/blob/5a32c80c02d3bd5f7f5ea7c7ab474e9cb1f01831/images/test_model.png)

In the example, we try to acces a column with the name of "id_" but, as you can guess, that column doesn't exist that's why the next message is deployed.  

![Error Query Log](https://github.com/SrAngelP/dbt_customer_template-master/blob/871fef36aa6fdb99c88b480077353c9dee70a83a/images/error2.png)

### Dashboard
For the next step we create a basic dashboard in the program ![Power BI](https://powerbi.microsoft.com/es-mx/), we connected it to our BigQuery data source and after the dashboard was created and saved, we erase one of the columns the dashboard made use of, to verify what would happen with the data in the file.

![Error Dashboard](https://github.com/SrAngelP/dbt_customer_template-master/blob/871fef36aa6fdb99c88b480077353c9dee70a83a/images/error4.png)

(In the image we can read the error "The visual object can't be shown")


We tried this option to see what would happen if by some reason the data of our tables or visualizations was mdified, and know what to do.

## Schedule runs
After checking the errors, we move forward to schedule some runs to determined hours. In this task we used the github actions. In order to do it, we need to create a yml file under the folder "/.github/workflows" in the current repo. To set the hours in which the models were going to run we used ![Cron](https://crontab.guru), and to resume, after some hard try-and-error, research of the yml syntax and the github actions, and making use of the secrets of github, we succeded in schedule the models to keep running every day.

## List of files
### Loaded
- account_history
- account_stats
- ad_group_criterion_history
- ad_group_history
- ad_group_stats
- ad_history
- ad_stats
- campaign_history
- campaign_stats
- keyword_stats

### Made by the models
- google_ads__account_report
- google_ads__ad_group_report
- google_ads__campaign_report
- google_ads__keyword_report
- google_ads__url_report
- stg_google_ads__account_history
- stg_google_ads__account_history_tmp
- stg_google_ads__account_stats
- stg_google_ads__account_stats_tmp
- stg_google_ads__ad_group_criterion_history
- stg_google_ads__ad_group_criterion_history_tmp
- stg_google_ads__ad_group_history
- stg_google_ads__ad_group_history_tmp
- stg_google_ads__ad_group_stats
- stg_google_ads__ad_group_stats_tmp
- stg_google_ads__ad_history
- stg_google_ads__ad_history_tmp
- stg_google_ads__ad_stats
- stg_google_ads__ad_stats_tmp
- stg_google_ads__campaign_history
- stg_google_ads__campagin_history_tmp
- stg_google_ads__keyword_stats
- stg_google_ads__Keyword_stats_tmp

![Some of the files](https://github.com/SrAngelP/dbt_customer_template-master/blob/8319900588c42231521eed3397552cd6c2b269f3/images/files_bq.png)
