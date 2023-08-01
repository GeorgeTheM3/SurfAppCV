//
//  Extension + UIImage.swift
//  SurfAppCV
//
//  Created by Георгий Матченко on 01.08.2023.
//

import UIKit

extension UIImage {
    static let avatar: UIImage = {
        guard let image = UIImage(named: "avatar") else { return UIImage() }
        return image
    }()
    
    static let geoPin: UIImage = {
        guard let image = UIImage(named: "geoPin") else { return UIImage() }
        return image
    }()
}


