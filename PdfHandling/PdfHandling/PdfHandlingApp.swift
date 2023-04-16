//
//  PdfHandlingApp.swift
//  PdfHandling
//
//  Created by Arun Skyraan on 14/03/23.
//

import SwiftUI

@main
struct PdfHandlingApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
//                ContentView1()

                View1()
//                TestPDFViewNavigation()
//                ContentView2()
            }
            .navigationViewStyle(.stack)
        }
    }
}
