//
//  Extension + UIView.swift
//  SurfAppCV
//
//  Created by Георгий Матченко on 01.08.2023.
//

import UIKit

extension UIView {
    func appendSubviewsToView(views:[UIView]) {
        views.forEach({ subview in
            self.addSubview(subview)
        })
    }
}
