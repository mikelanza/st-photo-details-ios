# STPhotoDetails - iOS

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/mikelanza/st-photo-details-ios/blob/master/LICENSE)

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

**STPhotoDetails** is an iOS framework designed to display details of photos from [Streetography](https://streetography.com). It is used in the [STPhotoMap - iOS](https://github.com/mikelanza/st-photo-map-ios) framework.

- [Screenshots](#screenshots)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Screenshots

<img src="https://user-images.githubusercontent.com/6670019/65861801-9dd26180-e375-11e9-97bb-292ea710d797.png" width="50%"></img> 

## Requirements

- iOS 11.0+ / Mac OS X 10.10+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 10.0+

## Installation

### Dependency Managers
<details>
  <summary><strong>CocoaPods</strong></summary>

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate **STPhotoDetails** into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

pod 'STPhotoDetails', '~> 0.1.0'
```

Then, run the following command:

```bash
$ pod install
```

</details>

<details>
  <summary><strong>Carthage</strong></summary>

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate **STPhotoDetails** into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "mikelanza/st-photo-details-ios" ~> 0.1.0
```

</details>

<details>
  <summary><strong>Swift Package Manager</strong></summary>

To use **STPhotoDetails** as a [Swift Package Manager](https://swift.org/package-manager/) package just add the following in your Package.swift file.

``` swift
// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "HelloSTPhotoDetails",
    dependencies: [
        .package(url: "https://github.com/mikelanza/st-photo-details-ios.git", .upToNextMajor(from: "0.1.0"))
    ],
    targets: [
        .target(name: "HelloSTPhotoDetails", dependencies: ["STPhotoDetails"])
    ]
)
```
</details>

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate **STPhotoDetails** into your project manually.

<details>
  <summary><strong>Git Submodules</strong></summary><p>

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add **STPhotoDetails** as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/mikelanza/st-photo-details-ios.git
$ git submodule update --init --recursive
```

- Open the new `STPhotoDetails` folder, and drag the `STPhotoDetails.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `STPhotoDetails.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `STPhotoDetails.xcodeproj` folders each with two different versions of the `STPhotoDetails.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from.

- Select the `STPhotoDetails.framework`.

- And that's it!

> The `STPhotoDetails.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

</p></details>

<details>
  <summary><strong>Embedded Binaries</strong></summary><p>

- Download the latest release from https://github.com/mikelanza/st-photo-details-ios/releases
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- Add the downloaded `STPhotoDetails.framework`.
- And that's it!

</p></details>

## Usage

See the [STPhotoMap - iOS](https://github.com/mikelanza/st-photo-map-ios) framework for usage.

## Contributing

Issues and pull requests are welcome!

## Author

[Streetography](https://streetography.com)

## License

**STPhotoDetails** is released under the MIT license. See [LICENSE](https://github.com/mikelanza/st-photo-details-ios/blob/master/LICENSE) for details.
