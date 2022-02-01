//
//  ContentView.swift
//  SliderGameSwiftUI
//
//  Created by Vladislav Ryabtsev on 31.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertPresent = false
    @State private var currentValue: Double = 50.0
    @State private var targetValue = Int.random(in: 0...100)
    
    var body: some View {
                
        VStack(spacing: 20) {
            Text("Move the slider closer to the value : \(targetValue)")
            
            HStack {
                Text("0").padding(.leading)
                SliderFromUIKit(value: $currentValue,color: .red, alfa: computeScore())
                Text("100").padding(.trailing)
            }

            Button(action: { alertPresent.toggle() }) {
                    Text("Check me!")
                    .alert("Your score",
                           isPresented: $alertPresent,
                           actions: {}) {
                        Text("\(Int(currentValue))")
                    }
            }
            Button("Start over ?") { self.startOver()}
        }
    }
    
    private func startOver() {
        currentValue = 50.0
        targetValue = (Int.random(in: 0...100))
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
