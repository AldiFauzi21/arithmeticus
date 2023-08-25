//
//  Keyboard.swift
//  Arithmeticus
//
//  Created by Rizaldi Septian Fauzi on 24/08/23.
//

import SwiftUI

struct Keyboard: View {
    
    let buttons = [
            ["1", "4", "7"],
            ["2", "5", "8"],
            ["3", "6", "9"],
            ["+", "0", "x"],
            ["="]
        ]
    
    var body: some View {
        ZStack{
            HStack(spacing: 5) {
                ForEach(buttons, id: \.self) { row in
                    VStack(spacing: 5) {
                        ForEach(row, id: \.self) { button in
                            Button(action: {
                                buttonTapped(button: button)
                            }) {
                                switch button{
                                case "+":
                                    Text("\(Image(systemName: "plus.forwardslash.minus"))")
                                        .font(.system(.title, design: .monospaced))
                                        .fontWeight(.heavy)
                                        .frame(width: buttonWidth(),
                                               height: buttonHeight(button: button))
                                        .background(buttonBackgroundColor(button: button))
                                        .foregroundColor(.white)
                                        .cornerRadius(15)
                                case "x":
                                    Text("\(Image(systemName: "delete.left.fill"))")
                                        .font(.system(.title, design: .monospaced))
                                        .fontWeight(.heavy)
                                        .frame(width: self.buttonWidth(),
                                               height: self.buttonHeight(button: button))
                                        .background(self.buttonBackgroundColor(button: button))
                                        .foregroundColor(.white)
                                        .cornerRadius(15)
                                default:
                                    Text(button)
                                        .font(.system(.title, design: .monospaced))
                                        .fontWeight(.heavy)
                                        .frame(width: self.buttonWidth(),
                                               height: self.buttonHeight(button: button))
                                        .background(self.buttonBackgroundColor(button: button))
                                        .foregroundColor(.white)
                                        .cornerRadius(15)
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard()
    }
}
