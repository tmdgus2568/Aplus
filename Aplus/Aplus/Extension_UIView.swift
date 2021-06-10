//
//  Extension_UIView.swift
//  Aplus
//
//  Created by hsh on 2021/06/01.
//
// storyboard에 View 부분에서 테두리 둥글게 가능하게 하기 위한 파일 

import UIKit

extension UIView {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
    func loopDescendantViews(_ closure: (_ subView: UIView) -> Void) {
        for v in subviews {
            closure(v)
            v.loopDescendantViews(closure)
        }
    }
    
}
