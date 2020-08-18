// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Necromancer",
    platforms: [.macOS(.v10_12),
    .iOS(.v10),
    .tvOS(.v10),
    .watchOS(.v3)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(name: "Necromancer", targets: ["Necromancer"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "SwiftyBeaver", url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", from: "1.8.4"),
        .package(name: "Alamofire", url: "https://github.com/Alamofire/Alamofire.git", from: "5.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Necromancer",
            dependencies: [.product(name: "SwiftyBeaver", package: "SwiftyBeaver"),
                           .product(name: "Alamofire", package: "Alamofire")]),
        .testTarget(
            name: "NecromancerTests",
            dependencies: ["Necromancer"]),
    ]
)
