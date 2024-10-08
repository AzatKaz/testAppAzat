//
//  PriceView.swift
//  testAzat
//
//  Created by Азат Серкебаев on 21.08.2024.
//

import SwiftUI

struct PriceView: View {
    @State var model: User
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack(spacing: 24) {
                    costOfServices(title: "Видеоконсультация", time: "30 мин", price: model.video_chat_price)
                    costOfServices(title: "Чат с врачем", time: "30 мин", price: model.text_chat_price)
                    costOfServices(title: "Прием в клинике", time: "В клинике", price: model.hospital_price)
                }
                .navigationTitle("Стоимость услуг")
                .navigationBarTitleDisplayMode(.inline)
            }
            .frame(maxWidth: .infinity)
            .background(Color.mainApp)
        }
        .toolbarRole(.editor)
        
    }
}


struct costOfServices: View {
    var title: String
    var time: String
    var price: Int
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 16, weight: .medium))
            HStack {
                Text(time)
                    .font(.system(size: 16, weight: .light))
                Spacer()
                Text("\(price) ₽")
                    .font(.system(size: 16, weight: .medium))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .frame(width: UIScreen.main.bounds.width - 32)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}



//#Preview {
//    PriceView()
//}
