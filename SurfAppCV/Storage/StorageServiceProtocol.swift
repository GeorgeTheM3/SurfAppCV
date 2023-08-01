//
//  StorageServiceProtocol.swift
//  SurfAppCV
//
//  Created by Георгий Матченко on 01.08.2023.
//

import Foundation

protocol StorageServiceProtocol {
    func getSkillsList() -> [Skill]
    func removeSkill(_ id: Int)
    func addSkill(_ skill: Skill)
}
