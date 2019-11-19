//
//  AddressBook.swift
//  iOS3-Hankel
//
//  Created by Luis Hankel on 19/11/2019.
//  Copyright © 2019 Luis Hankel. All rights reserved.
//

import Foundation

class AddressBook {
    var cards: [AddressCard]
    
    init(cards: [AddressCard]) {
        self.cards = cards
    }
    
    convenience init() {
        self.init(cards: [])
    }
    
    func add(card: AddressCard) {
        cards.append(card)
    }
    
    func remove(card: AddressCard) {
        if let index = cards.firstIndex(of: card) {
            cards.remove(at: index)
            for addressCard in cards {
                addressCard.remove(friend: card)
            }
        }
    }
    
    func sort() {
        cards.sort(by: <)
    }
    
    func search(for lastName: String) -> AddressCard? {
        for card in cards {
            if card.lastName == lastName {
                return card
            }
        }
        return nil
    }
    
    func save(toFile path: String) {
        let url = URL(fileURLWithPath: path)
        let encoder = PropertyListEncoder()
        if let data = try? encoder.encode(cards) {
            try? data.write(to: url)
        }
    }
    
    class func addressBook(fromFile path: String) -> AddressBook? {
        let url = URL(fileURLWithPath: path)
        if let data = try? Data(contentsOf: url) {
            let decoder = PropertyListDecoder()
            if let addressBook = try? decoder.decode([AddressCard].self, from: data) {
                return AddressBook(cards: addressBook)
            }
        }
        return nil
    }
}
