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
    
    private var _members  : Members
    
    // Inicializador
    init(name: String, sigil: Sigil, words: Words){
        (self.name, self.sigil, self.words) = (name, sigil, words)
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
        guard person.house.name == self.name else {  // Con guard validamos datos de entradas
            return
        }
        _members.insert(person)
    }
}

extension House{
    var proxy : String{
        return "\(name) \(words)"
    }
}

// INICIO DEBERES

extension House : Hashable {
    var hashValue: Int {
        get{
            return proxy.hashValue
        }
    }
}


extension House : Equatable{
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension House : Comparable {
    static func >(lhs : House, rhs: House) -> Bool{
        return lhs.proxy > rhs.proxy
    }
    
    static func >=(lhs : House, rhs: House) -> Bool{
        return lhs.proxy >= rhs.proxy
    }
    
    static func <(lhs : House, rhs: House) -> Bool{
        return lhs.proxy < rhs.proxy
    }
    
    static func <=(lhs : House, rhs: House) -> Bool{
        return lhs.proxy <= rhs.proxy
    }
}


// FIN DEBERES




// protocolos a implementar en house
//Equatable
//Hashable
//Comparable (este también en person)























