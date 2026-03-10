//
//  SwiftDataTests.swift
//  PethouseCICD
//
//  Created by Raquel Souza on 10/03/26.
//

//
//  SwiftDataTets.swift
//  SwiftDataTets
//
//  Created by Raquel Souza on 09/03/26.
//

import XCTest
import SwiftData

@testable import PethouseCICD


final class SwiftDataTests: XCTestCase {

   //Verificando se o banco de dados está salvando corretamente um PET
    
    //criação de um banco de dados isolado - instanciando variáveis
    var container: ModelContainer!
    var context: ModelContext!
    
    //criação dessa função pois por padrão, coisas que podem lançar erro devem ficar dentro de um setup.
    override func setUpWithError() throws {
        //container = try ModelContainer(for:Pet.self)
            //criando o container em memória apenas.
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            container = try ModelContainer(for: Pet.self, configurations: config)
            context = ModelContext(container)
        }
        
    func testInsertPets() throws {
        
        //criação do objeto PET
        let pet = Pet(
            name: "Bob",
            birthday: .now,
            breed: "Caramelo",
            specie: .dog,
            gender: .male
        )
        
        //registrando o objeto na memória
        context.insert(pet)
        
        //salvando o objeto no banco de dados
        try context.save()
        
        //buscando no banco
        let result = try context.fetch(FetchDescriptor<Pet>())
        
        //verificando resultado
        XCTAssertEqual(result.count, 1)
        
    }
}
