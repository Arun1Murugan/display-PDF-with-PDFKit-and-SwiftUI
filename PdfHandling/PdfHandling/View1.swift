////
////  View1.swift
////  PdfHandling
////
////  Created by Arun Skyraan on 20/03/23.
////
//
//import SwiftUI
//import PDFKit
//
//struct View1: View {
//    
//    let pdfView = PDFView()
//    let pdfURL = Bundle.main.url(forResource: "TheWakingLights", withExtension: "pdf")!
//    
//    var body: some View {
//        TabView(selection: pdfView.currentPage?.pageRef?.pageNumber!) {
//                    ForEach(0..<pdfView.document?.pageCount!, id: \.self) { pageNumber in
//                        PDFPageView(pageNumber: pageNumber, pdfURL: pdfURL)
//                            .tabItem {
//                                Text("Page \(pageNumber + 1)")
//                            }
//                            .tag(pageNumber)
//                    }
//                }
//                .onAppear {
//                    pdfView.document = PDFDocument(url: pdfURL)
//                    pdfView.autoScales = true
//                }
//    }
//}
//
//struct View1_Previews: PreviewProvider {
//    static var previews: some View {
//        View1()
//    }
//}
//
//
//
//struct PDFPageView: View {
//    let pageNumber: Int
//    let pdfURL: URL
//    
//    var body: some View {
//        PDFViewWrapper(pdfURL: pdfURL, pageNumber: pageNumber)
//    }
//}
//
//
//
//struct PDFViewWrapper: UIViewRepresentable {
//    let pdfURL: URL
//    let pageNumber: Int
//    
//    func makeUIView(context: Context) -> PDFView {
//        let pdfView = PDFView()
//        pdfView.document = PDFDocument(url: pdfURL)
//        pdfView.go(to: pdfView.document?.page(at: pageNumber) ?? PDFPage())
//        return pdfView
//    }
//    
//    func updateUIView(_ uiView: PDFView, context: Context) {
//        uiView.go(to: uiView.document?.page(at: pageNumber) ?? PDFPage())
//    }
//}
//


import SwiftUI
import PDFKit

struct View1: View {
    @State var pdfData: Data? = nil
    @State var downloadProgress: Double = 0.0
    
    @State private var dataTask: URLSessionDataTask?
    @State private var observation: NSKeyValueObservation?

    @State var pdfURL: String = "https://web.stanford.edu/class/archive/cs/cs161/cs161.1168/lecture4.pdf?ref=programming-with-swift"
    @State var fileNameNumber = "1"
    
    var body: some View {
        ZStack {
            VStack {
                
                Button(downloadProgress * 100 > 0.0 ? "downloading pdf\(downloadProgress * 100)" : "Download PDF") {
                    downloadPDF(pdfURL: pdfURL, fileNameNumber: fileNameNumber)
                }
                
            }
            if let pdfData = pdfData {
                PDFKitView(data: pdfData)
            }
        }
        .navigationTitle("Welcome")
        .navigationBarTitleDisplayMode(.inline)

    }
    
    
    func getDirectoryPath(fileNameNumber: String) -> URL {
        
        let DocumentDirectory = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0])
        let DirPath = DocumentDirectory.appendingPathComponent("\(fileNameNumber)")
        do {
            try FileManager.default.createDirectory(atPath: DirPath!.path, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print("Unable to create directory \(error.debugDescription)")
        }
        return DirPath!
    }
    
    func downloadPDF(pdfURL: String, fileNameNumber: String) {
        
        let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0] as String
        let urlPath = NSURL(fileURLWithPath: path)
        
        if let pathComponent = urlPath.appendingPathComponent("\(fileNameNumber)") {
            print("\(pathComponent)")
            
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            
            if fileManager.fileExists(atPath: filePath) {
                
                print("FILE available at : \(filePath)")
                
                do {
                    let items = try fileManager.contentsOfDirectory(at: pathComponent, includingPropertiesForKeys: nil, options: .includesDirectoriesPostOrder)
                    
                    for (_, item) in items.enumerated() {
                        
                        let s = item.absoluteString
                        
                        if s.contains(".pdf"){
                            
                            let data = try? Data(contentsOf: item)
//                            let PDfDoc = PDFDocument(data: data!)!
                            
                            self.pdfData = data
                            
                        }
                    }

                } catch {
                    print(error.localizedDescription)
                }

            } else {
                print("File unavailable...!")
                
//                let url = URL(string: pdfURL)
//
//                let pdfData = try? Data.init(contentsOf: url!)
                
                guard let url = URL(string: "https://web.stanford.edu/class/archive/cs/cs161/cs161.1168/lecture4.pdf?ref=programming-with-swift") else { return }
                
                dataTask =  URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    DispatchQueue.main.async {
                        
                        self.pdfData = data
                        
                        if dataTask?.state == .completed {
                            
                            let directoryPath = getDirectoryPath(fileNameNumber: fileNameNumber)
                            let pdfName = "\(fileNameNumber).pdf"
                            let actualPath = directoryPath.appendingPathComponent(pdfName)

                            do {
                                try pdfData?.write(to: actualPath, options: .atomic)
                                print("actualPath : \(actualPath)")
                                print("pdf successfully saved!")
                                //file is downloaded in app data container, I can find file from x code > devices > MyApp > download Container >This container has the file
                            } catch {
                                print("ERR-\(error)")
                            }

                        }
                        
                        if dataTask?.state == .completed {
                            downloadPDF(pdfURL: pdfURL, fileNameNumber: fileNameNumber)
                        }

                    }

                }
                
                observation = dataTask?.progress.observe(\.fractionCompleted) { observationProgress, _ in
                    
                    DispatchQueue.main.async {
                        
                        downloadProgress = observationProgress.fractionCompleted
                        print("progress",downloadProgress)
                        
                    }
                }
                
                dataTask?.resume()

            }
            
        } else {
            print("File path unavailable...!")
        }

    }
    
    func viewDownloads() {
            let fileManager = FileManager.default
            guard let downloadsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
                // Handle error, unable to locate downloads directory
                return
            }
            let contents = try? fileManager.contentsOfDirectory(atPath: downloadsURL.path)
        
        print(contents as Any)
        }
    
}



