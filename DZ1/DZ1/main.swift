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
        self.currency = Currency(rawValue: currency)
        self.description = description
        self.offer = offer
    }
    func printInfo(){
        print("User account \nuser id: \(id) \nbalance: \(balance) \ncurrency: \(currency?.rawValue ?? "incorrect currency" ) \noffer: \(offer ?? "offers don't exist")")
    }
}

//var a = Account(id:1, balance: 12.3, currency: "USD", description:"My first User", offer: "Hi all!")
//a.printInfo()

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
//        dateFormatter.setLocalizedDateFormatFromTemplate("")
       let strDateYeag = dateFormatter.string(from: date! )
        print("Reissue Info \ndate: \(strDateYeag) \ninfo: \(info) \naddress: \(address)")
    }
}
var a = ReissueInfo(strDate: "10 октября 2018",information: "sdad", address: "asdaszxczxc")
a.printInfo()
//class Card {
//
//}
//
//class ServerResponce {
//
//}
