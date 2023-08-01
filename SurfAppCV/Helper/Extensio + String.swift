//
//  Extensio + String.swift
//  SurfAppCV
//
//  Created by Георгий Матченко on 01.08.2023.
//

import UIKit

extension String {
    func getTextWidth(_ string: String) -> CGFloat {
        return NSString(string: string).boundingRect(with: CGSize(width: 0, height: 0), options: .usesFontLeading, attributes: [.font: UIFont.helvetica16], context: nil).width
    }
}
