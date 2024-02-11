//
//  BJTextField.swift
//  BJCustomizableUI
//
//  Created by Abdullah on 11/02/2024.
//

import Foundation
import UIKit

@IBDesignable
public final class BJTextField: UIView {
    
    private var messageLabel: BJLabel = {
        let label = BJLabel(alignment: .left)
        label.isHidden = true
        label.textColor = .red
        return label
    }()
    
    public var field: TextField = {
        let textField = TextField()
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 7
        textField.font = .poppinsExtraBold(size: 15)
//        textField.applyShadow(shadowOffset: .init(width: 0, height: 0))
        textField.backgroundColor = .white
        //textField.delegate = self
        return textField
    }()
    
//    public var fieldBorderColor: CGColor? {
//        didSet {
//            field.layer.borderColor = fieldBorderColor ?? UIColor.lightGray.withAlphaComponent(0.3).cgColor
//            //field.applyShadow(shadowColor: fieldBorderColor ?? UIColor.lightGray.withAlphaComponent(0.3).cgColor)
//            field.textColor = .black
//        }
//    }
    
    
    
    @IBInspectable public var fieldBorderColor: UIColor = UIColor.lightGray {
        didSet {
            field.layer.borderColor = fieldBorderColor.withAlphaComponent(0.3).cgColor
        }
    }
    
    public var fieldBorderCGolor: CGColor  {
        get {
            fieldBorderColor.withAlphaComponent(0.3).cgColor
        }
        set {
            field.layer.borderColor = newValue
        }
    }
    
    @IBInspectable public var title: String = "" {
        didSet {
            field.text = title
        }
    }
    
    @IBInspectable public var showLeftImage: Bool = false {
        didSet {
            setViewImage(iconPosition: .left)
        }
    }
    
    private lazy var icon = UIImageView()
    
    private override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        
        setupView()
        
        
        
        
        
        
        field.attributedPlaceholder = NSAttributedString(string: title, attributes: [.font: UIFont.poppinsExtraBold(size: 15), .foregroundColor: UIColor.black.withAlphaComponent(0.6)])
        
        field.layer.borderColor = UIColor.green.withAlphaComponent(0.3).cgColor
        
        
    }
    
    public convenience init(title: String, iconPosition: IconPosition, padding: UIEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 10), isPasswordField: Bool = false, fieldBorderCGolor: CGColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor ) {
        
        self.init(frame: .zero)
        self.title = title
        
    
        field.isSecureTextEntry = isPasswordField
        
        field.attributedPlaceholder = NSAttributedString(string: title, attributes: [.font: UIFont.poppinsExtraBold(size: 15), .foregroundColor: UIColor.black.withAlphaComponent(0.6)])
        
        self.fieldBorderCGolor = fieldBorderCGolor
        
        setViewImage(iconPosition: iconPosition)
    }
    
    private func setupView() {
        
//        fieldBorderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
        
        addSubviews(field, messageLabel)
        field.fillSuperview()
        
        messageLabel.anchor(top: field.bottomAnchor, leading: field.leadingAnchor, bottom: nil, trailing: field.trailingAnchor, margin: .topOnly(2))
        //            field.addTarget(self, action: #selector(textFieldDidChange),
        //                                       for: .editingChanged)
    }
    
    private func setViewImage(iconPosition: IconPosition) {
        //icon.image = MyImage.getImage()
        icon.image = MyImage3.getImage(name: "user-icon-2", type: "png")
        switch iconPosition {
        case .left:
            //field.leftView = iconContainer(icon: icon)
            field.leftView = icon
            field.leftViewMode = .always
            field.padding = .leftOnly(55)
            //field.padding = .init(top: 0, left: 0, bottom: 0, right: 0)
        case .right:
            field.rightView = iconContainer(icon: icon)
            field.rightViewMode = .always
        }
    }
    
    private func iconContainer(icon: UIImageView) -> UIView {
        let iconHolder: UIView = UIView(frame: .zero)
        icon.contentMode = .center
        iconHolder.addSubview(icon)
        icon.placeAtCenterOf(centerY: iconHolder.centerYAnchor, centerX: iconHolder.centerXAnchor, leading: iconHolder.leadingAnchor, trailing: iconHolder.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        return iconHolder
    }
}

public class TextField: UITextField {

    var padding: UIEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 10)

//    public override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
//        var textRect = super.leftViewRect(forBounds: bounds)
//        textRect.origin.x += 50
//        return textRect
//    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

public enum IconPosition {
    case left, right
}

public class MyImage {
  public class func getImage() -> UIImage? {
      let bundle = Bundle(for: self)
      return UIImage(named: "user-icon", in: bundle, compatibleWith: nil)
  }
}

public class MyImage2 {
  public static func getImage() -> UIImage? {
      let bundle = Bundle(for: self)
      return UIImage(named: "user-icon-2", in: bundle, compatibleWith: nil)
  }
}

public class MyImage3 {
    
    public static func getImage(name: String, type: String) -> UIImage? {
        guard let path = Bundle.module.path(forResource: name, ofType: type),
            let image = UIImage(contentsOfFile: path) else {
            
          print("not found")
          return nil
      }
        print("image found")
      return image
  }
}

import class Foundation.Bundle

private class BundleFinder {}

//extension Foundation.Bundle {
//    /// Returns the resource bundle associated with the current Swift module.
//    static var module: Bundle = {
//        let bundleName = "MyImages"
//
//        let candidates = [
//            // Bundle should be present here when the package is linked into an App.
//            Bundle.main.resourceURL,
//
//            // Bundle should be present here when the package is linked into a framework.
//            Bundle(for: BundleFinder.self).resourceURL,
//
//            // For command-line tools.
//            Bundle.main.bundleURL,
//        ]
//
//        for candidate in candidates {
//            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
//            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
//                return bundle
//            }
//        }
//        fatalError("unable to find bundle named BioSwift_BioSwift")
//    }()
//}


//extension Image {
//    init(packageResource name: String, ofType type: String) {
//#if canImport(UIKit)
//        guard let path = Bundle.module.path(forResource: name, ofType: type),
//              let image = UIImage(contentsOfFile: path) else {
//            self.init(name)
//            return
//        }
//        self.init(uiImage: image)
//#elseif canImport(AppKit)
//        guard let path = Bundle.module.path(forResource: name, ofType: type),
//              let image = NSImage(contentsOfFile: path) else {
//            self.init(name)
//            return
//        }
//        self.init(nsImage: image)
//#else
//        self.init(name)
//#endif
//    }
//}
