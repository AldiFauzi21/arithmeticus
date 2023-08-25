//
//  Time.swift
//  Arithmeticus
//
//  Created by Rizaldi Septian Fauzi on 24/08/23.
//

import Foundation

func timeGenerating(){
    time  = 5.0 - Double(level)*0.01
    time  = time - Double(operand)*0.01
    if time<0.5{
        time = 0.5
    }
}
