// swift-tools-version:5.0
//
//  STPhotoDetails.swift
//  STPhotoDetails
//
//  Created by Streetography on 01/04/19.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "STPhotoDetails",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_10),
        .tvOS(.v9),
        .watchOS(.v2),
    ],
    products: [
        .library(
            name: "STPhotoDetails",
            targets: ["STPhotoDetails"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "STPhotoDetails",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "STPhotoDetailsTests",
            dependencies: ["STPhotoDetails"],
            path: "Tests"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
