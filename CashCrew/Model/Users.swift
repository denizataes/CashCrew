//
//  Users.swift
//  CashCrew
//
//  Created by Deniz Ata Eş on 30.07.2023.
//

import Foundation

struct User {
    let UserID: Int
    let FirstName: String
    let LastName: String
    let IBAN: String
    let ProfilePictureURL: String
}

// Örnek kullanıcıların listesi
let exampleUsers: [User] = [
    User(UserID: 1, FirstName: "Deniz Ata", LastName: "EŞ", IBAN: "TR1234567890", ProfilePictureURL: "ata"),
    User(UserID: 2, FirstName: "Idil", LastName: "GÜL", IBAN: "TR0987654321", ProfilePictureURL: "idil"),
    User(UserID: 3, FirstName: "Seza", LastName: "YEĞENOĞLU", IBAN: "TR1111111111", ProfilePictureURL: "seza"),
    User(UserID: 4, FirstName: "Selen", LastName: "YEĞENOĞLU", IBAN: "TR2222222222", ProfilePictureURL: "selen"),
    User(UserID: 5, FirstName: "Uğur", LastName: "ŞAHİN", IBAN: "TR3333333333", ProfilePictureURL: "ugur"),
    User(UserID: 6, FirstName: "Serav", LastName: "GÜL", IBAN: "TR004124214", ProfilePictureURL: "serav")
    
]
