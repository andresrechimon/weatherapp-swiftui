//
//  ContentView.swift
//  swiftui-weather
//
//  Created by Andrés Rechimon on 06/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight:Bool = false
    
    var body: some View {
        HStack {
            ZStack {
                BackgroundView(isNight: isNight)
                VStack{
                    
                    CityTextView(cityName: "Córdoba, CBA")
                    
                    MainWeatherStatusView(imageView: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 36)
                    
                    HStack(spacing: 20){
                        WeatherDayView(day: "MIE", icon: "sun.max.fill", temp: 36)
                        WeatherDayView(day: "JUE", icon: "cloud.sun.fill", temp: 26)
                        WeatherDayView(day: "VIE", icon: "wind.snow", temp: 18)
                        WeatherDayView(day: "SAB", icon: "sunset.fill", temp: 22)
                        WeatherDayView(day: "DOM", icon: "cloud.heavyrain.fill", temp: 12)
                    }
                    
                    Spacer()
                    
                    Button {
                        isNight.toggle()
                    } label: {
                        WeatherButton(title: "Change date time", textColor: Color.white, backgroundColor: .blue)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var day: String
    var icon: String
    var temp: Int
    
    var body: some View {
        VStack{
            Text(day)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight:Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageView: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageView)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}
