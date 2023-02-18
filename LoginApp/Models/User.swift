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
                nameImage: "DmitriyLubov",
                name: "Дмитрий",
                surname: "Лубов",
                company: "Артем ИРЦ",
                department: "Автоматизации",
                post: "Программист БД",
                biography: bio
            )
        )
    }
}

struct Person {
    let nameImage: String
    let name: String
    let surname: String
    let company: String
    let department: String
    let post: String
    let biography: String
}

let bio = "Родился в 1988 году в городе Артеме Приморского края, где так же и продолжаю жить. Еще в школе пробовал силы в QBasic, даже занял 3-е место в городской олимпиаде. После института работал в сфере продаж. И только к 30-ти годам устроился в компанию, где и работаю программистом."
