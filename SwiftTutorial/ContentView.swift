//
//  ContentView.swift
//  SwiftTutorial
//
//  Created by 이윤성 on 2021/11/06.
//

import SwiftUI

struct ContentView: View {
    
    var colors : [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black", "Red", "Green", "Blue"]
    
    @State private var rotation: Double = 0
    @State private var text: String = "Welcome to Swift UI"
    @State private var colorIndex = 0
    
    var body: some View {
        VStack{
            Text(text)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(self.rotation))
                .animation(.easeInOut(duration: 3))
                .foregroundColor(self.colors[self.colorIndex])
            Slider(value: $rotation, in: 0 ... 360, step: 0.1)
            
            TextField("Enter text here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Picker(selection: $colorIndex, label: Text("Color")) {
                ForEach(0 ..< colornames.count){
                    Text(self.colornames[$0])
                        .foregroundColor(self.colors[$0])
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
