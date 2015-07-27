EQUIV_DIRS = worker contestant

all: $(EQUIV_DIRS)

$(EQUIV_DIRS):
	cd $@ && for i in *.control ; do equivs-build $$i || exit $$? ; done

upload:
	@echo NOTE: Only use this command after having built the packages.
	./upload.sh $(foreach dir,$(EQUIV_DIRS),$(wildcard $(dir)/*.deb))

.PHONY: $(EQUIV_DIRS)
