//
//  PethouseUITests.swift
//  PethouseUITests
//
//  Created by Lizandra Malta on 09/03/26.
//

import XCTest

final class PethouseUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws { }
    
    @MainActor
    func testCreateAndDeletePet() throws {
        let app = XCUIApplication()
        app.activate()
                
        let petsTabMenu = app.images["pawprint.fill"].firstMatch
        XCTAssertTrue(petsTabMenu.exists, "It should render pets menu")
        petsTabMenu.tap()
        
        let petsAddButton = app.buttons["pets_add_button"].firstMatch
        XCTAssertTrue(petsAddButton.exists, "It should render pets add button")
        petsAddButton.tap()
        
        let petNameInput = app.textFields["Nome"].firstMatch
        XCTAssertTrue(petNameInput.exists, "It should render name input")
        petNameInput.tap()
        petNameInput.typeText("Jujuba Teste UI")
        
        let petSpecieInput = app.buttons["Espécie, Cachorro"].firstMatch
        XCTAssertTrue(petSpecieInput.exists, "It should render specie input")
        petSpecieInput.tap()
        let dogSpecieOption = app.buttons["Cachorro"].firstMatch
        XCTAssertTrue(dogSpecieOption.exists, "It should render dog option")
        dogSpecieOption.tap()
        
        let petBreedInput = app.textFields["Raça"].firstMatch
        XCTAssertTrue(petBreedInput.exists, "It should render breed input")
        petBreedInput.tap()
        petBreedInput.typeText("SRD")
        
        let petGenderInput = app.buttons["Gênero, Macho"].firstMatch
        XCTAssertTrue(petGenderInput.exists, "It should render gender input")
        petGenderInput.tap()
        print(app.debugDescription)
        let femaleGenderOption = app.buttons["Fêmea"].firstMatch
        XCTAssertTrue(femaleGenderOption.exists, "It should render female option")
        femaleGenderOption.tap()
        
        let addButtonForm = app.buttons["pet_add_button_form"].firstMatch
        XCTAssertTrue(addButtonForm.exists, "It should render pets add button form")
        addButtonForm.tap()
        
        let newPet = app.staticTexts["Jujuba Teste UI"].firstMatch
        XCTAssertTrue(newPet.exists, "It should render new pet")
        newPet.swipeLeft()
        sleep(2)
        print(app.debugDescription)
        let deleteButton = app.buttons["Deletar"].firstMatch
        XCTAssertTrue(deleteButton.exists, "It should render delete button")
        deleteButton.tap()
    }
    
}
