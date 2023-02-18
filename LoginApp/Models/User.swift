//
//  User.swift
//  LoginApp
//
//  Created by Дмитрий Лубов on 18.02.2023.
//

struct User {
    let userName: String
    let password: String
    
    let person: Person
    
    static func getUser() -> User {
        User(
            userName: "User",
            password: "password",
            person: Person(
                name: "Дмитрий",
                surname: "Лубов",
                company: "Артем ИРЦ",
                department: "Автоматизации",
                post: "Программист БД"
            )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let company: String
    let department: String
    let post: String
}
