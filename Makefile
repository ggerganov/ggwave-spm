default: build-submodule

.PHONY:
update-submodule:
	# create a clean (maybe updated) copy of ggwave
	rsync ../../include Sources/ggwave/
	rsync ../../src/ggwave.cpp Sources/ggwave/
	rsync ../../src/reed-solomon Sources/ggwave/

SOURCES := $(shell find Sources/ -print)
.build: $(SOURCES)
	swift build -Xcxx -std=c++11

.PHONY:
build-submodule: update-submodule Package.swift .build

.PHONY:
build: Package.swift .build

clean:
	rm -rf .build
