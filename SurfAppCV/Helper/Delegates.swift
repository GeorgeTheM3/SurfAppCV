//
//  Delegates.swift
//  SurfAppCV
//
//  Created by Георгий Матченко on 01.08.2023.
//

import Foundation

protocol DelegateToView: AnyObject {
    func passToView<T>(_ info: T)
}

protocol DelegateToController: AnyObject {
    func passToController<T>(_ info: T)
}
