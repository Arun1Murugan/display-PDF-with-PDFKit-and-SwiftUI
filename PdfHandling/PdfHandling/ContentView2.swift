//import SwiftUI
//import PDFKit
//
//struct PDFKitView2: View {
//
//@State var pdf: Data? = nil
//@Binding var pageIndex: Int
//
//var body: some View {
//    VStack {
//        PDFPreviewController(pdfX: $pdf , pageIndex: $pageIndex )
//    }
//}
//    func getDirectoryPath(fileNameNumber: String) -> URL {
//        
//        let DocumentDirectory = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0])
//        let DirPath = DocumentDirectory.appendingPathComponent("\(fileNameNumber)")
//        do {
//            try FileManager.default.createDirectory(atPath: DirPath!.path, withIntermediateDirectories: true, attributes: nil)
//        } catch let error as NSError {
//            print("Unable to create directory \(error.debugDescription)")
//        }
//        return DirPath!
//    }
//
//    func downloadPDF(pdfURL: String, fileNameNumber: String) {
//
//        let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0] as String
//        let urlPath = NSURL(fileURLWithPath: path)
//
//        if let pathComponent = urlPath.appendingPathComponent("\(fileNameNumber)") {
//            print("\(pathComponent)")
//
//            let filePath = pathComponent.path
//            let fileManager = FileManager.default
//
//            if fileManager.fileExists(atPath: filePath) {
//
//                print("FILE available at : \(filePath)")
//
//                do {
//                    let items = try fileManager.contentsOfDirectory(at: pathComponent, includingPropertiesForKeys: nil, options: .includesDirectoriesPostOrder)
//
//                    for (_, item) in items.enumerated() {
//
//                        let s = item.absoluteString
//
//                        if s.contains(".pdf"){
//
//                            let data = try? Data(contentsOf: item)
////                            let PDfDoc = PDFDocument(data: data!)!
//
//                            self.pdfData = data
//
//                        }
//                    }
//
//                } catch {
//                    print(error.localizedDescription)
//                }
//
//            } else {
//                print("File unavailable...!")
//
////                let url = URL(string: pdfURL)
////
////                let pdfData = try? Data.init(contentsOf: url!)
//
//                guard let url = URL(string: "https://web.stanford.edu/class/archive/cs/cs161/cs161.1168/lecture4.pdf?ref=programming-with-swift") else { return }
//
//                dataTask =  URLSession.shared.dataTask(with: url) { data, response, error in
//                    guard let data = data, error == nil else { return }
//                    DispatchQueue.main.async {
//
//                        self.pdfData = data
//
//                        if dataTask?.state == .completed {
//
//                            let directoryPath = getDirectoryPath(fileNameNumber: fileNameNumber)
//                            let pdfName = "\(fileNameNumber).pdf"
//                            let actualPath = directoryPath.appendingPathComponent(pdfName)
//
//                            do {
//                                try pdfData?.write(to: actualPath, options: .atomic)
//                                print("actualPath : \(actualPath)")
//                                print("pdf successfully saved!")
//                                //file is downloaded in app data container, I can find file from x code > devices > MyApp > download Container >This container has the file
//                            } catch {
//                                print("ERR-\(error)")
//                            }
//
//                        }
//
//                        if dataTask?.state == .completed {
//                            downloadPDF(pdfURL: pdfURL, fileNameNumber: fileNameNumber)
//                        }
//
//                    }
//
//                }
//
//                observation = dataTask?.progress.observe(\.fractionCompleted) { observationProgress, _ in
//
//                    DispatchQueue.main.async {
//
//                        downloadProgress = observationProgress.fractionCompleted
//                        print("progress",downloadProgress)
//
//                    }
//                }
//
//                dataTask?.resume()
//
//            }
//
//        } else {
//            print("File path unavailable...!")
//        }
//
//    }
//
//    func viewDownloads() {
//            let fileManager = FileManager.default
//            guard let downloadsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
//                // Handle error, unable to locate downloads directory
//                return
//            }
//            let contents = try? fileManager.contentsOfDirectory(atPath: downloadsURL.path)
//
//        print(contents as Any)
//        }
//}
//
//class PDFPreviewViewConroller: UIViewController {
//
//public var pdfView: PDFView!
//
//override func loadView() {
//
//    pdfView = PDFView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//
//    self.view = pdfView
//}
//
//override func viewDidLoad() {
//    super.viewDidLoad()
//}
//}
//
//struct PDFPreviewController: UIViewControllerRepresentable {
//
//@Binding var pdf: Data
//@Binding var pageIndex: Int
//
//init(pdfX: Binding<Data>, pageIndex: Binding<Int>) {
//    _pdf = pdfX
//    _pageIndex = pageIndex
//}
//
//func makeUIViewController(context: UIViewControllerRepresentableContext<PDFPreviewController>) -> PDFPreviewViewConroller {
//
//    return PDFPreviewViewConroller()
//}
//
//func updateUIViewController(_ uiViewController: PDFPreviewViewConroller, context: UIViewControllerRepresentableContext<PDFPreviewController>) {
//
//    uiViewController.pdfView.document = PDFDocument(data: pdf)
//
//    if let myPage = uiViewController.pdfView.document?.page(at: (pageIndex)) {
//        uiViewController.pdfView.go(to: myPage)
//    }
//}
//
//func makeCoordinator() -> Coordinator {
//    Coordinator(pdf: $pdf, pageIndex: $pageIndex)
//}
//
//class Coordinator: NSObject {
//
//    @Binding var pageIndex: Int
//    @Binding var pdf: Data
//
//    init(pdf: Binding<Data>, pageIndex: Binding<Int>) {
//        _pageIndex = pageIndex
//        _pdf = pdf
//    }
//}
//}
