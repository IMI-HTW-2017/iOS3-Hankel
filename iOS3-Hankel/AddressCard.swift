//
//  AddressCard.swift
//  iOS3-Hankel
//
//  Created by Luis Hankel on 19/11/2019.
//  Copyright © 2019 Luis Hankel. All rights reserved.
//

class AddressCard: Codable, Equatable, Comparable {
    static func == (lhs: AddressCard, rhs: AddressCard) -> Bool {
        return lhs.firstName.lowercased() == rhs.firstName.lowercased() && lhs.lastName .lowercased() == rhs.lastName.lowercased()
    }
    
    static func < (lhs: AddressCard, rhs: AddressCard) -> Bool {
        return lhs.lastName.lowercased() < rhs.lastName.lowercased()
    }
    
    var firstName: String
    var lastName: String
    var street: String
    var zipCode: Int
    var city: String
    var hobbies: [String]
    var friends: [AddressCard]
    
    init (firstName: String, lastName: String, street: String, zipCode: Int, city: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.street = street
        self.zipCode = zipCode
        self.city = city
        self.hobbies = []
        self.friends = []
    }
    
    func add(hobby: String) {
        hobbies.append(hobby)
    }
    
    func remove(hobby: String) {
        if let index = hobbies.firstIndex(of: hobby) {
            hobbies.remove(at: index)
        }
    }
    
    func add(friend: AddressCard) {
        friends.append(friend)
    }
    
    func remove(friend: AddressCard) {
        if let index = friends.firstIndex(of: friend) {
            friends.remove(at: index)
        }
    }
}
