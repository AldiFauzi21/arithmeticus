//
//  Hint.swift
//  Arithmeticus
//
//  Created by Rizaldi Septian Fauzi on 24/08/23.
//

import Foundation

func hintTapped(){
    var infix = questions.last ?? "?"
    infix = infix.replacingOccurrences(of: "+", with: " + ")
    infix = infix.replacingOccurrences(of: "-", with: " - ")
    infix = infix.replacingOccurrences(of: "×", with: " * ")
    infix = infix.replacingOccurrences(of: "÷", with: " / ")
    infix = infix.replacingOccurrences(of: "(", with: " ( ")
    infix = infix.replacingOccurrences(of: ")", with: " ) ")
    let postfix = infixToPostfix(infix)
    let tokens = postfix.split(separator: " ").map { String($0) }
    operated(tokens: tokens)
}
