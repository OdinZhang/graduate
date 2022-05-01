latex = latexmk --synctex=1 --interaction=nonstopmode --file-line-error --pdf --xelatex
latex_images = latexmk --synctex=1 --interaction=nonstopmode --file-line-error --pdf --xelatex --outdir=./images

all: M-P_nn_model.pdf ReLU.pdf Sigmoid.pdf word2vec.pdf model.pdf fm.pdf deep.pdf
	$(latex) main.tex

M-P_nn_model.pdf:
	$(latex_images)  M-P_nn_model.tex

ReLU.pdf:
	$(latex_images)  ReLU.tex

Sigmoid.pdf:
	$(latex_images)  Sigmoid.tex

word2vec.pdf:
	$(latex_images)  word2vec.tex

model.pdf:
	$(latex_images) model.tex

fm.pdf:
	$(latex_images) fm.tex

deep.pdf:
	$(latex_images) deep.tex

.PHONY: clean
clean:
	latexmk -c
	cd images && latexmk -c