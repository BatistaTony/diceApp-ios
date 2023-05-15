//
//  ContentView.swift
//  DiceApp
//
//  Created by Batista Tone on 14/05/23.
//

import SwiftUI

struct ContentView: View {
    
    
    @Environment(\.verticalSizeClass) var vSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var hSizeClass: UserInterfaceSizeClass?
    
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
                
                GeometryReader { geometry in
                    
                    Image("GreenBackground")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .ignoresSafeArea()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    
                }
                
                GeometryReader { geometry in
                    
                    let hSize = geometry.size.height
                    let wSize = geometry.size.width
                    
                    VStack {
                        
                        VStack(spacing: 1) {
                            
                            
                            if(vSizeClass == .regular){
                                Spacer(minLength: hSize * 30/100)
                                
                                VStack {
                                    Image("DiceeLogo")
                                }
                                
                                Spacer(minLength: hSize * 20/100)
                            }
                           
                            
                            
                            VStack {
                                
                               
                                if(vSizeClass == .compact){
                                    
                                    Spacer(minLength: hSize * 35/100)
                                 
                                    VStack {
                                        Image("DiceeLogo")
                                    }
                                    Spacer(minLength: hSize * 5/100)
                                }
                                
                                HStack(spacing: 20 ) {
                                    Image(dices.dices[firstDiceIndex])
                                    Image(dices.dices[secondDiceIndex])
                                }
                                
                            }
                            
                            
                        }
                        
                        if(vSizeClass == .regular){
                            Spacer(minLength: geometry.size.height * 30/100)
                        }else{
                            Spacer(minLength: geometry.size.height * 5/100)
                        }
                        
                        
                        
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
                        
                        Spacer(minLength: geometry.size.height * 3/100)
                        
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 70/100)
                     
                }
                
            }
            .scaledToFill()
            .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone SE (3rd generation)")
        
        ContentView()
            .previewDevice("iPhone 14 Pro Max")

        ContentView()
            .previewDevice("iPhone 14 Pro Max")
            .previewInterfaceOrientation(.landscapeRight)


    }
}
