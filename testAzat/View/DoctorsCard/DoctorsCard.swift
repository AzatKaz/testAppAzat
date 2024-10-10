//
//  DoctorsCard2.swift
//  testAzat
//
//  Created by Азат Серкебаев on 03.09.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct DoctorsCard: View {
    @State var model: User
    @State var organization: String = ""
    @State var university: String = ""

    var body: some View {
       // NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack(spacing: 16) {
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
                                .font(.system(size: 16, weight: .medium))
                            HStack(spacing: 3) {
                                Text(model.first_name)
                                    .font(.system(size: 16, weight: .medium))
                                Text(model.patronymic)
                                    .font(.system(size: 16, weight: .medium))
                            }
                        }
                        Spacer()
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(.appClock)
                                .resizable()
                                .frame(width: 18, height: 18)
                                .clipped()
                            switch model.experience {
                            case 0:
                                Text("Опыт работы: без опыта")
                                    .font(.system(size: 14, weight: .thin))
                            case 1,21,31,41:
                                Text("Опыт работы: \(model.experience) год")
                                    .font(.system(size: 14, weight: .thin))
                            case 2...4,22...24,31...34,41...44:
                                Text("Опыт работы: \(model.experience) года")
                                    .font(.system(size: 14, weight: .thin))
                            default:
                                Text("Опыт работы: \(model.experience) лет")
                                    .font(.system(size: 14, weight: .thin))
                            }
                        }
                        Info(image: "appCase", description: model.scientific_degree_label)
                        Info(image: "appHat", description: university)
                        Info(image: "appLocation", description: organization)
                    }
                    VStack(spacing: 24) {
                        NavigationLink {
                            PriceView(model: model)
                        } label: {
                            HStack {
                                Text("Стоимость услуг")
                                    .font(.system(size: 16, weight: .medium))
                                Spacer()
                                Text("от \(model.minPrice) Р")
                                    .font(.system(size: 16, weight: .medium))
                            }
                            .foregroundStyle(Color.black)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 18)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        
                        
                        Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                            .font(.system(size: 14, weight: .light))
                        
                    }
                    
                    if (model.nearest_reception_time != nil) {
                        Text("Записаться")
                            .modifier(TextModifier(backgrColor: .pinkApp))
                    } else {
                        Text("Нет свободного расписания")
                            .modifier(TextModifier(backgrColor: .gray, textColor: .black))
                    }

                }
                .frame(width: UIScreen.main.bounds.width - 32)
                
            }
            .frame(maxWidth: .infinity)
            .background(Color.mainApp)
            .navigationTitle("Педиатр")
            .navigationBarTitleDisplayMode(.inline)
            
       // }
        .onAppear {
            university = model.higher_education.first?.university ?? ""
            organization = model.work_expirience.first?.position ?? ""
        }
        .toolbarRole(.editor)
        
        
    }
}


struct Info: View {
    var image: String
    var description: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 18, height: 18)
                .clipped()
            Text(description)
                .font(.system(size: 14, weight: .thin))
        }
    }
}




