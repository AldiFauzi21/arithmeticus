//
//  Question.swift
//  Arithmeticus
//
//  Created by Rizaldi Septian Fauzi on 24/08/23.
//

import Foundation

func digitEnd(digit: Int) -> Int{
    switch digit{
        case 0: return 9
        case 1: return 9
        case 2: return 99
        case 3: return 999
        case 4: return 9999
        default: return 99999
    }
}

func brecketsProblem(digitEnd: Int) -> String {
    let number1 = Int.random(in: 1...digitEnd)
    let number2 = Int.random(in: 1...number1)
    var question = "("
    question += String(number1)+String(simpleOperators.randomElement() ?? "?")+String(number2)
    return question+")"
}

func brecketsProblems(digitEnd: Int) -> String {
    let number1 = Int.random(in: 1...digitEnd)
    let number2 = Int.random(in: 1...number1)
    let number3 = Int.random(in: 1...number2)
    var question = "("+String(digitEnd)
    if 1 == Int.random(in: 0...1){
        question += String(number1)+"+"+String(number2)+"-"+String(number3)
    } else {
        question += String(number1)+"-"+String(number2)+"+"+String(number3)
    }
    return question+")"
}

func divisibleProblem(dividedBy: Int, digitEnd: Int) -> String {
    var number = Int.random(in: 1...digitEnd)
    while number % dividedBy != 0 {
        number = Int.random(in: 1...digitEnd)
    }
    return String(number)+"÷"+String(dividedBy)
}

func questionGenerating() {
    if 51..<100 ~= level{
        operand+=5
    } else if 26..<51 ~= level{
        operand+=4
    } else if 11..<26 ~= level{
        operand+=3
    } else if 0..<11 ~= level{
        operand+=2
    } else {
        operand+=6
    }
    if 250..<1000 ~= level{
        digit+=4
    } else if 100..<250 ~= level{
        digit+=3
    } else if 25..<100 ~= level{
        digit+=2
    } else if 0..<25 ~= level{
        digit+=1
    } else {
        digit+=5
    }
    
    timeGenerating()
    
    var opr = operand
    var dig = Int.random(in: 1...digit)
    var digiterate = dig
    while opr>0 {
        //question+="(\(digit))(\(operand))"
        dig = Int.random(in: 1...digit)
        digiterate = dig
        if opr>1&&level>5 {
            if 1 == Int.random(in: 1...5){
                question+=divisibleProblem(dividedBy: Int.random(in: 1...9), digitEnd: digitEnd(digit: dig))
                opr-=2
                dig=0
                if opr >= 0 {
                    question+=String(operators.randomElement() ?? "?")
                }
            }
        }
        if (opr>1&&level>5)&&opr<operand {
            if 1 == Int.random(in: 1...3){
                question+=brecketsProblem(digitEnd: digitEnd(digit: dig))
                opr-=2
                dig=0
                if opr >= 0 {
                    question+=String(operators.randomElement() ?? "?")
                }
            }
        }
        if (opr>2&&level>5)&&opr<operand {
            if 1 == Int.random(in: 1...3){
                question+=brecketsProblems(digitEnd: digitEnd(digit: dig))
                opr-=3
                dig=0
                if opr >= 0 {
                    question+=String(operators.randomElement() ?? "?")
                }
            }
        }
        while digiterate>0 {
            if digiterate == dig{
                question+=String(numbers.randomElement() ?? "?")
            } else {
                question+=String(numbers0.randomElement() ?? "?")
            }
            digiterate-=1
        }
        if opr>1 {
            if(level<5){
                question+=String(simpleOperators.randomElement() ?? "?")
            } else {
                question+=String(operators.randomElement() ?? "?")
            }
        }
        opr-=1
    }
    questionAdditing(question: question)
}

func questionAdditing(question: String){
    questions.append(question)
}

func questionUpdating(coloredOperator: String){
    var questionEdited = self.coloredQuestion
    questionEdited = questionEdited.replacingOccurrences(of: "+", with: " + ")
    questionEdited = questionEdited.replacingOccurrences(of: "-", with: " - ")
    questionEdited = questionEdited.replacingOccurrences(of: "×", with: " * ")
    questionEdited = questionEdited.replacingOccurrences(of: "÷", with: " / ")
    questionEdited = questionEdited.replacingOccurrences(of: "(", with: " ( ")
    questionEdited = questionEdited.replacingOccurrences(of: ")", with: " ) ")
    var tokens = questionEdited.split(separator: " ").map { String($0) }
    for token in tokens{
        if coloredOperator == token {
            let index = tokens.firstIndex(of: token) ?? 0
            if token == "*" {
                tokens[index] = "×"
            } else if token == "/" {
                tokens[index] = "÷"
            }
            leveledOperator.append(tokens[index])
            tokens[index] = "leveledOperator["+String(hintCounter-1)+"]"
            self.coloredQuestion = tokens.joined(separator: " ")
            splitingQuestion(coloredQuestion: self.coloredQuestion)
            break
        }
    }
}

func splitingQuestion(coloredQuestion: String){
    self.coloredQuestions = coloredQuestion.split(separator: " ").map { String($0) }
}

func operated(tokens: [String]){
    var index = 0
    let operators = "+-*/"
    var expression = ""
    var questionLast = self.questions.last
    for token in tokens {
        if operators.contains(token){
            index = tokens.firstIndex(of: token) ?? 0
            expression += tokens[index-2] + tokens[index] + tokens[index-1]
            let nsexpression = NSExpression(format: expression)
            if let result = nsexpression.expressionValue(with: nil, context: nil) as? Int {
                expression = expression.replacingOccurrences(of: "*", with: "×")
                expression = expression.replacingOccurrences(of: "/", with: "÷")
                let brecketsCheck = "("+expression+")"
                questionLast = questionLast?.replacingOccurrences(of: brecketsCheck, with: String(result)) ?? "1+1"
                questionLast = questionLast?.replacingOccurrences(of: expression, with: String(result)) ?? "1+1"
                questionAdditing(question: questionLast ?? "error")
                hintCounter+=1
                questionUpdating(coloredOperator: token)
            }
            break
        }
    }
}
