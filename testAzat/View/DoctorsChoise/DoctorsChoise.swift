//
//  ContentView.swift
//  testAzat
//
//  Created by Азат Серкебаев on 19.08.2024.
//

import SwiftUI

struct DoctorsChoise: View {
    
    @StateObject var viewModel = ViewModel()
    @State var search: String = ""

    private let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    HStack {
                        SortBtn(viewModel: viewModel)
                    }
                    .frame(width: UIScreen.main.bounds.width - 32)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    LazyVGrid(columns: columns, content: {
                        if viewModel.random == true {
                                ForEach(viewModel.model, id: \.id) { users in
                                    Card(model: users)
                                }
                          
                        }
                        if viewModel.firstBtnSelected == true {
                            if viewModel.firstBtnToggle == true {
                                ForEach(viewModel.model.sorted(by: { User, User2 in
                                    User.minPrice > User2.minPrice
                                }), id: \.id) { doctor in
                                    Card(model: doctor)
                                }
                            } else {
                                ForEach(viewModel.model.sorted(by: { User, User2 in
                                    User.minPrice < User2.minPrice
                                }), id: \.id) { doctor in
                                    Card(model: doctor)
                                }
                            }
                        }
                        
                        if viewModel.secondBtnSelected == true {
                            if viewModel.secondBtnToggle == true {
                                ForEach(viewModel.model.sorted(by: { User, User2 in
                                    User.experience > User2.experience
                                }), id: \.id) { doctor in
                                    Card(model: doctor)
                                }
                            } else {
                                ForEach(viewModel.model.sorted(by: { User, User2 in
                                    User.experience < User2.experience
                                }), id: \.id) { doctor in
                                    Card(model: doctor)
                                }
                            }
                        }
                        
                        if viewModel.thirdBtnSelected == true {
                            if viewModel.thirdBtnToggle == true {
                                ForEach(viewModel.model.sorted(by: { User, User2 in
                                    User.ratings_rating > User2.ratings_rating
                                }), id: \.id) { doctor in
                                    Card(model: doctor)
                                }
                            } else {
                                ForEach(viewModel.model.sorted(by: { User, User2 in
                                    User.ratings_rating < User2.ratings_rating
                                }), id: \.id) { doctor in
                                    Card(model: doctor)
                                }
                            }
                        }
                    })
                    .navigationTitle("Педиаторы")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.mainApp)
        }
        .onAppear {
            viewModel.getData()
        }
        .background(Color.blue)
        .searchable(text: $search)
    }
}



















#Preview {
    DoctorsChoise()
}
