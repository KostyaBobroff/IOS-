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

    init(id: Int, balance: Double, currency: String, description: String, offer: String? = nil) {
        self.id = id
        self.balance = balance
        self.currency = Currency(rawValue: currency)
        self.description = description
        self.offer = offer
    }
    func printInfo(){
        print("User account \nuser id: \(id) \nbalance: \(balance) \ncurrency: \(currency?.rawValue ?? "incorrect currency" ) \noffer: \(offer ?? "offers don't exist")")
    }
}

func FromStringToDate(StringDate: String) -> Date? {
    let dateFormater = DateFormatter()
    dateFormater.dateStyle = .medium
    dateFormater.locale = Locale(identifier: "ru_RU")
    dateFormater.dateFormat = "dd MMMM yyyy"
    dateFormater.timeZone = TimeZone(secondsFromGMT: 0)
    return dateFormater.date(from: StringDate)
    
}

class ReissueInfo: BankProtocol{
    var date: Date?
    var info: String
    var address: String
    
    init(strDate: String, information: String, address:String = "Головной офис") {
        date = FromStringToDate(StringDate: strDate)
        info = information
        self.address = address
    }
    
    func printInfo() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd --- MM --- yyyy"
       let strDateYeag = dateFormatter.string(from: date! )
        print("Reissue Info \ndate: \(strDateYeag) \ninfo: \(info) \naddress: \(address)")
    }
}
var a = ReissueInfo(strDate: "10 октября 2018",information: "sdad", address: "asdaszxczxc")


class Card: BankProtocol {
    var reissueInfo: ReissueInfo?
    var id: Int
    var balance: Double
    var currency: Currency?
    
    init(id: Int, balance: Double, currency: String, reissueInfo: ReissueInfo? = nil ){
        self.id = id
        self.balance = balance
        self.currency = Currency(rawValue: currency)
        self.reissueInfo = reissueInfo
    }
    
   func printInfo() {
        print("Card \ncard id: \(id) \nbalance: \(balance) \ncurrency: \(currency?.rawValue ?? "incorrect currency")")
    }
}
var z = Card(id: 34, balance: 23.45, currency: "RUR", reissueInfo: a)
z.printInfo()

class ServerResponce: BankProtocol {
    var cards: [Card]
    var accounts: [Account]
    
    init(cardArray: [Card], accountArray: [Account]) {
        self.cards = cardArray
        self.accounts = accountArray
    }
    func printInfo() {
        print("Server Response \ncards: \(cards) \naccounts: \(accounts)")
    }
}


let ac1 = Account(id: 34, balance: 34.5, currency: "RUR", description: "First user", offer: "Take it!")

let ac2 = Account(id: 23, balance: 12.34, currency: "USD", description: "Second user")

let accs = [ac1, ac2]

let reissueInfo = ReissueInfo(strDate: "10 cенятбря 2018", information: "ReissueInfo")
let card1 = Card(id: 56, balance:456.04, currency: "EUD", reissueInfo: reissueInfo)

let card2 = Card(id:456, balance:806.04, currency: "RUR")

let cards = [card1, card2]

let response = ServerResponce(cardArray: cards, accountArray: accs)

var array = [BankProtocol]()

array.append(contentsOf: cards)

array.append(contentsOf: accs)

array.append(response)

for i in array {
    i.printInfo()
    
}
