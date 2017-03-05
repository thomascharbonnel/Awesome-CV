.PHONY: all

CC = lualatex
ENGLISH_DIR = english
FRENCH_DIR = french
RESUME_DIR = resume
CV_DIR = cv
ENGLISH_RESUME_SRCS = $(shell find $(ENGLISH_DIR)/$(RESUME_DIR) -name '*.tex')
ENGLISH_CV_SRCS = $(shell find $(ENGLISH_DIR)/$(CV_DIR) -name '*.tex')

all: english french

english: $(foreach x, english_resume english_cv english_coverletter, $x)

english_resume: $(ENGLISH_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(ENGLISH_DIR) $<

english_cv: $(ENGLISH_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(ENGLISH_DIR) $<

english_coverletter: $(ENGLISH_DIR)/coverletter.tex
	$(CC) -output-directory=$(ENGLISH_DIR) $<

FRENCH_RESUME_SRCS = $(shell find $(FRENCH_DIR)/$(RESUME_DIR) -name '*.tex')
FRENCH_CV_SRCS = $(shell find $(FRENCH_DIR)/$(CV_DIR) -name '*.tex')

french: $(foreach x, french_resume french_cv french_coverletter, $x)

french_resume: $(FRENCH_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(FRENCH_DIR) $<

french_cv: $(FRENCH_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(FRENCH_DIR) $<

french_coverletter: $(FRENCH_DIR)/coverletter.tex
	$(CC) -output-directory=$(FRENCH_DIR) $<

clean:
	rm -rf $(ENGLISH_DIR)/*.pdf $(FRENCH_DIR)/*.pdf
