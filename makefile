.PHONY: htmls

htmls: lectures/00_introduction.html\
		lectures/01_rstudio.html\
		lectures/02_basic_R.html\
		lectures/03_project.html\
		lectures/04_load_data.html\
		lectures/05_process_data.html\
		lectures/06_table1.html\
		lectures/07_others.html

lectures/%.html: lectures/%.qmd
	quarto render $<