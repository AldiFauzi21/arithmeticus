//
//  Header.swift
//  Arithmeticus
//
//  Created by Rizaldi Septian Fauzi on 24/08/23.
//

import SwiftUI

struct Header: View {
    
    @Binding var restart : Bool
    
    @Binding var level: Int
    @Binding var score : Int
    @Binding var lives: Int
    
    @Binding var hintValue : Int
    @Binding var hintAlert : Bool
    
    @Binding var skipped : Bool
    @Binding var exitModal : Bool
    @Binding var reviewModal : Bool
    
    @Binding var operand: Int
    
    var body: some View {
        HStack{
            Text("Level \(level)")
                .font(.system(.title, design: .monospaced))
                .fontWeight(.black)
                .lineLimit(nil).foregroundColor(Color("main color"))
            Spacer()
            HStack(spacing: -2.0){
                Image(systemName: "bolt.fill").font(.title).foregroundColor( lives>2 ? Color("complementary color") : Color("tertiary color"))
                Image(systemName: "bolt.fill").font(.title).foregroundColor( lives>1 ? Color("complementary color") : Color("tertiary color"))
                Image(systemName: "bolt.fill").font(.title).foregroundColor( lives>0 ? Color("complementary color") : Color("tertiary color"))
            }
        }
        .padding(.horizontal)
        .frame(width: 380.0, height: 25.0)
        HStack{
            Button(action: {
                exitModal.toggle()
            }) {
                Image(systemName: "chevron.left").font(.title2)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.white)
                    .background(Color("main color"))
                    .clipShape(Circle())
            }
            if restart {
                
            }
            Spacer()
            Text("\(score)")
                .font(.system(.title2, design: .monospaced))
                .fontWeight(.bold)
            
            Spacer()
            Button(action: {
                if operand > 2 && score-hintValue>=0 {
                    score-=hintValue
                    hintTapped()
                    operand-=1
                } else {
                    hintAlert.toggle()
                }
                
            }) {
                Image(systemName: "questionmark").font(.title2)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color("tertiary color"))
                    .background(Color("main color"))
                    .clipShape(Circle())
            }.alert(isPresented: $hintAlert) {
                Alert(title: Text("Hint Unavailable"), message: operand>2 ? Text("Your score is insufficient") : Text("Question too simple") , dismissButton: .default(Text("OK")))
            }
        }
        .padding(.all, 8.0)
        .frame(width: 350.0, height: 60.0)
        .background(Color("tertiary color"))
        .clipShape(RoundedRectangle(cornerRadius: 50.0))
    }
}
