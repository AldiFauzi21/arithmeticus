//
//  GameplayScreen.swift
//  Arithmeticus
//
//  Created by Rizaldi Septian Fauzi on 24/08/23.
//

import SwiftUI

struct GameplayScreen: View {
    
    @Binding var correctAnswer: Bool
    
    @Binding var counter: Double
    
    @Binding var aritmatikus: Bool
    @Binding var earth: Bool
    
    @Binding var questions : [String]
    
    @Binding var coloredQuestions : [String]
    @Binding var leveledOperator : [String]
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    List{
                        ForEach(questions, id: \.self){ question in
                            HStack {
                                Spacer()
                                Text(question+"=?")
                            }
                        }.font(.system(.title, design: .monospaced))
                            .fontWeight(.medium).foregroundColor(Color("main color"))
                    }.frame(maxHeight: .infinity)
                }.frame(width: 350.0, height: 300.0)
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
            }
            HStack{
                ForEach(coloredQuestions, id: \.self){ question in
                    switch question{
                    case "leveledOperator[0]" :  Text("\(leveledOperator[0])").font(.system(.title2, design: .monospaced))
                            .fontWeight(.medium).foregroundColor(Color("level 1"))
                    case "leveledOperator[1]" :  Text("\(leveledOperator[1])").font(.system(.title2, design: .monospaced))
                            .fontWeight(.medium).foregroundColor(Color("level 2"))
                    case "leveledOperator[2]" :  Text("\(leveledOperator[2])").font(.system(.title2, design: .monospaced))
                            .fontWeight(.medium).foregroundColor(Color("level 3"))
                    case "leveledOperator[3]" :  Text("\(leveledOperator[3])").font(.system(.title2, design: .monospaced))
                            .fontWeight(.medium).foregroundColor(Color("level 4"))
                    case "leveledOperator[4]" :  Text("\(leveledOperator[4])").font(.system(.title2, design: .monospaced))
                            .fontWeight(.medium).foregroundColor(Color("level 5"))
                    case "leveledOperator[5]" :  Text("\(leveledOperator[5])").font(.system(.title2, design: .monospaced))
                            .fontWeight(.medium).foregroundColor(Color("level 6"))
                    case "leveledOperator[6]" :  Text("\(leveledOperator[6])").font(.system(.title2, design: .monospaced))
                            .fontWeight(.medium).foregroundColor(Color("level 7"))
                    case "(",")","+","-","×","÷" :  Text("\(question)").font(.system(.title2, design: .monospaced))
                            .fontWeight(.medium).foregroundColor(Color("secondary color"))
                    default:
                        Text("•").font(.system(.title2, design: .monospaced))
                                .fontWeight(.medium).foregroundColor(Color("main color"))
                    }
                    
                }
            }.position(x: 200,y: 19)
            Text("\(Image(systemName: "moonphase.waxing.gibbous.inverse")) Arithmeticus").font(.system(.title3, design: .monospaced)).fontWeight(.semibold).foregroundColor(Color.white).padding(.all, 7.0).background(Color("complementary color")).clipShape(RoundedRectangle(cornerRadius: 50.0)).offset(x: -75 ,y: aritmatikus ? 130 : 190)
            Text(compliment(counter: self.counter)).font(.system(.title3, design: .monospaced)).fontWeight(.black).foregroundColor(Color.white).padding(.all, 15.0).background(Color("secondary color")).clipShape(RoundedRectangle(cornerRadius: 50.0)).offset(x: 0,y: correctAnswer ? 100 : 190)
            Text("Earth \(Image(systemName: "globe.asia.australia.fill"))").font(.system(.title3, design: .monospaced)).fontWeight(.semibold).foregroundColor(Color.white).padding(.all, 7.0).background(Color("main color")).clipShape(RoundedRectangle(cornerRadius: 50.0)).offset(x: 118,y: earth ? 130 : 190)
        }
    }
}
