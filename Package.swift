// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreModule",
    platforms: [
        .iOS(.v15) // ✅ Spécifie que le module supporte iOS 13 minimum
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CoreModule",
            targets: ["CoreModule"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hmlongco/Factory.git", from: "2.3.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.7.0")
    ],
    targets: [
        .target(
            name: "CoreModule",
            dependencies: ["Factory", "Alamofire"]
        ),
        .testTarget(
            name: "CoreModuleTests",
            dependencies: ["CoreModule"]
        ),
    ]
)
