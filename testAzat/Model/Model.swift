////
////  Model.swift
////  testAzat
////
////  Created by Азат Серкебаев on 19.08.2024.
////
//
import Foundation


struct Record: Codable {
    let record: RecordData
}

struct RecordData: Codable {

    let data: UserData
}

struct UserData: Codable {
    let users: [User]
}


struct User: Identifiable, Codable {
    var id: String
    var first_name: String
    var last_name: String
    var patronymic: String
    var seniority: Int
    var avatar: String?
    var text_chat_price: Int
    let video_chat_price: Int
    let hospital_price: Int
    var is_favorite: Bool
    let scientific_degree_label: String
    let ratings_rating: Double
    let work_expirience: [WorkExpirience]
    let specialization: [Specialization]
    let higher_education: [HigherEducation]
    let nearest_reception_time: Int?
    
    var experience: Int {
        work_expirience.reduce(0) {  _ , workExpirience  in
            
            let endDate = workExpirience.end_date ?? 0
            let startDate = workExpirience.start_date ?? 0
            let expirience = (endDate - startDate) / (365 * 24 * 60 * 60)
            
            return expirience
        }
           }
    
    
    var minPrice: Int {
        let price = [text_chat_price, video_chat_price, hospital_price]
        let min = price.min()
        
        return min ?? 0
    }
   
}


    

struct HigherEducation: Codable {
    let university: String?
}

struct WorkExpirience: Codable {
    
    let position: String?
    let start_date: Int?
    let end_date: Int?
    
    
}

struct Specialization: Codable {
    let id: Int
    let name: String
}





