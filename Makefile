LATEX=rubber --into=${dir}
SHELL=/bin/zsh
FILE=${dir}/main.tex
SRC_DIR:=$(shell pwd)

compile: ${dir}/custom.sty
	$(LATEX) --pdf $(FILE)

clean:
	$(LATEX) --clean $(FILE)
	rm ${dir}/custom.sty


${dir}/custom.sty: custom.sty
	ln -s $(SRC_DIR)/custom.sty $(SRC_DIR)/${dir}/custom.sty


watch:
	@while [ 1 ]; do; 			\
		inotifywait $(FILE); 	\
		sleep 0.01; 			\
		make compile; 			\
		make clean; 			\
		done

.PHONY: clean
