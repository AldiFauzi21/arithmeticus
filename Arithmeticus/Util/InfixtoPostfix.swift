//
//  InfixtoPostfix.swift
//  Aritmatikus
//
//  Created by Rizaldi Septian Fauzi on 13/04/23.
//

import Foundation

func infixToPostfix(_ infixExpression: String) -> String {
    let operators = ["+": 1, "-": 1, "*": 2, "/": 2, "^": 3]
    let tokens = infixExpression.split(separator: " ").map { String($0) }
    var output = ""
    var stack = [String]()
    
    for token in tokens {
        if let _ = Int(token) { // Jika token adalah angka, masukkan ke output
            output += "\(token) "
        } else if let op1 = operators[token] { // Jika token adalah operator
            while let op2 = stack.last, let priority = operators[op2], op1 <= priority {
                output += "\(stack.removeLast()) "
            }
            stack.append(token)
        } else if token == "(" {
            stack.append(token)
        } else if token == ")" {
            while let top = stack.last, top != "(" {
                output += "\(stack.removeLast()) "
            }
            stack.removeLast()
        }
    }
    
    while !stack.isEmpty {
        output += "\(stack.removeLast()) "
    }
    
    return output.trimmingCharacters(in: .whitespaces)
}
