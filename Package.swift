// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Hvala",
    products: [
        .executable(
            name: "Hvala",
            targets: ["Hvala"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.7.0"),
        .package(name: "SplashPublishPlugin", url: "https://github.com/johnsundell/splashpublishplugin.git", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "Hvala",
            dependencies: ["Publish", "SplashPublishPlugin"]
        )
    ]
)
