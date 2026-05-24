//
//  LocalFileLoader.swift
//  SkyPeek
//
//  Created by CCS038 on 23/05/26.
//

import Foundation

struct LocalFileLoader {
    enum LoadError: Error {
        case fileNotFound
    }
    
    func loadJSON() throws -> Data {
        
        guard let url = Bundle.main.url(forResource: "weather", withExtension: "json") else {
            throw LoadError.fileNotFound
        }
        
        let data = try Data(contentsOf: url)
        
        return data
    }
}


/*
 LocalFileLoader:
     file → raw bytes (Data)

 JSONDecoder:
     raw bytes → typed Swift models
 */
