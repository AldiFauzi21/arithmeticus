//
//  MainView.swift
//  Arithmeticus
//
//  Created by Rizaldi Septian Fauzi on 23/08/23.
//

import SwiftUI

struct MainView: View {
    
    @State private var restart: Bool = false
    
    @State private var level: Int = 100000
    @State private var score: Int = 1000
    @State private var lives: Int = 3
    
    @State private var answer: String = ""
    @State private var answerMinus: Bool = false
    @State private var correctAnswer: Bool = false
    @State private var wrongAnswer: Bool = false
    
    @State private var hintCounter: Int = 0
    @State private var hintValue: Int = 10
    @State private var hintAlert: Bool = false
    
    @State private var timeWarning: Bool = false
    @State private var timesUp: Bool = false
    @State private var time: Double = 0.0
    @State private var timePercentage: Double = 120
    
    @Binding var skipped : Bool
    @Binding var exitModal : Bool
    @Binding var reviewModal : Bool
    
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    @State private var counter: Double = 0
    
    @State private var aritmatikus: Bool = false
    @State private var earth: Bool = false
    
    let numbers0 = "1234567890"
    let numbers = "123456789"
    let operators = "+-×"
    let simpleOperators = "+-"
    @State private var operatorsAmount: Int = 0
    @State private var questions : [String] = []
    
    @State private var coloredQuestion = ""
    @State private var coloredQuestions : [String] = []
    @State private var leveledOperator : [String] = []
    
    
    @State private var question = ""
    @State private var operand = 0
    @State private var digit = 0

    var body: some View {
        VStack {
            Header(restart: $restart, level: $level, score: $score, lives: $lives, hintValue: $hintValue, hintAlert: $hintAlert, skipped: $skipped, exitModal: $exitModal, reviewModal: $reviewModal, operand: $operand)
            GameplayScreen(correctAnswer: $correctAnswer, counter: $counter, aritmatikus: $aritmatikus, earth: $earth, questions: $questions, coloredQuestions: $coloredQuestions, leveledOperator: $leveledOperator)
            HeadsUpDisplay(answer: $answer, correctAnswer: $correctAnswer, wrongAnswer: $wrongAnswer, timeWarning: $timeWarning, timesUp: $timesUp, timePercentage: $timePercentage, aritmatikus: $aritmatikus, earth: $earth)
            Keyboard()
        }
        .onReceive(timer) { input in
            if !skipped  {
                self.counter += 0.2
                withAnimation {
                    if 120..<616-time ~= timePercentage {
                            timePercentage+=time
                        if timePercentage >= 608 {
                            timePercentage = 120
                            timeWarning.toggle()
                            timesUp.toggle()
                            if lives > 1 {
                                lives -= 1
                            } else {
                                lives -= 1
                                reviewModal = true
                            }
                            withAnimation(.easeIn(duration: (495/time)*0.2)){
                                timeWarning.toggle()
                            }
                            withAnimation(.linear(duration: 0.2).delay((495/time)*0.2)) {
                                timesUp.toggle()
                            }
                        }
                    }
                }
            }
        }
        .onAppear{
            questionGenerating()
            coloredQuestion = self.questions.last ?? "error"
    
            if !skipped{
                withAnimation(.easeIn(duration: (495/time)*0.2)){
                    timeWarning.toggle()
                }
                withAnimation(.linear(duration: 0.2).delay((495/time)*0.2)) {
                    timesUp.toggle()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(skipped: .constant(false), exitModal: .constant(false), reviewModal: .constant(false))
    }
}
