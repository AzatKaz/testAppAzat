//
//  ViewModel.swift
//  testAzat
//
//  Created by Азат Серкебаев on 19.08.2024.
//

import SwiftUI
import Foundation

class ViewModel: ObservableObject {
    private let dataManager = DataManager()
    @Published var model: [User] = []
    
    @Published var random = true
    
    @Published var firstBtnSelected = false
    @Published var firstBtnToggle = false
    
    @Published var secondBtnSelected = false
    @Published var secondBtnToggle = false
    
    @Published var thirdBtnSelected = false
    @Published var thirdBtnToggle = false
    
    

    func getData() {
        dataManager.getData { users in
            self.model = users
            
        }
    }
    
}




