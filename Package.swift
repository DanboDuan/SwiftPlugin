// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Plugin",
    platforms: [.macOS(.v10_15)],
    products: [
        .executable(name: "Example", targets: ["Example"]),
        .library(name: "PluginA", type: .dynamic, targets: ["PluginA"]),
        .library(name: "Plugin", type: .dynamic, targets: ["Plugin"]),
    ],
    dependencies: [
    ],
    targets: [
        .executableTarget(
            name: "Example",
            dependencies: [
                "Plugin",
            ]),
        .target(name: "PluginA",
                dependencies: [
                    "Plugin",
                ]),
        .target(name: "Plugin"),
    ])
