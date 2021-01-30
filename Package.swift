// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "ggwave",
    products: [
        .library(
            name: "ggwave",
            targets: ["ggwave"]),
    ],
    targets: [
        .target(name: "ggwave", dependencies:[], exclude: ["reed-solomon"]),
        .target(name: "test-objc", dependencies:["ggwave"]),
        .target(name: "test-swift", dependencies:["ggwave"])
    ],
    cxxLanguageStandard: CXXLanguageStandard.cxx11
)
