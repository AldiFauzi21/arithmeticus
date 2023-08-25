//
//  HeadsUpDisplay.swift
//  Arithmeticus
//
//  Created by Rizaldi Septian Fauzi on 24/08/23.
//

import SwiftUI

struct HeadsUpDisplay: View {
    
    @Binding var answer: String
    @Binding var correctAnswer: Bool
    @Binding var wrongAnswer: Bool
    
    @Binding var timeWarning: Bool
    @Binding var timesUp: Bool
    @Binding var timePercentage: Double
    
    @Binding var aritmatikus: Bool
    @Binding var earth: Bool
    
    var body: some View {
        HStack{
            ZStack{
                HStack{
                    Button(action: {
                    }) {
                        Image(systemName: "airplane").font(.title2)
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color("tertiary color"))
                            .background(Color("main color"))
                            .clipShape(Circle())
                    }
                }
                .padding(.all, 8.0)
                .frame(width: CGFloat(timePercentage), height: 60.0, alignment: .trailing)
                .background(timeWarning ?
                            Color("main color")
                            : Color("complementary color"))
                .clipShape(RoundedRectangle(cornerRadius: 50.0))
                .position(x:35, y:22)
                Button(action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.5)){
                        aritmatikus.toggle()
                    }
                }) {
                    Image(systemName: "moonphase.waxing.gibbous.inverse").font(.title2)
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.white)
                        .background(Color("main color"))
                        .clipShape(Circle())
                        .position(x: 20, y: 22)
                }
                    Text("Times Up!").font(.system(.title, design: .monospaced)).fontWeight(.heavy).foregroundColor(Color.white).position(x: 170, y: 20).opacity(timesUp ? 1 : 0)                }
            Spacer()
            Button(action: {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.5)){
                    earth.toggle()
                }
            }) {
                Image(systemName: "globe.asia.australia.fill").font(.title2)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.white)
                    .background(Color("main color"))
                    .clipShape(Circle())
            }
        }
        .padding(.all, 8.0)
        .frame(width: 350.0, height: 60.0)
        .background(Color("tertiary color"))
        .clipShape(RoundedRectangle(cornerRadius: 50.0))
        
        TextField(
            "Answer",
            text: $answer
        ).keyboardType(.numberPad).disabled(true)
            .multilineTextAlignment(.center)
        .disableAutocorrection(true)
        .frame(width: 350.0, height: 60.0).overlay(RoundedRectangle(cornerRadius: 15).stroke(wrongAnswer ? Color.red: correctAnswer ? Color.green : Color("main color"), lineWidth: 5))
          .font(.system(.title, design: .monospaced))
          .fontWeight(.heavy)
          .lineLimit(nil).foregroundColor(Color("main color"))
    }
}
