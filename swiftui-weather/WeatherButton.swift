//
//  WeatherButton.swift
//  swiftui-weather
//
//  Created by Andrés Rechimon on 15/03/2024.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(textColor)
            .foregroundColor(backgroundColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}