//PDF UIViewRepresentable *presenting the pdf (we are using)

struct PDFKitView: UIViewRepresentable  {
    
    let data: Data
    let pdfView = PDFView()
    
    var currentPage: Int = 0
    
    func makeUIView(context: Context) -> PDFKitView.UIViewType {
        
        pdfView.document = PDFDocument(data: data)
        pdfView.autoScales = true
        pdfView.usePageViewController(true)
        pdfView.displayDirection = .horizontal
        pdfView.minScaleFactor = 2.0
        pdfView.maxScaleFactor = 5.0
        pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
//        pdfView.document?.page(at: 3)?.accessibilityPath?.fill(with: .darken, alpha: .infinity)

        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        
//        guard let pdfView = uiView as? PDFView else { return }

        uiView.document = PDFDocument(data: data)
        
        let freeTextAnnotation = PDFAnnotation(bounds: CGRect(x: 200, y: 400, width: 200, height: 50), forType: .freeText, withProperties: nil)

//        freeTextAnnotation.fontColor = .red
//
//        freeTextAnnotation.color = .purple
//
//        freeTextAnnotation.contents = "Free Text"
        
        freeTextAnnotation.font = .systemFont(ofSize: 40)
        
//        freeTextAnnotation.action = PDFActionNamed(name: <#T##PDFActionNamedName#>)
        
        pdfView.currentPage?.addAnnotation(freeTextAnnotation)
        
        let nextPageAction = PDFActionNamed(name: .nextPage)
        
//        if let nextPage = PDFDocument(data: data)?.page(at: currentPage + 1) {
//            nextPage.destination = nextPageAction
//        }
        
        if let currentPage = PDFDocument(data: data)?.page(at: 0) {
            
                            let bounds = currentPage.bounds(for: .cropBox)
            
                            let nextPageDestination = PDFDestination(page: currentPage, at: CGPoint(x: 0, y: bounds.size.height))
            
            
                        }
        
        
        let link = PDFAnnotation(bounds: CGRect(x: 40, y: 750, width: 200, height: 30), forType: .link, withProperties: nil)
        
        let highlight = PDFAnnotation(bounds: UIScreen.main.bounds , forType: .circle, withProperties: nil)
        
        let text = PDFAnnotation(bounds: CGRect(x: 40, y: 400, width: 200, height: 30), forType: .freeText, withProperties: nil)
        
//        link.contents = "click here"
//        link.color = .yellow
    
        
        highlight.color = .green
        
        highlight.backgroundColor = .red
        
        text.contents = "Destination Arrived!"
        
        link.action = PDFActionGoTo(destination: PDFDestination(page: (pdfView.document?.page(at: 3))!, at: CGPoint(x: 40, y: 430)))

        
        pdfView.currentPage?.addAnnotation(link)
        
        pdfView.currentPage?.addAnnotation(highlight)
        
        
        let buttonRect = CGRect(x: 300, y: 300, width: 100, height: 50)
        
        let button = PDFAnnotation(bounds: buttonRect, forType: .widget, withProperties: nil)
        
        button.widgetFieldType = .button
        
        button.backgroundColor = UIColor.red
        button.color = UIColor.white
        button.widgetStringValue = "Click me!"
        
        let url = URL(string: "https://www.example.com")!
        let action = PDFActionURL(url: url)
        button.action = action
        
        pdfView.document?.page(at: 2)!.addAnnotation(button)

        pdfView.currentPage?.addAnnotation(button)




        
//        pdfView.addSubview(<#T##view: UIView##UIView#>)
        
//        context.setF
        
//        context.addRect(pageRect)
//        context.drawPath(using: .fill)


    }
}



func createDirectoryWithURL(at url: URL) {
    let fileManager = FileManager.default
    
    do {
        try fileManager.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
        print("Directory created successfully at: \(url)")
    } catch {
        print("Error creating directory at \(url): \(error)")
    }
}


/*
 guard let url = URL(string: "https://web.stanford.edu/class/archive/cs/cs161/cs161.1168/lecture4.pdf?ref=programming-with-swift") else { return }
 URLSession.shared.dataTask(with: url) { data, response, error in
 guard let data = data, error == nil else { return }
 DispatchQueue.main.async {
 self.pdfData = data
 }
 
 }.resume()
 
 */



