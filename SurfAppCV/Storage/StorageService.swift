//
//  StorageService.swift
//  SurfAppCV
//
//  Created by Георгий Матченко on 01.08.2023.
//

import UIKit

class StorageService: StorageServiceProtocol {
    private let storage = LocalStorage()
    
    func getSkillsList() -> [Skill] {
        storage.userSkills
    }
    
    func removeSkill(_ id: Int) {
        storage.userSkills.removeAll(where: {$0.id == id})
    }
    
    func addSkill(_ skill: Skill) {
        let index = storage.userSkills.count - 1
        storage.userSkills.insert(skill, at: index)
    }
    
    func addPlusButton() {
        storage.userSkills.append(Skill(title: "+"))
    }
    
    func removePlusButton() {
        storage.userSkills.removeAll(where: {$0.title == "+"})
    }
    
}


