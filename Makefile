IMAGE := aleph-builder.sif
DEF := aleph-builder.def
PREFIX := $(HOME)/.local/bin
INSTALL_NAME := aleph-builder

.PHONY: all build run install clean

all: build

build: $(IMAGE)

$(IMAGE): $(DEF)
	singularity build --force -f $@ $<

run: $(IMAGE)
	singularity run $(IMAGE)

install: $(IMAGE)
	install -d $(PREFIX)
	install -m 755 $(IMAGE) $(PREFIX)/$(INSTALL_NAME)

clean:
	rm -f $(IMAGE)
