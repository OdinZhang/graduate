latex = latexmk --synctex=1 --interaction=nonstopmode --file-line-error --pdf --xelatex
latex_imges = latexmk --synctex=1 --interaction=nonstopmode --file-line-error --pdf --xelatex --outdir=./images

all: M-P_nn_model.pdf ReLU.pdf Sigmoid.pdf word2vec.pdf
	$(latex) main.tex

M-P_nn_model.pdf:
	$(latex_imges)  M-P_nn_model.tex

ReLU.pdf:
	$(latex_imges)  ReLU.tex

Sigmoid.pdf:
	$(latex_imges)  Sigmoid.tex

word2vec.pdf:
	$(latex_imges)  word2vec.tex

.PHONY: clean
clean:
	latexmk -c
	cd images && latexmk -c