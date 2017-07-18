//
//  Repository.swift
//  Westeros
//
//  Created by Fabio Gomez on 11/7/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation

final class Repository{
    
    static let local = LocalFactory()
    
}

protocol HouseFactory{
    
    typealias Filter = (House)->Bool
    
    var houses : [House] {get}
    
    // Devuelve una casa dado su nombre
    func house(named: String) -> House?
    
    func houses(filteredBy: Filter) -> [House]
    
}

final class LocalFactory : HouseFactory{
    var houses: [House]{
        get{
            
            // Sigils
            let starkSigil     = Sigil(description: "Direwolf", image: #imageLiteral(resourceName: "codeIsComing.png"))
            let lannisterSigil = Sigil(description: "Rampant Lion", image: #imageLiteral(resourceName: "lannister.jpg"))
            let mormontSigil   = Sigil(description: "Rampant bear", image: #imageLiteral(resourceName: "mormotSigil.png"))
            let greyjoySigil   = Sigil(description: "A golden kraken on a black field", image: #imageLiteral(resourceName: "greyjoySigil.png"))
            let targaryenSigil = Sigil(description: "A red three-headed dragon", image: #imageLiteral(resourceName: "targaryenSigil.png"))
            let tyrellSigil    = Sigil(description: "A golden rose on a green field", image: #imageLiteral(resourceName: "tyrellSigil.png"))
            
            let starkURL      = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL  = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
            let mormontURL    = URL(string: "https://awoiaf.westeros.org/index.php/House_Mormont")!
            let greyjoyURL    = URL(string: "https://awoiaf.westeros.org/index.php/House_Greyjoy")!
            let targaryenURL  = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            let tyrellURL     = URL(string: "https://awoiaf.westeros.org/index.php/House_Tyrell")!
            
            // Houses
            let stark     = House(name: "Stark",
                                  sigil: starkSigil,
                                  words: "Winter is coming!",
                                  url: starkURL)
            
            let lannister = House(name: "Lannister",
                                  sigil: lannisterSigil,
                                  words: "Hear me roar!",
                                  url: lannisterURL)
            
            let mormont   = House(name: "Mormont",
                                  sigil: mormontSigil,
                                  words: "Here we stand!",
                                  url: mormontURL)
            
            let greyjoy   = House(name: "Greyjoy",
                                  sigil: greyjoySigil,
                                  words: "We Do Not Sow",
                                  url:greyjoyURL)
            
            let targaryen = House(name: "Targaryen",
                                  sigil: targaryenSigil,
                                  words: "Fire and Blood",
                                  url: targaryenURL)
            
            let tyrell    = House(name: "Tyrell",
                                  sigil: tyrellSigil,
                                  words: "Growing Strong",
                                  url: tyrellURL)
            
            // Characters
            // -- Stark
            let robb    = Person(name: "Robb", alias: "The young wolf", house: stark)
            let sansa   = Person(name: "Sansa", alias: "Little bird", house: stark)
            let arya    = Person(name: "Arya", house: stark)
            let brandon = Person(name: "Brandon", alias: "The winged wolf", house: stark)
            let rickon  = Person(name: "Rickon", house: stark)
            
            // -- Lannister
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let jaime  = Person(name: "Jaime", alias: "KingSlayer", house: lannister)
            let cersei = Person(name: "Cersei", house: lannister)
            
            // -- Mormont
            let lyanna = Person(name: "Lyanna", house: mormont)
            
            // -- Greyjoy
            let asha  = Person(name: "Asha", alias: "Esgred", house: greyjoy)
            let theon = Person(name: "Theon", alias: "Reek", house: greyjoy)
            let euron = Person(name: "Euron III", alias: "Crow's Eye", house: greyjoy)

            // -- Targaryen
            let daenerys = Person(name: "Daenerys", alias: "Dragonmother", house: targaryen)
            let viserys  = Person(name: "Viserys", alias: "The Beggar King", house: targaryen)
            
            // -- Tyrell
            let mace     = Person(name: "Mace", alias: "Lord Oaf", house: tyrell)
            let loras    = Person(name: "Loras", alias: "The Knight of Flowers", house: tyrell)
            let margaery = Person(name: "Margaery", alias: "Little rose", house: tyrell)
            let olenna   = Person(name: "Olenna", alias: "Queen of Thorns", house: tyrell)
            
            // Añadir los personajes a las casas
            stark.add(person: robb)
            stark.add(person: sansa)
            stark.add(person: arya)
            stark.add(person: brandon)
            stark.add(person: rickon)
            
            lannister.add(person: tyrion)
            lannister.add(person: jaime)
            lannister.add(person: cersei)
            
            mormont.add(person: lyanna)
            
            greyjoy.add(person: asha)
            greyjoy.add(person: theon)
            greyjoy.add(person: euron)
            
            targaryen.add(person: daenerys)
            targaryen.add(person: viserys)
            
            tyrell.add(person: mace)
            tyrell.add(person: loras)
            tyrell.add(person: margaery)
            tyrell.add(person: olenna)
            
            return [stark, lannister, mormont, greyjoy, targaryen, tyrell].sorted()
        }
    }

    func house(named: String) -> House?
    {
        let house = houses.filter{$0.name.uppercased() == named.uppercased()}.first
        return house
    }
    
    //func houses(filteredBy: Filter) -> [House] {   // es lo mismo que lo de abajo
    func houses(filteredBy: (House) -> Bool) -> [House] {
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }
    
}
