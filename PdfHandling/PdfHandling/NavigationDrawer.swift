//
//  NavigationDrawer.swift
//  PdfHandling
//
//  Created by Arun Skyraan on 20/03/23.
//

import Foundation
import SwiftUI

//
//struct DrawerContent: View {
//    
//    let colors: [Color]  = [.red, .green, .blue, .yellow, .orange]
//    
//    var body: some View {
//        VStack(spacing: 0) {
//            ScrollView {
//                ForEach(0..<colors.count, id: \.self) { index in
//                    
//                    let item = colors[index]
//                    
//                    item
//                        .frame(maxWidth: .infinity)
//                        .frame(height: 40)
//                    Divider()
//                    
//                }
//            }
//        }
//
//    }
//
//}
//
//struct NavigationDrawer: View {
//    private let width = UIScreen.main.bounds.width * 0.60
//    let isOpen: Bool
//    
//    var body: some View {
//        HStack {
//            DrawerContent()
//                .frame(width: self.width)
//                .offset(x: self.isOpen ? 0 : -self.width)
//                .animation(.default)
//            Spacer()
//        }
//        .navigationBarHidden(true)
//
//    }
//}
//
