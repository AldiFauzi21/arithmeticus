//
//  Button.swift
//  Arithmeticus
//
//  Created by Rizaldi Septian Fauzi on 24/08/23.
//

import Foundation

func buttonTapped(button: String) {
    if button == "x" {
        answer = ""
    } else if button == "+" {
        if answer.contains("-") {
            answer =  answer.replacingOccurrences(of: "-", with: "")
        } else {
            answer = "-" + answer
        }
        answerMinus.toggle()
    } else if button == "="{
        validation(question: questions.last ?? "1-1")
    }else{
        answer += button
    }
}

func buttonHeight(button: String) -> CGFloat {
    if button == "="{
        return (UIScreen.main.bounds.width - 180)
    }
    return (UIScreen.main.bounds.width - 5 * 12) / 5
}

func buttonWidth() -> CGFloat {
    return (UIScreen.main.bounds.width - 5 * 12) / 5
}

func buttonBackgroundColor(button: String) -> Color {
    switch button {
    case "+", "x":
        return Color("main color")
    case "=" :
        return Color("complementary color")
    default:
        return Color("secondary color")
    }
}
