//
//  ArithmeticusApp.swift
//  Arithmeticus
//
//  Created by Rizaldi Septian Fauzi on 21/08/23.
//

import SwiftUI

@main
struct ArithmeticusApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(skipped: .constant(false), exitModal: .constant(false), reviewModal: .constant(false))
        }
    }
}
