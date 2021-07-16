![ADUtils: UIKit and Swift toolbox](https://raw.githubusercontent.com/faberNovel/ADUtils/master/ADUtils.jpg)

[![CocoaPods](https://img.shields.io/cocoapods/v/ADUtils.svg?style=flat)](https://github.com/faberNovel/ADUtils)
![Language](https://img.shields.io/badge/language-Swift%204-orange.svg)
[![Platform](https://img.shields.io/cocoapods/p/ADUtils.svg?style=flat)](https://github.com/faberNovel/ADUtils)
![License](https://img.shields.io/github/license/faberNovel/ADUtils.svg?style=flat)
[![Twitter](https://img.shields.io/badge/twitter-@FabernovelTech-blue.svg?style=flat)](https://twitter.com/FabernovelTech)
![](https://github.com/faberNovel/ADUtils/workflows/CI/badge.svg)

ADUtils is a set of helpers, shortcuts or other tools providing simplified interactions with UIKit and more generally with Swift.

- [Features](#features)
  - [ADUtils](#adutils)
  - [ADUtils/Security](#adutilssecurity)
- [Requirements](#requirements)
- [Communication](#communication)
- [Installation](#installation)
  - [CocoaPods](#cocoapods)
- [Credits](#credits)
- [License](#license)

## Features

### ADUtils

- [x] Swift syntaxic sugar (object synchronization [(src)](Modules/ADUtils/AnyObject+Synchronize.swift), array filtering [(src)](Modules/ADUtils/Array+Filter.swift), optionnal unwrapping [(src)](Modules/ADUtils/Optional+Unwrap.swift))
- [x] Table and Collection views smooth deselection [(src)](Modules/ADUtils/DeselectableView.swift)
- [x] Table and Collection view syntaxic sugar [(src)](Modules/ADUtils/RegisterableView.swift)
- [x] Font wrapper for `Dynamic type` support [(src)](Modules/ADUtils_noext/DynamicFont.swift)
- [x] [UINavigationController observation](https://en.fabernovel.com/insights/dev-en/coordinators-and-back-button) [(src)](Modules/ADUtils/NavigationControllerObserver.swift)
- [x] View nib instanciation [(src)](Modules/ADUtils/UIView+NibLoader.swift)
- [x] ViewController child insertion [(src)](Modules/ADUtils/UIViewController+ChildInsertion.swift)
- [x] Struct `UserDefaults` storage [(src)](Modules/ADUtils/PropertyListArchiver.swift)
- [x] Attributed String multi attributes helper [(src)](Modules/ADUtils/String+AttributedFormat.swift)
- [x] String localization syntaxic sugar [(src)](Modules/ADUtils/String+Localization.swift)
- [x] `UIView` (particularly `UITableViewCell`) size computation [(src)](Modules/ADUtils/UIView+PreferredLayoutSize.swift) [(src)](Modules/ADUtils/UITableViewCell+PreferredLayoutHeight.swift)
- [x] On device proxy detection [(src)](Modules/ADUtils_noext/ProxyDetector.swift)
- [x] Core Graphic geometry utility [(src)](Modules/ADUtils/Geometry+Utilities.swift)
- [x] Constraints and insets utility [(src)](Modules/ADUtils/UIView+Constraints.swift) [(src)](Modules/ADUtils/UIEdgeInsets+Utilities.swift)

### ADUtils/Security

- [x] Wipe Keychain on first post installation launch [(src)](Modules/ADUtils_security/PostInstallationKeychainCleaner.swift)
- [x] Encrypt `UserDefaults` with a key stored inside the `Keychain` [(src)](Modules/ADUtils_security/SecureArchiver.swift)

## Requirements

- iOS 10.0+ / tvOS 10.0+
- Swift 5

## Communication

- If you **need help**, use [Twitter](https://twitter.com/FabernovelTech).
- If you'd like to **ask a general question**, use [Twitter](https://twitter.com/FabernovelTech).
- If you'd like to **apply for a job**, visit [https://careers.fabernovel.com/](https://careers.fabernovel.com/).
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate ADUtils into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'ADUtils', '~> 10.0'
end
```

The defaults subspec in `ADUtils` encompass swift and objective C regular toolbox, to add the security toolbox specifying `ADUtils/Security` is necessary.

Then, run the following command:

```bash
$ pod install
```

## Credits

ADUtils is owned and maintained by [Fabernovel](https://www.fabernovel.com/). You can follow us on Twitter at [@Fabernovel](https://twitter.com/FabernovelTech).


## License

ADUtils is released under the MIT license. [See LICENSE](LICENSE) for details.
