Tianqi_report.html: Tianqi_report.Rmd code/04_render_report.R  Clean_data Tables Figures Model
	Rscript code/04_render_report.R
Clean_data:
	Rscript code/00_clean_data.R
	
Tables:
	Rscript code/01_make_tables.R

Figures:
	Rscript code/02_make_figures.R

Model:
	Rscript code/03_make_model.R

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f *.html  && rm -f output/*.png && rm -f .pdf
	
project image: 
	docker build -t gracexyy/final_report:latest .
	
run report:	
	docker run -v "$$(pwd)/report":/home/rstudio/project/report gracexyy/final_report:latest

