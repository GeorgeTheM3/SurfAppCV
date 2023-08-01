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
        if skill.title.getTextWidth(skill.title) > 300{
            var editTitle = skill.title
            while editTitle.getTextWidth(editTitle) > 290 {
                editTitle.removeLast(3)
            }
            storage.userSkills.insert(Skill(title: String(editTitle + "..."), id: skill.id), at: index)
        } else {
            storage.userSkills.insert(skill, at: index)
        }
    }
    
    func addPlusButton() {
        storage.userSkills.append(Skill(title: "+"))
    }
    
    func removePlusButton() {
        storage.userSkills.removeAll(where: {$0.title == "+"})
    }
    
}


