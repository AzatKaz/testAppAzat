//
//  DataManager.swift
//  testAzat
//
//  Created by Азат Серкебаев on 21.08.2024.
//

import Foundation


class DataManager {
    
    func getData(complition: @escaping ([User]) -> Void ) {
        
        guard let url = Bundle.main.url(forResource: "JsonTest", withExtension: "json") else {
            print("Failed to locate users.json in bundle.")
            // return nil
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = try JSONDecoder().decode(Record.self, from: data)
            
            complition(decoder.record.data.users)
        
        } catch {
            print("Failed to load or decode JSON: \(error.localizedDescription)")
        }
    }
    
}
