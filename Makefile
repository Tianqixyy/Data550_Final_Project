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
	
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html  && rm -f output/*.png && rm -f .pdf