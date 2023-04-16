//
//  ContentView.swift
//  PdfHandling
//
//  Created by Arun Skyraan on 14/03/23.
//

import SwiftUI
import UIKit
import PDFKit

struct PDFkitRepresentedView: UIViewRepresentable {
    
//    let documentURL: URL
    
//    init(documentURL: URL) {
//        self.documentURL = documentURL
//    }
    
    @Binding var Str : String
   
    func makeUIView(context: Context) -> PDFView {
        let pdfView: PDFView = PDFView()
       

//        let document = Bundle.main.url(forResource: "Sample1", withExtension: "pdf")!
        
//        Bundle.main.url(forResource: "document", withExtension: "pdf")!
        
//        let document = PDFDocument(url: Bundle.main.url(forResource: "TheWakingLights", withExtension: "pdf")!)
        
        let document = PDFDocument(url: Bundle.main.url(forResource: "Sample1", withExtension: "pdf")!)

//        let select = pdfView.currentSelection?.selectionsByLine()
//            //assuming for single-page pdf.
//            guard let page = select?.first?.pages.first else { return }
//
//            select?.forEach({ selection in
//                let highlight = PDFAnnotation(bounds: select.bounds(for: page), forType: .highlight, withProperties: nil)
//                highlight.endLineStyle = .square
//                highlight.color = UIColor.orange.withAlphaComponent(0.5)
//
//                page.addAnnotation(highlight)
//            })
//

        
//        let page = document?.page(at: 2)
//        let searchString = "The"
        
//        self.document?.beginFindString("Product", withOptions: .caseInsensitive)

//        let s = page?.document?.beginFindString(searchString)


        pdfView.document = document
//        pdfView.displayMode = .singlePage
//        pdfView.autoScales = true
//        pdfView.displayDirection = .horizontal
//        pdfView.displaysPageBreaks = true
////        pdfView.displayMode = .singlePage
//        pdfView.minScaleFactor = 2.0
//        pdfView.maxScaleFactor = 5.0
//        pdfView.delegate = self
//        let selections = pdfView.document?.findString(Str, withOptions: [.caseInsensitive])
//        // Simple scenario, assuming your pdf is single-page.
//        guard let page = selections?.first?.pages.first else { return pdfView }
//
//        selections?.forEach({ selection in
//            let highlight = PDFAnnotation(bounds: selection.bounds(for: page), forType: .highlight, withProperties: nil)
//            highlight.endLineStyle = .square
//            highlight.color = UIColor.orange.withAlphaComponent(0.5)
//
//            page.addAnnotation(highlight)
//        })
        return pdfView
        
    }
    
//    func viewDidAppear(_ animated: Bool) {
//
//        let document = PDFDocument(url: Bundle.main.url(forResource: "TheWakingLights", withExtension: "pdf")!)
//
//       viewDidAppear(animated)
//            self.document?.beginFindString("Product")
//    }
    
    func updateUIView(_ pdfView: PDFView, context: Context) {
        // Update the view if needed
       
        let selections = pdfView.document?.findString(Str, withOptions: [.caseInsensitive])
        // Simple scenario, assuming your pdf is single-page.
        guard var page = selections?.first?.pages.first else { return  }
        
        for x in page.annotations{
            page.removeAnnotation(x)
        }
        selections?.forEach({ selection in
            let highlight = PDFAnnotation(bounds: selection.bounds(for: page), forType: .highlight, withProperties: nil)
            highlight.color = UIColor.orange.withAlphaComponent(0.5)
            page.addAnnotation(highlight)
        })
        
//        for selection in pdfView.highlightedSelections! {
//            if let selection = selection as? PDFSelection {
//                let range = selection.stringRange
//                let hyperlink = (pdfView.document?.page(at: selection.pages.first!)?.attributedString?.string[range])!
//                print(hyperlink)
//            }
//        }


            
    }
    
//    func findL
    
//    - (void)PDFViewWillClickOnLink:(PDFView *)sender withURL:(NSURL *)url

    
    
//    func pdfPage
    
}



//struct PDFViewer: UIViewRepresentable {
//
//    let pdfDocument: PDFDocument
//
//    init(showing pdfDoc: PDFDocument) {
//        self.pdfDocument = pdfDoc
//    }
//
//    //you could also have inits that take a URL or Data
//
//    func makeUIView(context: Context) -> PDFView {
//        let pdfView = PDFView()
//        pdfView.document = pdfDocument
//        pdfView.autoScales = true
//        return pdfView
//    }
//
//    func updateUIView(_ pdfView: PDFView, context: Context) {
//        pdfView.document = pdfDocument
//    }
//}

//struct CustomPDFView: View {
//
//    let title: String
//    let displayedPDFUrl: URL
//
//    var body: some View {
//        VStack {
//            Text(title)
//                .accessibilityLabel("123456789")
//                .accessibilityValue(title)
//            PDFkitRepresentedView(documentURL: displayedPDFUrl)
//                .accessibilityLabel("pdf to \(displayedPDFUrl)")
//                .accessibilityValue("pdf from \(displayedPDFUrl)")
//        }
//    }
//}

struct ContentView: View {
    
//    let document = Bundle.main.url(forResource: "Sample1", withExtension: "pdf")!
    @State private var searchText: String = ""
        @State private var searchResults: [PDFSelection] = []
    
       @State private var currentPage: Int = 0
    let document = PDFDocument(url: Bundle.main.url(forResource: "TheWakingLights", withExtension: "pdf")!)

    let pdfView: PDFView = PDFView()
    var body: some View {
        VStack{
            HStack {
                TextField("Search", text: $searchText, onCommit: search)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            PDFkitRepresentedView(Str:$searchText) //this PDFkitRepresentedView is working for finding the string in pdf.
            
//            PDFKitView1(pdfDocument: document!, searchResults: searchResults) //this PDFKitView1 is not working for finding the string in pdf.
            
        }
    }
    
    func search() { // not wrkg
        guard let selection = document?.findString(searchText, withOptions: .caseInsensitive) else {
                searchResults = []
                return
            }
            searchResults = selection
        }
}

struct PDFWithNumber : Hashable {
    
    static func == (lhs: PDFWithNumber, rhs: PDFWithNumber) -> Bool {
        
        return lhs.Number == rhs.Number
    }
    
    func hash(into hasher: inout Hasher) {
        
        hasher.combine(Number)
        
    }
    
    var PDF : PDFkitRepresentedView
    var Number : Int
    var PDFdocu : PDFDocument
    
}


struct PDFKitView1: UIViewRepresentable {
    
    let pdfDocument: PDFDocument
    let searchResults: [PDFSelection]

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true
        pdfView.displayMode = .singlePageContinuous
        pdfView.displayDirection = .vertical
        pdfView.highlightedSelections = searchResults
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        uiView.highlightedSelections = searchResults
    }
}
