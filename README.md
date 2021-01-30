# ggwave-spm

ggwave package for the Swift Package Manager

## Using as a package in your project

In XCode: File -> Swift Packages -> Add Package Dependency

Enter package URL: `https://github.com/ggerganov/ggwave-spm`

## Build package from command line

```bash
git clone https://github.com/ggeragnov/ggwave-spm
cd ggwave-spm

# if building standalone
make build

# if building as a submodule for ggwave
make build-submodule

# run tests
.build/debug/test-objc
.build/debug/test-swift
```
