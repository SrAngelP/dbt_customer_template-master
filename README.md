# DBT Project Template

This repository provides a starting point for creating a new DBT project. It includes a basic file structure and some example files to help you get started quickly.

## Structure

- `models/`: This directory contains all of the DBT models for the project.
- `macros/`: This directory contains any macros that are used in the models.
- `data/`: This directory contains any seed data that is used to populate the initial state of the data warehouse.
- `tests/`: This directory contains any tests that are used to validate the project's models.
- `dbt_project.yml`: This file contains the configuration for the DBT project, including the target database and schema.
- `.env.example`: Copy this example into file `.env`. This file contains environment variables that are used to configure the project.
- `conf/.dbt/profiles.yml`: This file contains the configuration for connecting to different environments (e.g. development, staging, production)

## Getting Started

1. Clone this repository to your local machine.
2. Install the necessary dependencies by running `dbt deps`.
3. Customize the file structure and example files to suit your needs.
4. Fill the environment variables in the `.env` file.
5. Configure the different environments in the `profiles.yml` file.
6. Run `dbt run` to build the models and seed the data warehouse.
7. Run `dbt test` to run any tests for the models.

## Additional Resources

- [Setting up a dbt environment for Windows](https://docs.google.com/document/d/1j9EmKB1o_SPXcTmCr8l7Q5Nn3VKt6dPZe-K0LpOJqvA/edit?usp=sharing)
- [DBT documentation](https://docs.getdbt.com/)
- [DBT community](https://discourse.getdbt.com/)

## Best practices

- [DBT / SQL Best practices](docs/best_practices.MD)
- [DBT Naming conventions](docs/naming_convention.MD)

## Contributing

If you would like to contribute to this template, please fork the repository and submit a pull request.

## License

This template is available under the [MIT License](LICENSE).