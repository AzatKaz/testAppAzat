//
//  ViewModifier.swift
//  testAzat
//
//  Created by Азат Серкебаев on 03.09.2024.
//

import SwiftUI

struct ImageModifier: ViewModifier {
    var color: Color?
    func body(content: Content) -> some View {
        content
            .frame(width: 12, height: 12)
            .clipped()
            .foregroundStyle(color ?? .gray)
    }
}

struct TextModifier: ViewModifier {
    var backgrColor: Color
    var textColor: Color = .white

    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .foregroundStyle(textColor)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(backgrColor)
            .clipShape(Capsule())
    }
    
}

struct SortBtnTextModifier: ViewModifier {
  
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.white)
            .frame(width: 5, height: 10)
            .clipped()
    }
    
}

struct SortBtnModifier: ViewModifier {
    var backgrColor: Color
    func body(content: Content) -> some View {
        content
            .frame(height: 32)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 7)
            .padding(.horizontal, 2)
            .background(backgrColor)
    }
    
}
