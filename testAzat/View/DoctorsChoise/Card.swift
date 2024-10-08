//
//  DoctorsCard.swift
//  testAzat
//
//  Created by Азат Серкебаев on 19.08.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct Card: View {
    @State var model: User
    @State var name: String = ""
    
    var body: some View {
       
        NavigationStack {
            VStack(alignment: .leading, spacing: 15) {
                HStack(alignment: .top, spacing: 16) {
                    if model.avatar != nil {
                        WebImage(url: URL(string: model.avatar ?? ""))
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "photo.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(Color.gray)
                            .clipShape(Circle())
                    }
                   
                    VStack(alignment: .leading, spacing: 8) {
                        Text(model.last_name)
                            .font(.system(size: 16, weight: .bold))
                        HStack(spacing: 3) {
                            Text(model.first_name)
                                .font(.system(size: 16, weight: .bold))
                            Text(model.patronymic)
                                .font(.system(size: 16, weight: .bold))
                        }
                        HStack {
                            Image(systemName: "star")
                                .resizable()
                                .modifier(ImageModifier(color: model.ratings_rating < 1 ? .gray : .pinkApp))
                            Image(systemName: "star")
                                .resizable()
                                .modifier(ImageModifier(color: model.ratings_rating < 2 ? .gray : .pinkApp))
                            Image(systemName: "star")
                                .resizable()
                                .modifier(ImageModifier(color: model.ratings_rating < 3 ? .gray : .pinkApp))
                            Image(systemName: "star")
                                .resizable()
                                .modifier(ImageModifier(color: model.ratings_rating < 4 ? .gray : .pinkApp))
                            Image(systemName: "star")
                                .resizable()
                                .modifier(ImageModifier(color: model.ratings_rating < 5 ? .gray : .pinkApp))
                            

                        }
                        switch model.experience {
                        case 0:
                            Text("\(name) без опыта")
                                .font(.system(size: 14, weight: .thin))
                        case 1,21,31,41:
                            Text("\(name)  стаж \(model.experience) год")
                                .font(.system(size: 14, weight: .thin))
                        case 2...4,22...24,31...34,41...44:
                            Text("\(name)  стаж \(model.experience) года")
                                .font(.system(size: 14, weight: .thin))
                        default:
                            Text("\(name)  стаж \(model.experience) лет")
                                .font(.system(size: 14, weight: .thin))
                        }
                       
                        Text("от \(model.minPrice) Р")
                            .font(.system(size: 16, weight: .bold))
                    }
                    Spacer()
                    Button(action: {
                        model.is_favorite.toggle()
                    }, label: {
                        if model.is_favorite {
                            Image(systemName: "heart.fill")
                                .foregroundStyle(Color.pinkApp)
                            
                        } else {
                            Image(systemName: "heart")
                                .foregroundStyle(Color.gray)
                        }
                    })
                }
                .frame(maxWidth: .infinity)
               
                NavigationLink {
                    DoctorsCard(model: model)
                } label: {
                    if (model.nearest_reception_time != nil) {
                        Text("Записаться")
                            .modifier(TextModifier(backgrColor: .pinkApp))
                    } else {
                        Text("Нет свободного расписания")
                            .modifier(TextModifier(backgrColor: .mainApp, textColor: .black))
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .frame(width: UIScreen.main.bounds.width - 32)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .onAppear {
            name = model.specialization.first?.name ?? ""
        }
    }
}





//#Preview {
//    Card()
//}
