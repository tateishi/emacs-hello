export EMACS ?= $(shell which emacs)
CASK_DIR := $(shell cask package-directory)

TESTS ?= $(wildcard tests/test*.elc)

$(CASK_DIR): Cask
	cask install
	@touch $(CASK_DIR)

.PHONY: cask
cask: $(CASK_DIR)

.PHONY: build
build: cask
	cask build

.PHONY: test
test: build
	@echo cask tests
	@cask exec emacs -Q -batch -L . \
	$(addprefix -l ,$(TESTS)) \
	-f ert-run-tests-batch-and-exit
#	cask exec emacs -Q -batch -L . -l test-add -f ert-run-tests-batch-and-exit
