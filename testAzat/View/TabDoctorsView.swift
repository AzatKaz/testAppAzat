//
//  TabDoctorsView.swift
//  testAzat
//
//  Created by Азат Серкебаев on 19.08.2024.
//

import SwiftUI

struct TabDoctorsView: View {
    var message: Int = 2
   
    var body: some View {
        TabView {
            DoctorsChoise()
                .tabItem {
                    Label("Главная", systemImage: "house")
                }
            AppointmentView()
                .tabItem {
                    Label("Приемы", systemImage: "doc.text.below.ecg.fill.rtl")
                }
            ChatView()
                .badge(message)
                .tabItem {
                    Label("Чат", systemImage: "message.fill")
                }
                
            ProfileView()
                .tabItem {
                    Label("Профиль", systemImage: "person.fill")
                }
        }
        .accentColor(.pinkApp)
    }
}

#Preview {
    TabDoctorsView()
}

