//
//  AddressCardExtension.swift
//  iOS3-Hankel
//
//  Created by Luis Hankel on 19/11/2019.
//  Copyright © 2019 Luis Hankel. All rights reserved.
//

extension AddressCard: CustomStringConvertible {
    var description: String {
        return """
        +-----------------------------------
        | \(firstName) \(lastName)
        | \(street)
        | \(zipCode) \(city)
        | Hobbies: \(hobbies.reduce("") { result, hobby in "\(result)\n|   \(hobby)" })
        | Freunde: \(friends.reduce("") { result, friend in "\(result)\n|   \(friend.firstName) \(friend.lastName)" })
        +-----------------------------------
        """
    }
}
