Final Project description
================
Tianqi Li

This repository contains the complete workflow for analyzing and
visualizing a dataset related to Breast cancer research. The project
includes data cleaning, summary tables, figures, statistical modeling,
and a final report.

------------------------------------------------------------------------

## Final Report

The final report is rendered from an R Markdown file:

- **Report Source**: [`Tianqi_report.Rmd`](Tianqi_report.Rmd)
- **Generated Output**: `Tianqi_report.html`

To generate the final report, run the following command in the terminal:
`bash$ make`

Particularly, befor generate the final report, please synchronize your
package repository by running the following command in the terminal:
`bash$ make install`

To generate the final report in docker environment, please run
`bash$ run report` to generate the final report in docker container.
When you doing this, docker will automatically download the image from
dockerhub:
<https://hub.docker.com/repository/docker/gracexyy/final_report/general>

Or we could run `bash$ make project image` to build the image at your
local computer. The run `bash$ run report` to generate the final report
in docker container.

## Code description

`code/01_clean_data.R`

- relabels the raw data
- saves cleaned data as a `.rds` object in `output/` folder

`code/01_make_tables.R`

- reads the cleaned data, selects relevant variables, create two tables
- save them as output/table_one.rds and output/table_two.rds

`code/02_make_figures.R`

- produces three distribution figures and
- saves them as one figures output/distribution1.png.

`code/03_make_model.R`

- loads the cleaned data set and fits a statistical model
- summarizes model performance and outputs relevant results used in the
  report
- saves the regression model as output/regression_models.rds
- saves the summary table as output/regression_tables.rds

`code/04_render_report.R`

- renders `report.Rmd`

`report.Rmd`

- reads all output result generated by `code/01_make_output1.R`,
  `code/01_make_tables.R`, `code/02_make_figures.R`,
  `code/03_make_model.R`
- conducts breast cancer dataset analysis

------------------------------------------------------------------------
