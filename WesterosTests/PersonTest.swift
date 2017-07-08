//
//  CharacterTest.swift
//  Westeros
//
//  Created by Fabio Gomez on 6/7/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTest: XCTestCase {
    
    // es razonable que esté a nil durante un instante, hasta que lo instancie en el setup
    var starkHouse : House!
    var starkSigil : Sigil!
    var ned        : Person!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starkSigil = Sigil(description: "Direwolf", image: #imageLiteral(resourceName: "codeIsComing.png"))
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is comming!")
        
        ned = Person(name: "Eddard", alias:"Ned", house: starkHouse)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonExistence(){
        
        let ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        
        XCTAssertNotNil(ned)
    }
    
    func testFullName(){
        XCTAssertEqual(ned.fullName, "Eddard Stark")
    }
    
}
