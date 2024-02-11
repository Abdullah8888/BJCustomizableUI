// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BJCustomizableUI",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BJCustomizableUI",
            targets: ["BJCustomizableUI"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "BJCustomizableUI",
            path: "BJCustomizableUI",
            exclude: ["Resources/Images"],
            resources: [
                .copy("Resources/MImages.xcassets"),
                .copy("Resources/MyImages.bundle"),
                .copy("Resources/Fonts")
            ]),
        .testTarget(
            name: "BJCustomizableUITests",
            dependencies: ["BJCustomizableUI"]),
    ]
)
