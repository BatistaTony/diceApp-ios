//
//  ContentView.swift
//  DiceApp
//
//  Created by Batista Tone on 14/05/23.
//

import SwiftUI

struct ContentView: View {
    
    var dices = DicesData()
    
    @State private var firstDiceIndex = 0
    @State private var secondDiceIndex = 1
    
    func rollTheDice(){
        
        let valueOne = Int.random(in: 0..<6)
        let valueTwo = Int.random(in: 0..<6)
        
        firstDiceIndex = valueOne
        secondDiceIndex = valueTwo
        
    }
    
    var body: some View {
        ZStack {
            Image("GreenBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .ignoresSafeArea()
            
            VStack(spacing: 100) {
                
                VStack {
                    Image("DiceeLogo")
                }
                
                Spacer()
                
                VStack {
                    HStack(spacing: 50) {
                        Image(dices.dices[firstDiceIndex])
                        Image(dices.dices[secondDiceIndex])
                    }
                }
                
                Spacer()
                
                Button  {
                    rollTheDice()
                } label: {
                    Text("Roll")
                        .frame(width: 150, height: 50)
                        .tint(.purple)
                        .foregroundColor(.black)
                        .background(Color.green)
                        .cornerRadius(10)
                        
                }
                .padding(.bottom, 50)
            
                
            }
            .padding(20)
            
          
        }
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
