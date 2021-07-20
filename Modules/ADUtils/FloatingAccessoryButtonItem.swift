//
//  SideBarButtonItem.swift
//  FloatingAccessoryView
//
//  Created by Thomas Esterlin on 18/07/2021.
//

import Foundation

@available(iOS 13, *)
public class FloatingAccessoryButtonItem: UIControl {

    private var _button: UIButton

    public var image: UIImage {
        get {
            return _button.image(for: .normal) ?? UIImage()
        }
        set {
            self._button.setImage(newValue, for: .normal)
        }
    }

    public var button: UIButton {
        return _button
    }

    override public var tintColor: UIColor? {
        get {
            return _button.tintColor
        }
        set {
            _button.tintColor = newValue
        }
    }

    public init(image: UIImage) {
        self._button = UIButton()
        super.init(frame: CGRect())
        setupButton(image: image)
    }

    public init(systemName: String) {
        self._button = UIButton()
        super.init(frame: CGRect())
        setupButton(image: UIImage(systemName: systemName))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        _button.addTarget(target, action: action, for: controlEvents)
    }

    // MARK: - Private

    private func setupButton(image: UIImage?) {
        _button.setTitle("", for: .normal)
        _button.setImage(image, for: .normal)
        _button.imageView?.ad_pinToSuperview(insets: UIEdgeInsets(horizontal: 8.0, vertical: 8.0))
        _button.imageView?.contentMode = .scaleAspectFit
    }
}
