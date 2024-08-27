// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "YQLogger",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "YQLogger",
            targets: [
                "YQLogger"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.6.1"),
    ],
    targets: [
        .target(
            name: "YQLogger",
            dependencies: [
                .product(name: "Logging", package: "swift-log")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)

