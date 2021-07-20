//
//  FloatingAccessoryCollectionViewCell.swift
//  ADUtils
//
//  Created by Thomas Esterlin on 20/07/2021.
//

import UIKit

@available(iOS 13.0, *)
class FloatingAccessoryCollectionViewCell: UICollectionViewCell {

    private var separatorView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - Public

    func configure(with item: FloatingAccessoryButtonItem, borderColor: UIColor) {
        contentView.addSubview(item.button)
        separatorView.backgroundColor = borderColor
        item.button.ad_pinToSuperview()
    }

    func showSeparator(_ enabled: Bool) {
        separatorView.isHidden = !enabled
    }

    // MARK: - Private

    private func setup() {
        backgroundColor = .clear
        separatorView = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: bounds.width,
                height: 2.0 / UIScreen.main.scale
            )
        )
        addSubview(separatorView)
        let leadingConstraint = NSLayoutConstraint(
            item: separatorView,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1,
            constant: 0
        )
        let trailingConstraint = NSLayoutConstraint(
            item: separatorView,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailing,
            multiplier: 1,
            constant: 0
        )
        let bottomConstraint = NSLayoutConstraint(
            item: separatorView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self,
            attribute: .bottom,
            multiplier: 1,
            constant: 0
        )
        self.addConstraints([leadingConstraint, trailingConstraint, bottomConstraint])
    }

}
