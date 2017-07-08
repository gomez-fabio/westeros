//
//  HouseTests.swift
//  Westeros
//
//  Created by Fabio Gomez on 6/7/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTests: XCTestCase {
    
    var starkImage  : UIImage!
    var lannisterImage : UIImage!
    
    var starkSigil     : Sigil!
    var lannisterSigil  : Sigil!
    
    var starkHouse : House!
    var lannisterHouse : House!
    
    var robb  : Person!
    var arya  : Person!
    var tyrion  : Person!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starkSigil = Sigil(description: "Direwolf", image: starkImage)
        lannisterSigil = Sigil(description: "Rampant Lion", image: lannisterImage)
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!")
        
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // comprobamos que existe House
    func testHouseExistence(){
        
        let StarkSigil = Sigil(description: "Direwolf", image: #imageLiteral(resourceName: "codeIsComing.png"))
        let stark = House(name: "Stark", sigil: StarkSigil, words: "Winter is coming!")
        
        //Comprobamos que no sea nil
        XCTAssertNotNil(stark)
    }
    
    // comprobamos que existe Sigil
    func testSigilExistence(){
        let StarkSigil = Sigil(description: "Direwolf", image: #imageLiteral(resourceName: "codeIsComing.png"))
        XCTAssertNotNil(StarkSigil)
        
        let lannisterSigil = Sigil(description: "Rampant Lion", image: #imageLiteral(resourceName: "lannister.jpg"))
        XCTAssertNotNil(lannisterSigil)
    }
    
    //
    func testAddPersons(){
        XCTAssertEqual(starkHouse.count, 0)
        
        starkHouse.add(person: robb)
        XCTAssertEqual(starkHouse.count, 1)
        
        starkHouse.add(person: arya)
        XCTAssertEqual(starkHouse.count, 2)

        starkHouse.add(person: tyrion)
        XCTAssertEqual(starkHouse.count, 2)

    }
    
}
