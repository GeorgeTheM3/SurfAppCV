//
//  Delegates.swift
//  SurfAppCV
//
//  Created by Георгий Матченко on 01.08.2023.
//

import Foundation

protocol DelegateToView: AnyObject {
    func passInfo<T>(_ info: T)
}
