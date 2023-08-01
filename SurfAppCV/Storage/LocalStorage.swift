//
//  LocalStorage.swift
//  SurfAppCV
//
//  Created by Георгий Матченко on 01.08.2023.
//

import UIKit

struct Skill {
    let title: String
    let id: Int
    
    init(title: String, id: Int = Int.random(in: 1...1000000)) {
        self.title = title
        self.id = id
    }
}

class LocalStorage {
    var userSkills: [Skill] = [Skill(title: "MVC/MVVM"),
                               Skill(title: "SOLID"),
                               Skill(title: "MVP"),
                               Skill(title: "Multitrading"),
                               Skill(title: "KVO"),
                               Skill(title: "KVC"),
                               Skill(title: "WorkManager"),
                               Skill(title: "Programmer")]
}
