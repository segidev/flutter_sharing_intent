// swift-tools-version: 5.9
// Flutter looks for the manifest at ios/<plugin_name>/Package.swift.

import PackageDescription

let package = Package(
    name: "flutter_sharing_intent",
    platforms: [
        .iOS("12.0"),
    ],
    products: [
        .library(name: "flutter-sharing-intent", targets: ["flutter_sharing_intent"]),
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
    ],
    targets: [
        .target(
            name: "flutter_sharing_intent",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy"),
            ],
            swiftSettings: [
                // Xcode 16 defaults to Swift 6 strict concurrency; keep Swift 5 mode
                // for the existing completion-handler and DispatchSemaphore code.
                .swiftLanguageVersion(.v5),
            ]
        ),
    ]
)
