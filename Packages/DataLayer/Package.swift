// swift-tools-version: 6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let swiftSettings: [SwiftSetting] = [
    .enableUpcomingFeature("ApproachableConcurrency")
]

let package = Package(
    name: "DataLayer",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DataLayer",
            targets: ["DataLayer"]
        ),
    ],
    dependencies: [.package(path: "../Domain"), .package(path: "../Core")],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DataLayer",
            dependencies: [
                .product(name: "Networking", package: "Core"),
                .product(name: "Persistence", package: "Core"),
                "Domain"
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "DataLayerTests",
            dependencies: ["DataLayer"],
            swiftSettings: swiftSettings
        ),
    ]
)
