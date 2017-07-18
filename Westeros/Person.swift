//
//  Character.swift
//  Westeros
//
//  Created by Fabio Gomez on 6/7/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation

final class Person {
    
    let name  : String
    let house  : House
    private let _alias  : String? // La declaramos como privada para que no accedan desde fuera a un opcional nil, y abajo con un getter devolvemos cadena vacia
    
    var alias : String{
        get{
            return _alias ?? "" // esto se lee, si _alias está vacío, me devuelves ""
        }
    }
    
    // ponemos el alias como opcional y nil como valor por defecto, así, si no instanciamos con alias, lo ponemos a nil.
    init (name: String, alias: String? = nil, house: House) {
        
        self.name = name
        _alias = alias
        self.house = house
    }
}

// Dejamos la clase limpita, y añadimos esta variable computada en una extensión.
extension Person {
    
    var fullName : String{
        get{
            return "\(name) \(house.name)"
        }
    }
}

extension Person{
    var proxy : String{
        return "\(name) \(alias) \(house.name)"
    }
}


extension Person : Hashable{
    var hashValue : Int{
        get{
            return proxy.hashValue
        }
    }
}

extension Person : Equatable{
    static func ==(lhs: Person, rhs: Person) -> Bool{
        return lhs.proxy == rhs.proxy
    }
}

extension Person : Comparable{
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy < rhs.proxy
}

}
