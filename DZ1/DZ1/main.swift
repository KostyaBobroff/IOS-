//
//  main.swift
//  DZ1
//
//  Created by Costa Bobroff on 14.09.2018.
//  Copyright © 2018 Costa Bobroff. All rights reserved.
//

import Foundation

protocol BankProtocol {
    func printInfo()
}

enum Currency: String {
    case RUR = "RUR"
    case USD = "USD"
    case EUD = "EUD"
    
}

class Account : BankProtocol {
    var id: Int
    var balance: Double
    var currency: Currency?
    var  description: String
    var offer: String?

    init(id: Int, balance: Double, currency: String, description: String, offer: String? = nil ) {
        self.id = id
        self.balance = balance
        self.currency = Currency(rawValue:currency)
        self.description = description
        self.offer = offer
    }
    func printInfo(){
        print("User account \nuser id: \(id) \nbalance: \(balance) \ncurrency: \(currency!.rawValue) \noffer: \(offer ?? "offers don't exist")")
    }
}

var a = Account(id:1, balance: 12.3, currency: "RURs", description:"My first User")
a.printInfo()


//
//class ReissueInfo{
//
//}
//
//class Card {
//
//}
//
//class ServerResponce {
//
//}
