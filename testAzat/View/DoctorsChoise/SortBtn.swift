//
//  SortBtn.swift
//  testAzat
//
//  Created by Азат Серкебаев on 19.08.2024.
//

import SwiftUI

struct SortBtn: View {
    
    @ObservedObject var viewModel: ViewModel
  
    var body: some View {
        HStack (spacing: 1) {
            Button(action: {
                viewModel.firstBtnSelected = true
                viewModel.firstBtnToggle.toggle()
                viewModel.secondBtnSelected = false
                viewModel.thirdBtnSelected = false
                viewModel.random = false
            }) {
                Text("По цене") 
                    .foregroundStyle(viewModel.firstBtnSelected ? .white : .gray)
                    .font(.system(size: 14))
                if viewModel.firstBtnToggle == true {
                    Image(systemName: "arrowshape.up.fill")
                        .resizable()
                        .modifier(SortBtnTextModifier())
                } else {
                    Image(systemName: "arrowshape.down.fill")
                        .resizable()
                        .modifier(SortBtnTextModifier())
                }
            }
            .modifier(SortBtnModifier(backgrColor: viewModel.firstBtnSelected ? .pinkApp : .white))

            Button(action: {
                viewModel.secondBtnToggle.toggle()
                viewModel.firstBtnSelected = false
                viewModel.secondBtnSelected = true
                viewModel.thirdBtnSelected = false
                viewModel.random = false
                
            }) {
                Text("По стажу") .foregroundStyle(viewModel.secondBtnSelected ? .white : .gray)
                    .font(.system(size: 14))
                if viewModel.secondBtnToggle == true {
                    Image(systemName: "arrowshape.up.fill")
                        .resizable()
                        .modifier(SortBtnTextModifier())
                }  else {
                    Image(systemName: "arrowshape.down.fill")
                        .resizable()
                        .modifier(SortBtnTextModifier())
                }

            }
            .modifier(SortBtnModifier(backgrColor: viewModel.secondBtnSelected ? .pinkApp : .white))
            
            Button(action: {
                    viewModel.thirdBtnToggle.toggle()
                    viewModel.firstBtnSelected = false
                    viewModel.secondBtnSelected = false
                    viewModel.thirdBtnSelected = true
                    viewModel.random = false
            }) {
                Text("По рейтингу") .foregroundStyle(viewModel.thirdBtnSelected ? .white : .gray)
                    .font(.system(size: 14))
                if viewModel.thirdBtnToggle == true {
                    Image(systemName: "arrowshape.up.fill")
                        .resizable()
                        .modifier(SortBtnTextModifier())
                }  else {
                    Image(systemName: "arrowshape.down.fill")
                        .resizable()
                        .modifier(SortBtnTextModifier())
                }
            }
            .modifier(SortBtnModifier(backgrColor: viewModel.thirdBtnSelected ? .pinkApp : .white))
            
        }
    }
}


//#Preview {
//    SortBtn()
//}
