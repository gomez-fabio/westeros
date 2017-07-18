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
    
    var localHouses : [House]!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        localHouses = Repository.local.houses
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
    
    func testLocalRepositoryReturnsSortedArrayofHouses(){
        
        // el array que me viene ya estaba ordenado, y como lo comparo con el mismo array vuelto a ordenar, tiene que ser igual.
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    func testLocalRepoReturnsHousesByNameCaseInsensitively(){
        let stark = Repository.local.house(named: "sTarK")
        XCTAssertEqual(stark?.name, "Stark")
    }
    
    func testHouseFiltering(){
        let filtered = Repository.local.houses(filteredBy: {$0.count == 1})
        XCTAssertEqual(filtered.count, 1)
    }
    
    
}
