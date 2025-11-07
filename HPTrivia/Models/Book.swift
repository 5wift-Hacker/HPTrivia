//
//  Book.swift
//  HPTrivia
//
//  Created by John Newman on 2/11/2025.
//

struct Book: Codable, Identifiable {
    let id: Int
    let image: String
    let questions: [Question]
    var status: BookStatus
}

enum BookStatus: Codable {
    case active, inactive, locked
}
