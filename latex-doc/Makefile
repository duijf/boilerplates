# Set the default task to build all PDFs
.DEFAULT_GOAL := all

PDFs = doc.pdf

# Phony targets are targets that don't correspond to a file. When these are
# used, Make doesn't expect to eventually build a file from them. When another
# target depends on them, it effectively depends on something that is always
# out of date.
#
# In this Makefile, we use the FORCE target as a phony to instruct Make to
# always build a file.
.PHONY: FORCE

# `%` is a so-called 'pattern-rule' which allows us to use dynamic names for
# targets and dependencies. Instead of having to create a rule to turn each
# .tex file into a corresponding pdf, we remove the duplication with `%`.
#
# Typing `make slides.pdf` is matched by this rule. We depend on another
# pattern rule `%.tex` so we can use `$<` in our command, which is the name of
# the first dependency.
#
# We also depend on FORCE, becaues we want to run the corresponding command
# everytime we request this target to be built. This means we let `latexrun`
# determine whether stuff is out of date.
%.pdf: %.tex FORCE ## Build pdf files from tex sources.
		@echo "==> Building PDF"
		@latexrun --latex-cmd xelatex $<

# This target builds all pdf files that we have put in the variable `PDFs`.
# Make uses the pattern-rule that we defined above to figure out dependencies
# and what command to run.
all: $(PDFs) ## Compile all tex files in the PDFs make var.

.PHONY: clean
clean: ## Clean all build files
		@echo "==> Cleaning up LaTeX files"
		@latexrun --clean-all

.PHONY: refresh-view
refresh-view: ## Refresh MuPDF
		@echo "==> Refreshing viewer"
		@pkill -HUP mupdf

# Pattern target to build and open a PDF file. `make view-slides` will build
# `slides.pdf` and open it with MuPDF
.PHONY: view-%
view-%: %.pdf ## Open a PDFs in MuPDF
		@echo "==> Opening MuPDF"
		@mupdf $< &

.PHONY: watch-%
watch-%: view-% ## Rebuild project on source file changes
		@echo "==> Setting up watches"
		@ls -d *.tex | entr sh -c 'make $*.pdf && make refresh-view' | grep -v 'make\[1\]'
