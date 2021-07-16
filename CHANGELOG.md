# Change Log
All notable changes to this project will be documented in this file.
`ADUtils` adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

### Created

- Add a subspec `ADUtils/Security` bundling security related tools.
- Add `PostInstallationKeychainCleaner` using `UserDefaults`to check if keychain has to be wiped at launch
- Add `SecureArchiver`, leveraging `CryptoKit` and the `Keychain` to add an encryption layer to `UserDefaults`

### Fixed

- iOS 14.0+ gives a new property on navigationItem : `backButtonDisplayMode`. `ad_hideBackButtonTitle` now uses it.

## [11.2.0] - 2021-05-18

### Created

- Add SPM support [#21](https://github.com/faberNovel/ADUtils/pull/21) via Alexandre Podlewski

## [11.1.0] - 2021-03-22

### Created

- `verifyOrNil(_:over:)`
- `Optional.verifying(_:)`
- `UIImage.ad_filled(with:size:)`
- `UIButton.ad_setBackgroundColor(:forState:)`
- `UICollectionView.dequeueSupplementaryView<U: ClassIdentifiable>(_:ofKind:at:)` dequeue generic reusable view from `UICollectionView`
- `UICollectionView.register(supplementaryView:kind:)` register generic reusable view from `UICollectionView`
- `HStackView(spacing:alignment:distribution:arrangedSubviews:)`
- `VStackView(spacing:alignment:distribution:arrangedSubviews:)`

### Fixed
- `Debounced` property wrapper no longer has a retain cycle

## [11.0.0] - 2020-06-19

### Created
- `ADUtils` is now usable on extensions
- `UIView.ad_pinToSuperviewSafeAreaLayoutGuide(edges:insets:priority:)`
- `UIView.ad_pinToSuperviewSafeAreaLayoutGuide(insets:priority:)`
- `UIView.ad_pinToSuperviewSafeAreaLayoutGuide()`
- `UIView.ad_pinToSuperviewSafeAreaLayoutGuide(insets:)`
- `UIView.ad_pinToSuperviewSafeAreaLayoutGuide(edges:)`
- `UIView.ad_pinToSuperviewSafeAreaLayoutGuide(edges:insets:)`
- `func ad_centerInSuperviewSafeAreaLayoutGuide(along:priority:)`
- `func ad_centerInSuperviewSafeAreaLayoutGuide(along:)`
- `func ad_centerInSuperviewSafeAreaLayoutGuide(priority:)`
- `func ad_centerInSuperviewSafeAreaLayoutGuide()`
- `ad_constrainInSuperviewSafeAreaLayoutGuide(edges:insets:priority:)`
- `ad_constrainInSuperviewSafeAreaLayoutGuide()`
- `ad_constrainInSuperviewSafeAreaLayoutGuide(insets:)`
- `ad_constrainInSuperviewSafeAreaLayoutGuide(edges:)`
- `ad_constrainInSuperviewSafeAreaLayoutGuide(edges:insets:)`
- `ad_pinToSuperviewSafeAreaLayoutGuide(directionalEdges:insets:priority:)`
- `ad_pinToSuperviewSafeAreaLayoutGuide(insets:priority:)`
- `ad_pinToSuperviewSafeAreaLayoutGuide(insets:)`
- `ad_pinToSuperviewSafeAreaLayoutGuide(directionalEdges:)`
- `ad_pinToSuperviewSafeAreaLayoutGuide(directionalEdges:insets:)`
- `ad_constrainInSuperviewSafeAreaLayoutGuide(directionalEdges:insets:priority:)`
- `ad_constrainInSuperviewSafeAreaLayoutGuide(insets:)`
- `ad_constrainInSuperviewSafeAreaLayoutGuide(directionalEdges:)`
- `ad_constrainInSuperviewSafeAreaLayoutGuide(directionalEdges:insets:)`

### Updated
 - `ProxyDetector` is now created with a `ProxyDetectorWindowProvider` allowing to embed it in extensions

### Fixed

### Removed
- `ADUtils/Swift-ext` and `ADUtils/objc-ext` are no longer supported, as `ADUtils` is now usable on extensions

## [10.5.0] - 2020-06-18

### Created
- Create `UINavigationController.ad_popViewController(animated:completion:)`
- Create methods to set and layout `UITableView` header and footer

## [10.4.0]

### Created
- Create `UIScreen.ad_pixelDimension`
- Create `Optional.get()`
- Create `UINavigationItem.ad_hideBackButtonTitle()`
- Create `UITableView.ad_hideDefaultFooterCells()`
- Create layout functions for iOS and tvOS 13+ using `NSDirectionalRectEdges` and `NSDirectionalEdgeInsets`
- Create `UIViewController.ad_insert(child:in:usingDirectionalEdges:)`
- Create `UIViewController.ad_insert(child:in:usingDirectionalEdges:)`
- Create `UILayoutGuide.ad_pin(to:directionalEdges:insets:priority:)`
- Create `UILayoutGuide.ad_pin(to:directionalInsets:priority:)`
- Create `UILayoutGuide.ad_pin(to:usingDirectionalEdges:)`
- Create `UILayoutGuide.ad_pin(to:directionalEdges:)`
- Create `UILayoutGuide.ad_pin(to:directionalInsets:)`
- Create `UILayoutGuide.ad_pin(to:directionalEdges:insets:)`
- Create `UILayoutGuide.ad_constrain(in:directionalEdges:insets:priority:)`
- Create `UILayoutGuide.ad_constrain(in:usingDirectionalEdges:)`
- Create `UILayoutGuide.ad_constrain(in:directionalInsets:)`
- Create `UILayoutGuide.ad_constrain(in:directionalEdges:)`
- Create `UILayoutGuide.ad_constrain(in:directionalEdges:insets:)`
- Create `UILayoutGuide.constrainInOwningView(directionalEdges:insets:priority:)`
- Create `UILayoutGuide.constrainInOwningView(directionalEdges:insets:)`
- Create `UILayoutGuide.constrainInOwningView(directionalEdges:)`
- Create `UILayoutGuide.constrainInOwningView(directionalInsets:)`
- Create `UILayoutGuide.constrainInOwningView(usingDirectionalEdges:)`
- Create `UILayoutGuide.ad_pinToOwningView(directionalEdges:insets:priority:)`
- Create `UILayoutGuide.constrainInOwningView(directionalEdges:insets:)`
- Create `UILayoutGuide.constrainInOwningView(directionalEdges:)`
- Create `UILayoutGuide.constrainInOwningView(directionalInsets:)`
- Create `UILayoutGuide.constrainInOwningView(usingDirectionalEdges:)`
- Create `UIView.ad_constrainInSuperview(directionalEdges:insets:priority:)`
- Create `UIView.ad_constrainInSuperview(directionalEdges:insets:)`
- Create `UIView.ad_constrainInSuperview(directionalEdges:)`
- Create `UIView.ad_constrainInSuperview(directionalInsets:)`
- Create `UIView.ad_constrainInSuperview(usingDirectionalEdges:)`
- Create `UIView.ad_pinToSuperview(directionalEdges:insets:priority:)`
- Create `UIView.ad_pinToSuperview(directionalEdges:insets:)`
- Create `UIView.ad_pinToSuperview(directionalEdges:priority:)`
- Create `UIView.ad_pinToSuperview(directionalEdges:)`
- Create `UIView.ad_pinToSuperview(directionalInsets:)`
- Create `UIView.ad_pinToSuperview(usingDirectionalEdges:)`
- Create `UIView.ad_pin(to:directionalEdges:insets:priority:)`
- Create `UIView.ad_pin(to:directionalEdges:priority:)`
- Create `UIView.ad_pin(usingDirectionalEdges:)`
- Create `UIView.ad_pin(to:directionalInsets:)`
- Create `UIView.ad_pin(to:directionalEdges:)`
- Create `UIView.ad_pin(to:directionalEdges:insets:)`
- Create `UIView.ad_constrain(in:directionalEdges:insets:priority:)`
- Create `UIView.ad_constrain(usingDirectionalEdges:)`
- Create `UIView.ad_constrain(in:directionalInsets:)`
- Create `UIView.ad_constrain(in:directionalEdges:)`
- Create `UIView.ad_constrain(in:directionalEdges:insets:)`
- Create `NSDirectionalEdgeInsets+Utilities` extension

### Updated
- Add left to right and  right to left tests cases for iOS and tvOS 13+ when layout,  `NSDirectionalRectEdges` and `NSDirectionalEdgeInsets` are involved

## [10.3.0]

### Updated
- Allow user to choose computation type for ad_preferredLayoutSize method

## [10.2.0]

### Created
- Create `UIView.ad_preferredLayoutSize(fittingWidth:)`
- Create `UIView.ad_preferredLayoutSize(fittingHeight:)`
- Create `UICollectionViewCell.ad_preferredCellLayoutSize(fittingWidth:)`
- Create `UICollectionViewCell.ad_preferredCellLayoutSize(fittingHeight:)`
- Create `@Debounced` property wrapper and `Debouncer` class

### Updated
- Remove side effects on contentView when calling `UIView.ad_preferredLayoutHeight(fittingWidth:)`, `UITableViewCell.ad_preferredCellLayoutHeight(fittingWidth:)`, `UICollectionViewCell.ad_preferredCellLayoutHeight(fittingWidth:)` and `UITableViewHeaderFooterView.ad_preferredContentViewLayoutHeight(fittingWidth:)`
- `UICollectionViewCell.ad_preferredCellLayoutHeight(fittingWidth:)` is now deprecated

### Fixed
- `Sequence`: `ad_groupedBy(grouping:)` now uses the `Dictionary(grouping:by:)` function from standard library

## [10.1.0]

### Created
- Utils: create `ad_removeAllArrangedSubviews` and `ad_addArrangedSubviews` methods on `UIStackView`

### Updated
- Project now asks for swift 5.0

### Fixed
- Fixed some warnings regarding missing imports
- Fixed some warnings using @unknown default in enums
- Fixed possible retain cycles on `NavigationControllerObserver`

## [10.0.1]

### Fixed

- `attributedString(arguments:defaultAttributes:differentFormatAttributes:)` handles correctly variable-width unicode characters (like emojis) in the string format

## [10.0.0]

### Updated

- Set minimal requirements to iOS 10.0

### Fixed

- `DynamicFont` is now compliant with App Extensions

## [9.4.0]

### Created

- `MKMapView`: add `dequeueAnnotationView<U: MKAnnotationView>(annotationView:, annotation:) -> U` to dequeue `MKAnnotationView`s similarly to cells and headers in `Table|CollectionView`

### Updated

- Dequeuing methods for `UITableView` and `UICollectionView` now have an optional parameter to indicate the class of the dequeued element, allowing to write for instance `let cell = tableView.dequeue(SomeTableViewCell.self, at: indexPath)` instead of `let cell: SomeTableViewCell = tableView.dequeue(at: indexPath)`

## [9.3.0]

### Created

- `JSONDecoder` and `PropertyListDecoder`: add `ad_safelyDecodeArray<T>(of type: T.Type, from data: Data)` to decode a top-level array of values of the given type from the given JSON representation. If the decoding of a value fails, it is ignored and will not be present in the final array
- `KeyedDecodingContainer`: add `ad_safelyDecodeArray<T>(of type: T.Type, forKey key: KeyedDecodingContainer.Key)` to decode an array of values of the given type for the given key. If the decoding of a value fails, it is ignored and will not be present in the final array
- `Collection` of `NSLayoutConstraint`: add `activate()` which activate each constraint in the collection
- `Collection` of `NSLayoutConstraint`: add `deactivate()` which deactivate each constraint in the collection

## [9.2.0]

### Created

- `UIViewController`: add `ad_insert(child:in:)` to insert a child viewController in a layoutGuide instead of a view
- `NSLayoutConstraint`: add `priority(_:)` that returns the constraint with the given priority
- `UILayoutPriority`: add `applyIfPossible` which is `.required - 1`
- `UITableViewHeaderFooterView`: add `ad_preferredContentViewLayoutHeight(fittingWidth:)`
- `UILayoutGuide`: add `ad_pinTo(_: edges: UIRectEdge, insets: UIEdgeInsets, priority: UILayoutPriority)`
- `UILayoutGuide`: add `ad_center(in: along axis: NSLayoutConstraint.Axis, priority: UILayoutPriority)`
- `UILayoutGuide`: add `ad_constrain(in: edges: UIRectEdge, insets: UIEdgeInsets, priority: UILayoutPriority)`
- `UILayoutGuide`: add `ad_constrain(to size: CGSize, priority: UILayoutPriority)`

### Fixed

- Update pods for Xcode 10.2

## [9.1.0]

### Created

- `UIView`: Add missing method `ad_pinToLayoutGuide:insets:priority:`
- `UILayoutGuide`: add `ad_pinToOwningView(edges: UIRectEdge, insets: UIEdgeInsets, priority: UILayoutPriority)`
- `UILayoutGuide`: add `ad_centerInOwningView(along axis: NSLayoutConstraint.Axis, priority: UILayoutPriority)`
- `UILayoutGuide`: add `ad_constrainInOwningView(edges: UIRectEdge, insets: UIEdgeInsets, priority: UILayoutPriority)`
- `UILayoutGuide`: add `ad_constrain(to size: CGSize, priority: UILayoutPriority)`

### Updated

- Layout: method creating constraints now return an array containing thoses constraints as `@discardableResult`

## [9.0.0]

### Created

- Layout: create `ad_constrainInSuperview(edges:insets:priority:)`
- LayoutGuide: create `ad_pin(to:edges:insets:priority:)`, `ad_center(in:along:priority:)`, `ad_center(in:priority:)`, `ad_constrain(in:edges:insets:priority:)`
- `UIEdgeInsets`: add `init(top:)`, `init(bottom:)`, `init(left:)`, `init(right:)`
- Utils: create `ad_isBlank` method on `String?`
- `Sequence`: create `ad_groupedBy(grouping:)` method

### Updated

- `DeselectableView`: rename `smoothlyDeselectItems` to `ad_smoothlyDeselectItems` and make `DeselectableView` protocol private
- Layout: rename `ad_constraint(to:with:)` to `ad_constrain(to:priority:)`
- Layout: rename `ad_centerInSuperview(with:)` to `ad_centerInSuperview(priority:)` and `ad_centerInSuperview(along:with:)` to `ad_centerInSuperview(along:priority:)`
- `UIEdgeInsets`: rename `horizontal` and `vertical` properties to `totalHorizontal` and `totalVertical`

### Fixed

- Add missing unit tests (Swift & ObjC)

## [8.0.0]

### Created

- Create `UICollectionViewCell.ad_preferredCellLayoutHeight(fittingWidth:)`

### Updated

- Swift 4.2 support

### Removed

- Remove `EnumCollection` with Swift 4.2

### Fixed

- Fix layout tests

## [7.2.1]

### Fixed
- `ad_filter(query:keyPath:)` now performs search insensitively to diacritics on iOS9+

## [7.2.0]

- `NavigationControllerObserver`: add methods to stop observing view controllers

## [7.1.0]

### Added

- Add objc methods from DeselectableView UITableView and UICollectionView implementations.
- Create subspecs to be used in application extension, removing application related code.

## [7.0.2]

### Added

- Add documentation, readme, licence for opensource purpose.

### Updated

- Pod source is now on Github.

## [7.0.1]

### Fixed
- `attributedString(arguments:defaultAttributes:differentFormatAttributes:)` handles array of arguments bigger than 9 elements

## [7.0.0]

### Updated
- `ad_fromNib` is not optional anymore, meaning we do not have to specify the return type

## [6.0.0]

### Updated
- `ad_fromNib` type inference comes from the calling class instead of the generic return type

## [5.2.0]

### Added
- Utils: `ad_filter(query: String, for keyPaths: [KeyPath<Element, String>])` to filter an array with a query (e.g search bar content) for specified keypaths.

## [5.1.1]

### Updated

- Fixed some deprecation warnings

## [5.1.0]

### Added

- PropertyListArchiver: the PropertyListArchiver enables to set primitive types values for a given key and read them as well

## [5.0.1]

### Fixed

- Layout: `ad_constraint(to size: CGSize)` second item is now nil as supposed to for height and width constraints
- Layout: `ad_constraint(to size: CGSize)` second attribute is now notAnAttribute as supposed to for height and width constraint

## [5.0.0]

### Added
- Layout: `UITableViewCell.ad_preferredCellLayoutHeight(fittingWidth: CGFloat)` calculates the height of the cell content view
- Layout: `UIView.ad_preferredLayoutHeight(fittingWidth:)` and `UIView.ad_preferredLayoutWidth(fittingHeight:)`

### Removed
- `UIView.ad_preferredLayoutSize(fittingSize:lockDirections:)`

## [4.5.1]

### Added
- `DynamicFont` is now able to use system font inside `FontDescription`

## [4.5.0]

### Added
- Add `ad_localizedUppercaseString` and `localized` for Objective-C files

## [4.4.0]

### Added
- Layout: `ad_centerInSuperview(along axis:UILayoutConstraintAxis)` creates a constraint between centerX/Y anchors of a view and its superView
- Layout: `ad_centerInSuperView()` creates constraints to center a view in its superview along both axes
- Layout: `ad_constraint(to size:CGSize)` constraints a view width and height with the provided size
- Layout: All method that create constraints now enable to take a priorityLayout parameter (default is `UILayoutPriority.required`)
- `PropertyListArchiver`: `array(for key: String)` decodes data for key and returns an empty array if no data is found
- Unit tests are run to validate every commit

### Removed

### Fixed

- Unit tests: Fix `PropertyListArchiver` unit tests
- Do not notify proxy on simulator
- `NavigationControllerObserver`: fix a bug where bookeeping was done too late and view controller was not observed anymore

## [4.3.0]

### Added

- Use `Decodable` instead of `PropertyListReadable` in `PropertyListArchiver`
- Add `center` to `CGRect`

### Removed

### Fixed

## [4.2.0]

### Added
- `DynamicFontProvider`: an helper to provide dynamic type with custom font before iOS 11

### Updated

### Removed

### Fixed

## [4.1.0]

### Added
- `ProxyDetector`: Provide a way to notify the user if a proxy is running on the phone

### Updated
- `ad_localizedUppercaseString` is now deprecated after iOS 9

### Removed

### Fixed

## [4.0.0]

### Added

### Updated
- Swift 4 support

### Removed

### Fixed

## [3.6.0]

### Added
- `NavigationControllerObserver`:  The `NavigationControllerObserver` class provides a simple API to observe the pop transitions that occur in a navigationController stack.
One drawback of `UINavigationController` is that its delegate is shared among multiple view controllers and this requires a lot of bookkeeping to register multiple delegates.
`NavigationControllerObserver` allows to register a delegate per viewController we want to observe.
What's more the class provides a navigationControllerDelegate property used to forward all the `UINavigationControllerDelegate` methods to another navigationController delegate if need be.
- important: The `NavigationControllerObserver` will observe only *animated* pop transitions. Indeed, if you call `popViewController(animated: false)` you won't be notified.

### Updated

### Removed

### Fixed

## [3.5.0]

### Added
- UIView + preferred layout size: Provides the preferred layout size for the view, this is the smallest size the view and its content can fit. You should populate the view before calling this method
- Optional + unwrap: Provides syntactic sugar to unwrap and execute a closure with an optional
- Add parameters owner and bundle in `ad_fromNib` method

### Updated

### Removed

### Fixed
