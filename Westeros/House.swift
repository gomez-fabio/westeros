//
//  House.swift
//  Westeros
//
//  Created by Fabio Gomez on 6/7/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

// Ñapas para representar nuestro modelo, ya iremos mejorandolo, y creando clases o structs.

// typealias House     = String  -> Lo pasamos a clase
// typealias Sigil     = String  -> Lo pasamos a clase
// typealias Character = String  -> Lo pasamos a clase
typealias Words     = String

typealias Members = Set<Person>

// MARK: - Classes
final class House{
    let name    : String
    let sigil   : Sigil
    let words   : Words
    let wikiURL : URL
    
    internal var _members  : Members

    
    // Inicializador
    init(name: String, sigil: Sigil, words: Words, url: URL){
        (self.name, self.sigil, self.words, self.wikiURL) = (name, sigil, words, url)
        _members = Members() // Creo un set vacío
    }
}


final class Sigil{

    let description  : String
    let image        : UIImage
    
    // Inicializador
    init(description: String, image: UIImage){
        (self.description, self.image) = (description, image)
    }
}

// Variable "count" que almacena el count del set y funcioón "add" que añade personas al set
extension House{
    var count   :   Int{
        return _members.count
    }
    
    func add(person : Person){
        guard person.house.name == self.name else {  // Con guard validamos datos de entradas, no deja meter una persona que no es de esa casa
            return
        }
        _members.insert(person)
    }

    // Versión variadica (los ... indica que puede recibir n parametros, 
    // lo llamamos así p.ej. lannister.add(persons: tyrion, jaime, cersei)
    // esto es sobrecarga de métodos, dos métodos con el mismo nombre y que el compilador elige 
    // según los parametros que recibe, igual que en java
    func add(persons: Person...){
        for person in persons{
            add(person: person)
        }
    }
    
    // Sorted [Person]
    func sortedMembers() -> [Person]{
        return _members.sorted()
    }
    
    
}


extension House{
    var proxyForEquality : String{
        get{
            return "\(name) \(words) \(count)"
        }
    }
    
    var proxyForComparison : String{
        get{
            return name.uppercased()
        }
    }
}



// MARK: - Equatable
extension House : Equatable{
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
    
}

// MARK: - Hashable
extension House : Hashable{
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// MARK: - Comparable
extension House : Comparable{
    static func <(lhs: House, rhs: House) -> Bool
        {
            return lhs.proxyForComparison < rhs.proxyForComparison
        }
    
}
