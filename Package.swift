// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "MpyaUI",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v12),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "MpyaUI",
            targets: ["MpyaUI"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "MpyaUI",
            dependencies: [],
            plugins: ["AssetCodeGenerator"]),
        .executableTarget(name: "ImageCodeGenExec"),
        .executableTarget(name: "ColorCodeGenExec"),
        .plugin(name: "AssetCodeGenerator", capability: .buildTool(), dependencies: ["ImageCodeGenExec", "ColorCodeGenExec"])
    ]
)
