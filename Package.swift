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
        .target(name: "ggwave", dependencies:[]),
        .target(name: "objc-exec", dependencies:["ggwave"]),
        .target(name: "swift-exec", dependencies:["ggwave"])
    ]
)
