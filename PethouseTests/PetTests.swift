//
//  PethouseTests.swift
//  PethouseTests
//
//  Created by Júlia Clovandi Vasconcelos  on 06/03/26.
//  Júlia e Luciana

import Testing
import Foundation

@testable import Pethouse


struct PetTests {
    
    @Test("Validar a criação de objeto Pet Default ")
    func criarPetDefault(){
        let birthdayComponents = DateComponents(year: 2026, month: 3, day: 6)
        let dataEsperada = Calendar.current.date(from: birthdayComponents)!
        
        let petDefault = Pet(
            name: "",
            birthday: dataEsperada,
            breed: "",
            specie: .dog,
            gender: .female,
            details: "",
            tutors: []
            
        )
        
        #expect(petDefault.name == "")
        #expect(petDefault.birthday ==  dataEsperada)
        #expect(petDefault.breed == "")
        #expect(petDefault.specie == .dog)
        #expect(petDefault.gender == .female)
        #expect(petDefault.details == "")
        #expect(petDefault.tutors.isEmpty)
        
    }
        
    
    @Test("Validar a criação do objeto Pet customizado")
    func criarPet() {
        let birthdayComponents = DateComponents(year: 2000, month: 1, day: 1)
        let dataEsperada = Calendar.current.date(from: birthdayComponents)!


        let pet = Pet(
            name: "Bob",
            birthday: dataEsperada,
            breed: "Caramelo",
            specie: .dog,
            gender: .male
            
        )
        
        #expect(pet.name == "Bob")
        #expect(pet.birthday ==  dataEsperada)
        #expect(pet.breed == "Caramelo")
        #expect(pet.specie == .dog)
        #expect(pet.gender == .male)
        
    }
    
    @Test("Propriedades do pet devem poder ser alteradas")
    func editarPet() {

        let petEdit = Pet()

        #expect(petEdit.name == "")
        #expect(petEdit.breed == "")

        petEdit.name = "Rex"
        petEdit.breed = "Bulldog"

        #expect(petEdit.name == "Rex")
        #expect(petEdit.breed == "Bulldog")
    }
}
