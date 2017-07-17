//
//  RepositoryTests.swift
//  Westeros
//
//  Created by Fabio Gomez on 11/7/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // comprobamos que está instanciada la clase del repositorio local en una propiedad estática llamada local.
    func testLocalRepositoryCreation(){
        XCTAssertNotNil(Repository.local)
    }
    
    // comprobamos que hay casas en el repositorio, y que hay 6.
    func testLocalRepositoryHousesCreation(){
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 6)
    }
    
    // Deberes
    func testLocalRepositoryFindHouseByName(){
        
//        let starkHouse = Repository.local.house(named: "targaryen")
//        XCTAssertEqual(starkHouse,"targaryen")
        
//        XCTAssertNotNil(Repository.local.house(named: "targaryen"))
    }
    
    
}
