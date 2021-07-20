//
//  FloatingAccessoryView.swift
//  FloatingAccessoryView
//
//  Created by Thomas Esterlin on 16/07/2021.
//

import Foundation

@available(iOS 13.0, *)
private enum Constants {
    static let collectionViewCellWidth = 48.0
    static let paddingTopBottom: CGFloat = 4.0
    static let collectionViewBorderRadius = 8.0
}

@available(iOS 13.0, *)
private enum Colors {
    static var initialTintColor: UIColor {
        return UIColor { (traits) -> UIColor in
            return traits.userInterfaceStyle == .dark ?
                .white :
                .systemBlue
        }
    }
    static var initialBorder: UIColor {
        return UIColor { (traits) -> UIColor in
            return traits.userInterfaceStyle == .dark ?
                UIColor(red: 73 / 255, green: 74 / 255, blue: 75 / 255, alpha: 1.0) :
                UIColor(red: 235 / 255, green: 233 / 255, blue: 228 / 255, alpha: 1.0)
        }
    }
    static var initialBackground: UIColor {
        return UIColor { (traits) -> UIColor in
            return traits.userInterfaceStyle == .dark ?
                UIColor(red: 58 / 255, green: 59 / 255, blue: 61 / 255, alpha: 1.0) :
                UIColor(red: 254 / 255, green: 252 / 255, blue: 247 / 255, alpha: 1.0)
        }
    }
}

@available(iOS 13.0, *)
public class FloatingAccessoryView: UIView,
                                    UICollectionViewDataSource,
                                    UICollectionViewDelegateFlowLayout {

    public var borderTintColor: UIColor = Colors.initialBorder {
        didSet {
            collectionView.reloadData()
        }
    }

    override public var backgroundColor: UIColor? {
        get {
            return collectionView.backgroundColor
        }
        set {
            collectionView.backgroundColor = newValue
        }
    }

    private var items: [FloatingAccessoryButtonItem] = []
    private let layout = UICollectionViewFlowLayout()
    private var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())

    // MARK: - Lifecycle

    public init() {
        super.init(
            frame: CGRect(
                x: 0,
                y: 0,
                width: Constants.collectionViewCellWidth,
                height: Constants.collectionViewCellWidth
            )
        )
        setup()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        self.frame = CGRect(
            x: 0,
            y: 0,
            width: Constants.collectionViewCellWidth,
            height: Constants.collectionViewCellWidth * Double(items.count)
        )
        collectionView.frame = self.bounds
        setupShadow()
    }

    // MARK: - Public

    public func addItem(_ item: FloatingAccessoryButtonItem) {
        items.append(item)
        collectionView.reloadData()
    }

    // MARK: - UICollectionViewDataSource

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let optionalCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "FloatingAccessoryCollectionViewCell",
            for: indexPath
        ) as? FloatingAccessoryCollectionViewCell
        if let cell = optionalCell {
            let correspondingBarButtonItem = items[indexPath.row]
            cell.configure(with: correspondingBarButtonItem, borderColor: self.borderTintColor)
            cell.showSeparator(indexPath.row > 0)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width)
    }

    // MARK: - Private

    private func setup() {
        backgroundColor = .clear
        tintColor = Colors.initialTintColor
        collectionView.backgroundColor = Colors.initialBackground
        collectionView.layer.cornerRadius = CGFloat(Constants.collectionViewBorderRadius)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            FloatingAccessoryCollectionViewCell.self,
            forCellWithReuseIdentifier: "FloatingAccessoryCollectionViewCell"
        )
        collectionView.setCollectionViewLayout(layout, animated: false)
        addSubview(collectionView)
        collectionView.ad_pinToSuperview(
            insets: UIEdgeInsets(
                horizontal: Constants.paddingTopBottom,
                vertical: Constants.paddingTopBottom
            )
        )
    }

    private func setupShadow() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = CGFloat(Constants.collectionViewBorderRadius)
        layer.shadowOffset = CGSize(width: 0.1, height: 0.1)
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }

}
