//
//  Question.swift
//  HPTrivia
//
//  Created by John Newman on 1/11/2025.
//

struct Question: Codable {
    let id: Int
    let question: String
    let answer: String
    let wrong: [String]
    let book: Int
    let hint: String
}
