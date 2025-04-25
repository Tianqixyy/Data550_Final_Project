FROM --platform=linux/amd64 rocker/tidyverse:4.4.2 as base

RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project

RUN mkdir renv
COPY renv.lock .
COPY .Rprofile .
COPY renv/activate.R renv
COPY renv/settings.json renv
RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN R -e "install.packages('renv')"
RUN Rscript -e "renv::restore(prompt = FALSE)"
#&& \
    #Rscript -e "renv::install(c('cardx@0.2.3','broom@1.0.5','broom.helpers@1.17.0','car@3.1-2','parameters@0.20.2')); renv::snapshot(prompt = FALSE)"

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######
FROM --platform=linux/amd64 rocker/tidyverse:4.4.2

WORKDIR /home/rstudio/project
COPY --from=base /home/rstudio/project .

RUN mkdir -p code output data report

COPY Makefile Tianqi_report.Rmd ./
COPY data/ data/

COPY code/ code/
#CMD make && mv Tianqi_report.html report/
RUN chown -R rstudio:rstudio /home/rstudio/project
