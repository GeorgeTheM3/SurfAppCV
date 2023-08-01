//
//  Extension + UIFont.swift
//  SurfAppCV
//
//  Created by Георгий Матченко on 01.08.2023.
//

import UIKit

extension UIFont {
    static let helvetica14: UIFont = {
        guard let font = UIFont(name: "Helvetica", size: 14) else { return UIFont() }
        return font
    }()
    
    static let helvetica16: UIFont = {
        guard let font = UIFont(name: "Helvetica", size: 16) else { return UIFont() }
        return font
    }()
    
    static let helvetica25bold: UIFont = {
        guard let font = UIFont(name: "Helvetica-Bold", size: 25) else { return UIFont() }
        return font
    }()
}
