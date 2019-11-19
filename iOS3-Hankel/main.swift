//
//  main.swift
//  iOS3-Hankel
//
//  Created by Luis Hankel on 19/11/2019.
//  Copyright © 2019 Luis Hankel. All rights reserved.
//

let addressBook = AddressBook.addressBook(fromFile: "book.plist") ?? AddressBook()
var selectedCard: AddressCard? = nil

func read(withPrompt prompt: String) -> String {
    print("\(prompt) ", terminator: "")
    return readLine() ?? ""
}

func listAll() {
    for card in addressBook.cards {
        print(card)
    }
}

func create() {
    print("Creating a new card:")
    let firstName = read(withPrompt: "First name:")
    let lastName = read(withPrompt: "Last name:")
    let street = read(withPrompt: "Street:")
    let zipCode = read(withPrompt: "Zip code:")
    let city = read(withPrompt: "City:")
    
    let zip = Int(zipCode)
    
    let addressCard = AddressCard(firstName: firstName, lastName: lastName, street: street, zipCode: zip ?? 0, city: city)
    
    var hobby: String
    
    while true {
        hobby = read(withPrompt: "Hobby: (to stop enter q)")
        if hobby.lowercased() == "q" {
            break
        }
        addressCard.add(hobby: hobby)
    }
    
    addressBook.add(card: addressCard)
    addressBook.sort()
}

func search() {
    let searchTerm = read(withPrompt: "Search term:")
    if let card = addressBook.search(for: searchTerm) {
        selectedCard = card
        print(card)
        return
    }
    print("\(searchTerm) not found")
}

func addFriend() {
    let lastName = read(withPrompt: "Last name of friend to add:")
    if let friendCard = addressBook.search(for: lastName) {
        selectedCard?.add(friend: friendCard)
        print("Added friend: \(friendCard.firstName) \(friendCard.lastName)")
    } else {
        print("\(lastName) not found")
    }
}

func delete() {
    if let card = selectedCard {
        addressBook.remove(card: card)
        selectedCard = nil
        print("Deleted \(card.firstName) \(card.lastName) from address book")
    }
}


var input: String
var running = true

while running {
    if selectedCard != nil {
        // Card selected, show card functions
        input = read(withPrompt: "(A)dd friend, (D)elete or go (B)ack?")
        switch input.lowercased() {
        case "a":
            addFriend()
        case "d":
            delete()
        case "b":
            selectedCard = nil
        default:
            print("Invalid input")
        }
    } else {
        // No card selected, show global functions
        input = read(withPrompt: "(C)reate, (S)earch, (L)ist or (Q)uit?")
        switch input.lowercased() {
        case "c":
            create()
        case "s":
            search()
        case "l":
            listAll()
        case "q":
            running = false
        default:
            print("Invalid input")
        }
    }
}
