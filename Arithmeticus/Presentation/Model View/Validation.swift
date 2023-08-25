//
//  Validation.swift
//  Arithmeticus
//
//  Created by Rizaldi Septian Fauzi on 24/08/23.
//

import Foundation

func validation(question: String){
    self.question = self.question.replacingOccurrences(of: "+", with: " + ")
    self.question = self.question.replacingOccurrences(of: "-", with: " - ")
    self.question = self.question.replacingOccurrences(of: "×", with: " * ")
    self.question = self.question.replacingOccurrences(of: "÷", with: " / ")
    self.question = self.question.replacingOccurrences(of: "(", with: " ( ")
    self.question = self.question.replacingOccurrences(of: ")", with: " ) ")
    
    let expression = NSExpression(format: self.question)
    if let result = expression.expressionValue(with: nil, context: nil) as? Int {
        if Int(answer) == result {
            validationSucceed()
        } else {
            validationFailed()
        }
    }
}

func validationSucceed(){
    level += 1
    score += 20 - Int(counter)
    answer = ""
    answerMinus = false
    hintCounter = 0
    hintAlert = false
    timeWarning = false
    timesUp = false
    timePercentage = 120
    counter = 0
    operatorsAmount = 0
    questions = []
    coloredQuestion = ""
    coloredQuestions = []
    leveledOperator = []
    question = ""
    operand = 0
    digit = 0
    timesUp = false
    timeWarning = false
    
    withAnimation(.spring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.5)){
        correctAnswer.toggle()
    }
    questionGenerating()
    coloredQuestion = self.questions.last ?? "error"
    
    withAnimation(.easeIn(duration: (495/time)*0.2)){
        timeWarning.toggle()
    }
    withAnimation(.linear(duration: 0.2).delay((495/time)*0.2)) {
        timesUp.toggle()
    }
    withAnimation(.easeInOut(duration: 0.2).delay(1)){
        correctAnswer.toggle()
    }
}

func validationFailed(){
    if lives > 1{
        lives-=1
        withAnimation(.spring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.5)){
            wrongAnswer.toggle()
        }
        withAnimation(.easeInOut(duration: 0.3).delay(0.3)){
            wrongAnswer.toggle()
        }
    } else {
        lives -= 1
    }
}

func compliment (counter: Double) -> String {
    if 0.0..<3.0 ~= counter {
        return "Perfect!"
    } else if 3.0..<5.0 ~= counter {
        return "Amazing!"
    } else if 5.0..<8.0 ~= counter {
        return "Great Job!"
    } else if 8.0..<12.0 ~= counter {
        return "Nice Work!"
    } else if 12.0..<20.0 ~= counter {
        return "Good Effort!"
    } else if 20.0..<35.0 ~= counter {
        return "Not Bad!"
    } else if 35.0..<60.1 ~= counter {
        return "Nice Try!"
    }else {
        return "Improve More!"
    }
}
