//
//  PDFReader.swift
//  BookMain1 (iOS)
//
//  Created by Abilash on 05/05/22.
//

import SwiftUI
import PDFKit
import UniformTypeIdentifiers
import WebKit
 struct PDFViewer: UIViewRepresentable {
     let pdfView =  PDFView(frame: UIScreen.main.bounds )
//    let Url = URL(string: "www.google.co.in")
    let pdfDocument: PDFDocument
   
//    let pdfaction = PDFAction()
//    var PdfAction = PDFActionURL(url: URL(string: "https://www.google.com")!)


//    init(pageIndex:at:fileURL:)
//    @StateObject var orientationInfo = OrientationInfo()
     
    var DisplayModeGET : PDFDisplayMode{
        
        if UIDevice.current.orientation == .portrait {
            return .singlePageContinuous
        }else{
            return .twoUpContinuous
        }
    }
    var DisplayDirectionGET : PDFDisplayDirection{
        if UIDevice.current.orientation == .portrait  {
            return .vertical
        }else{
            return .horizontal
        }
    }
    
     init(showing pdfDoc: PDFDocument ) {
        self.pdfDocument = pdfDoc
    }
    
    //you could also have inits that take a URL or Data
    
     func makeUIView(context: Context) -> PDFView {
        
        pdfView.document = pdfDocument
                pdfView.displayBox = .trimBox
        pdfView.autoScales = true
         pdfView.backgroundColor = UIColor.black
//        pdfView.maxScaleFactor = 3.0
//        pdfView.minScaleFactor = 1.5
//         pdfView.maxScaleFactor = pdfView.scaleFactorForSizeToFit
//         pdfView.minScaleFactor = 1
//         pdfView.minScaleFactor = pdfView.scaleFactorForSizeToFit
//         pdfView.autoScales = true
//         pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //        print(" M pdfView.scaleFactorForSizeToFit",pdfView.scaleFactorForSizeToFit)
//        let annotations = pdfView.currentPage?.annotations
//        let annotationsToDelete = NSMutableArray()
//        for ann in annotations!{
////            let annotationPoint = ann.bounds.origin
//            annotationsToDelete.add(ann)
////            print("annatation to delete : ",ann)
//            let radioButton = PDFAnnotation(bounds: ann.bounds, forType: .widget, withProperties: nil)
//            radioButton.widgetFieldType = .button
//            radioButton.widgetControlType = .pushButtonControl
//            radioButton.backgroundColor = UIColor.blue
////            radioButton.caption = "Button"
////            radioButton
//
////            print("bt",radioButton.)
////            page.addAnnotation(radioButton)
////            let pdff = PDFActionNamedName()
//
////            let button:UIButton = UIButton(frame: ann.bounds)
////            button.backgroundColor = UIColor.black
////            button.setTitle("Test Button", for: .normal)
//
////            button.setTitle("btn", for: .Normal)  //set button title
////            button.addTarget(self, action: #selector(self.clearButtonPressed), for: .touchUpInside)
////            pdfView.addSubview(button)
//            let PdfAction = PDFActionURL(url: URL(string: "https://www.google.com")!)
//
//            radioButton.action = PdfAction
//            pdfView.currentPage?.addAnnotation(radioButton)
////            NotificationCenter.default.addObserver(self, selector: #selector (self.clearButtonPressed), name:Notification.Name.PDFViewAnnotationHit , object: nil)
//
////            let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 100, height: 100))
////            let inkAnnotation = PDFAnnotation(bounds: ann.bounds, forType: .ink, withProperties: nil)
////            inkAnnotation.add(path)
////            pdfView.currentPage?.addAnnotation(inkAnnotation)
//
//
////            for view in self.pdfView.subviews {
////                print(view)
////
////                if let tf = view as? UIScrollView {
////                    view.addSubview(button)
////                }
////
////            }
//        }
       

//        for annotation in annotationsToDelete {
//            let onlyHighlight = annotation as! PDFAnnotation
//            print("anna : \(onlyHighlight.type) ,Url : \(onlyHighlight.url)")
////            if onlyHighlight.type == "Highlight" {
////                pdfView.currentPage?.removeAnnotation(onlyHighlight)
//                print("Removed  annotation: \(onlyHighlight)")
////            }
//        }
        return pdfView
    }
    
    func clearButtonPressed() {
           print("clearButtonPressed")
            }
    func updateUIView(_ pdfView: PDFView, context: Context) {
        //        pdfView.document = pdfDocument
//        pdfView.autoScales = true
            pdfView.minScaleFactor = pdfView.scaleFactorForSizeToFit
            pdfView.maxScaleFactor = 3.0
//                pdfView.minScaleFactor = 1.5
//        pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        
        //        pdfView.scaleFactor = pdfView.scaleFactorForSizeToFit
        //        pdfView.displayMode = .singlePage
        //        pdfView.displayDirection = .vertical
        //        pdfView.displayBox = .artBox
        
        print("U")
        //        pdfView.maxScaleFactor = 2
        //        if orientationInfo.orientation == .landscape{
        //        pdfView.minScaleFactor = 2
        //
        //        }else if orientationInfo.orientation == .portrait{
        //            pdfView.minScaleFactor = 1.5
        //        }
        
        //        pdfView.currentSelection =
        //        print("Annatatuions  : ",pdfView.currentPage?.annotations.count)
        //        pdfView.maxScaleFactor =  pdfView.scaleFactorForSizeToFit
        //        let selection = PDFSelection.init(document: pdfView.document!)
        
//
//                let annotations = pdfView.currentPage?.annotations
//                let annotationsToDelete = NSMutableArray()
//                for ann in annotations!{
//        //            let annotationPoint = ann.bounds.origin
//                    annotationsToDelete.add(ann)
//                    print("annatation to delete : ",ann)
//                }
//                for annotation in annotationsToDelete {
//                    let onlyHighlight = annotation as! PDFAnnotation
//                    print("anna : \(onlyHighlight.type) ,Url : \(onlyHighlight.url)")
//        //            if onlyHighlight.type == "Highlight" {
//        //                pdfView.currentPage?.removeAnnotation(onlyHighlight)
//                        print("Removed  annotation: \(onlyHighlight)")
//        //            }
//                }
        //
        
//               if pdfView.currentSelection != nil {
//                selection.add(pdfView.currentSelection!)
//                    let selectionBounds = selection.bounds(for: pdfView.currentPage!)
//                    let annotations = pdfView.currentPage?.annotations
//                    let annotationsToDelete = NSMutableArray()
//
//                    for annotation in annotations! {
//                        let annotationPoint = annotation.bounds.origin
//                        if selectionBounds.contains(annotationPoint) {
//                            annotationsToDelete.add(annotation)
//                            print("Anntataion Delete",annotationsToDelete)
//                        }
//                    }
//
//                    for annotation in annotationsToDelete {
//                        let onlyHighlight = annotation as! PDFAnnotation
//                        if onlyHighlight.type == "Highlight" {
//                            pdfView.currentPage?.removeAnnotation(onlyHighlight)
//                            print("Removed highlight annotation: \(onlyHighlight)")
//                        }
//                    }
//               }else{
//                   print(" currentSelection NIL")
//               }
        
    }
    
}
struct PdfViewButton{
    var Name : String
    var Image : String
}
struct St_PDfWithNO : Hashable{
    static func == (lhs: St_PDfWithNO, rhs: St_PDfWithNO) -> Bool {
        return lhs.No == rhs.No
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(No)
        
    }
    var PDf : PDFViewer
    var No : Int
    var PDFdoc : PDFDocument
}
struct St_ImageArray{
    var Img : UIImage
    var No : Int
}

//struct PDFReader: View {
//    @Environment(\.presentationMode) var presentationMode
//
//    @State var coredataresult:[Bookmark] = [Bookmark]()
//    //    func populatedata()
//    //    {
//    //        //        self.isRefreshFavUpdate = !isRefreshFavUpdate
//    //        //        coredataresult = CoreDataManagerClassObj.ShowAllBookmarks()
//    //        Toggle =  CoreDataManagerClassObj.CheckBookmarkAlreadyExist(id: BookID, SelectedIndex: Int16(SelectedIndex))
//    //    }
//    @State var PDFUrl : String
//    @State var BookTitle : String
//    @State var BookID : String
//    var BookImageUrl : String{
//        if BookID != ""{
//            return  IBDCoreDataManager.PredicateSingleBook(BookId: BookID)[0].bookImageURL!
//        }else{
//            return ""
//        }
//    }
//    @State var Wishlisted = false
//    @State var ShowMenu = false
//    @State var SelectedIndex : Int
//    @State var CoreDataManagerClassObj = CoreDataManagerClass.shared
//    let ButtonArray : [PdfViewButton] = [PdfViewButton(Name: "Favorite", Image: "star.circle"),
////                                         PdfViewButton(Name: "Search", Image: "magnifyingglass.circle"),
////                                         PdfViewButton(Name: "Crop & Share", Image: "crop"),
//                                         PdfViewButton(Name: "Bookmark", Image: "bookmark.circle"),
//                                         PdfViewButton(Name: "Share", Image: "arrowshape.turn.up.right.circle"),
////                                         PdfViewButton(Name: "Single page", Image: "rectangle.portrait.fill"),
////                                         PdfViewButton(Name: "Double page", Image: "rectangle.portrait.split.2x1.fill")
//    ]
//    //    var doc = PDFDocument()
//
//    //    @State var page = PDFPage(image: UIImage(named: "NP")!)
//    @State var PDfStArray : [St_PDfWithNO] = []
//    @State var ImageStArray : [St_ImageArray] = []
//    @State var PDFArray : [PDFViewer] =  []
//    @StateObject var orientationInfo = OrientationInfo()
//    @State var ImageArray : [UIImage?] = []
//    @State var PdfArray = ["Sample1-1","Sample1-2","Sample1-3","Sample1-4","Sample1-5","Sample1-6","Sample1-7","Sample1-8","Sample1-9","Sample1-10","Sample1-11","Sample1-12","Sample1-13","Sample1-14","Sample1-15","Sample1-16"]
//    @State var PDFDoc = PDFDocument()
//    //    @ObservedObject var DownloadManagerOBJ = DownloadManager()
//    //    @State private var showingExporter = false
//    //    @State private var isExportingDocument = false
//    @ObservedObject var LastReadPageObj = LastReadPage()
//    @ObservedObject var ShowReaderObj = ShowReader()
//    @ObservedObject var AlreadyVisitedObj = AlreadyVisited()
//    @State var fromBookMarks  = false
//    @State var Toggle = false
//    @State var BookmarkedBool : Bool = false
//    @State var PDFCount = 0
//    var WLCoreDataManager = WishListCoreDataManager.shared
//    var IBDCoreDataManager = IndividualBookCDManager.shared
//    @State var showShareSheet  = false
//    @State var PromotionArray : [Int] = [] //1,2,3,4,6
//
//    @State private var progress: Double = 0
//     private let total: Double = 1
//
//     @State private var dataTask: URLSessionDataTask?
//     @State private var observation: NSKeyValueObservation?
//
//    var TextToDisplay : String {
//        String (SelectedIndex + 1 )
//    }
//    var PromoNext : [Int]{
//        var temp : [Int] = []
//        temp = PromotionArray.map({addone(num: $0)})
//        return temp
//    }
//    func addone(num:Int)->Int{
//        return num+1
//    }
//    func drawPDFfromURL(url: URL) -> UIImage? {
//        guard let document = CGPDFDocument(url as CFURL) else { return nil }
//        guard let page = document.page(at: 1) else { return nil }
//
//        let pageRect = page.getBoxRect(.mediaBox)
//        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
//        let img = renderer.image { ctx in
//            UIColor.white.set()
//            ctx.fill(pageRect)
//            ctx.cgContext.translateBy(x: 0.0, y: pageRect.size.height)
//            ctx.cgContext.scaleBy(x: 1.0, y: -1.0)
//            ctx.cgContext.drawPDFPage(page)
//        }
//        return img
//    }
//
//    func drawPDFfromPDF(page: CGPDFPage) -> UIImage? {
//
//        let pageRect = page.getBoxRect(.mediaBox)
//        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
//        let img = renderer.image { ctx in
//            UIColor.white.set()
//            ctx.fill(pageRect)
//            ctx.cgContext.translateBy(x: 0.0, y: pageRect.size.height)
//            ctx.cgContext.scaleBy(x: 1.0, y: -1.0)
//            ctx.cgContext.drawPDFPage(page)
//        }
//        return img
//    }
//
//    func downloadFile(){
//
//        //        let urlString = PDFUrl
//        //        print("PDFUrl",PDFUrl)
//        //        let fileName = Book
//        //        let url = URL(string: urlString)
//        //        let pdfData = try? Data.init(contentsOf: url!)
//        //        PDFDoc = PDFDocument(data: pdfData!)!
//
//        savePdf(urlString: PDFUrl, fileName: BookID)
//    }
//
//    func getDirectoryPath(filename:String) -> URL {
//
//        let DocumentDirectory = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0])
//        let DirPath = DocumentDirectory.appendingPathComponent("\(filename)")
//        do
//        {
//            try FileManager.default.createDirectory(atPath: DirPath!.path, withIntermediateDirectories: true, attributes: nil)
//        }
//        catch let error as NSError
//        {
//            print("Unable to create directory \(error.debugDescription)")
//        }
//        return DirPath!
//    }
//
//    func savePdf(urlString:String, fileName:String) {
//        let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0] as String
//        let urlPath = NSURL(fileURLWithPath: path)
//        let queue = OperationQueue()
//        queue.maxConcurrentOperationCount = 1
//        queue.waitUntilAllOperationsAreFinished()
//        if let pathComponent = urlPath.appendingPathComponent("\(fileName)") {
//            let filePath = pathComponent.path
//            let fileManager = FileManager.default
//            if fileManager.fileExists(atPath: filePath) {
//                print("FILE AVAILABLE")
//                do {
//                    let items = try fileManager.contentsOfDirectory(at: pathComponent, includingPropertiesForKeys: nil, options: .includesDirectoriesPostOrder)
//                    //var x = 0
//                    PDfStArray.removeAll()
//                    ImageStArray.removeAll()
//                    PDFArray.removeAll()
//                    ImageArray.removeAll()
////                    print("items contt",items.count)
//                    let num = (items.count / 2 ) - 1
////                    print("num:",num)
//                    SampleArray.append(num)
////                    queue.addOperation {
//
////                    DispatchQueue.main.async {
//
//                    for (index,item) in items.enumerated() {
//                        print("index U",index)
//                        print("Found \(item)")
////                        queue.addOperation {
//
//                        let str = item.absoluteString
//                        //print("item.absoluteString",item.absoluteString)
//                        if str.contains(".pdf"){
////                            print("pdfff")
//                            let data = try? Data(contentsOf: item)
//                            //print("data : \(String(describing: data))")
//                            let PDfDoc = PDFDocument(data: data!)!
//                            let view = PDFViewer(showing: PDfDoc)
//                            //let str = item.absoluteString
//                            var Lastsrt = str.split(separator: "/").last
//                            //print("str",Lastsrt)
//                            let StartIndex = Lastsrt?.firstIndex(of: ".")
//                            let EndIndex = Lastsrt?.firstIndex(of: "f")
//                            Lastsrt?.removeSubrange(StartIndex!...EndIndex!)
//                            //print("NumberStr",Lastsrt)
//                            let NumberStr = Int (Lastsrt!)
//                            //print("NumberStr",NumberStr)
//
////                            if showSample{
////                                if SampleArray.contains(NumberStr!){
////                                    let st = St_PDfWithNO(PDf: view, No: NumberStr!,PDFdoc:PDfDoc)
////                                    //if index == PDfStArray.count{
////                                    PDfStArray.append(st)
////                                }
////                            }else{
//                            let st = St_PDfWithNO(PDf: view, No: NumberStr!,PDFdoc:PDfDoc)
//                            //if index == PDfStArray.count{
//                            PDfStArray.append(st)
////                            }
//
//                            //}else{
//                            //print("index D",PDfStArray.count)
//                            //}
//                        }else if str.contains(".jpg"){
////                            print("imggg")
//                            let data = try? Data(contentsOf: item)
//                            let img = UIImage(data: data!)
//                            //let img = UIImage(named: "BookTemp")
//                            var Lastsrt = str.split(separator: "/").last
////                            print("str",Lastsrt)
//                            let StartIndex = Lastsrt?.firstIndex(of: ".")
//                            let EndIndex = Lastsrt?.firstIndex(of: "g")
//                            Lastsrt?.removeSubrange(StartIndex!...EndIndex!)
//                            //print("NumberStr",Lastsrt)
//                            let NumberStr = Int (Lastsrt!)
//
////                            if showSample{
////                                if SampleArray.contains(NumberStr!){
////                            let st  = St_ImageArray(Img: img!, No: NumberStr!)
////                            ImageStArray.append(st)
////                                }
////                            }else{
//                                let st  = St_ImageArray(Img: img!, No: NumberStr!)
//                                ImageStArray.append(st)
////                            }
//
////                            else{
////                                let st  = St_ImageArray(Img: img!, No: NumberStr!)
////                                ImageStArray.append(st)
////                            }
////                            if index == items.count - 1{
////                                Toggle = true
////                            }
//                        }
//                        //}
////                    }
//                }
////                }
//
////                    PDfStArray = Array(Set(PDfStArray))
////                    queue.addOperation {
//                    PDfStArray = PDfStArray.sorted(by: {$0.No < $1.No })
//                    ImageStArray =  ImageStArray.sorted(by: {$0.No < $1.No })
//                    ImageArray = ImageStArray.map({$0.Img })
//                    PDFArray = PDfStArray.map({$0.PDf})
////                    }
//                    //for x in PDfStArray{
//                    //PDFArray.append(x.PDf)
//                    //print("cttt")
//                    //// let pg = x.PDFdoc.page(at: x.PDFdoc.pageCount - 1)
//                    //// guard let document = pg?.pageRef! else {
//                    ////print("Er in Image convertion")
//                    ////                            return
//                    ////                        }
//                    ////                        let operation =
//                    ////                        queue.addOperation {
//                    ////                            ImageArray.append(drawPDFfromPDF(page: document ))
//                    ////                        }
//                    ////                        ImageArray.append(drawPDFfromPDF(page: document))
//                    //}
//
//                } catch {
//                    // failed to read directory – bad permissions, perhaps?
//                }
////                queue.addBarrierBlock {
////                    DispatchQueue.main.async {
//                        Toggle = true
////                    }
//
////                }
//
//            } else {
//
//                print("FILE NOT AVAILABLE")
//                let url = URL(string: urlString)
////                let pdfData = try? Data.init(contentsOf: url!)
//
//                dataTask = URLSession.shared.dataTask(with: url!) { data, _, _ in
//                      guard let data = data else { return }
//                    queue.addOperation {
//                      DispatchQueue.main.async {
//                          PDFDoc = PDFDocument(data: data)!
//                          print("Data :",data)
//                          if dataTask?.state == .completed{
//                          let DirPath = getDirectoryPath(filename: fileName)
//                          for x in 0..<PDFDoc.pageCount{
//                              let pdfNameFromUrl = "\(x).pdf"
//                              let ImageNameFromUrl = "\(x).jpg"
//                              let actualPath = DirPath.appendingPathComponent(pdfNameFromUrl)
//                              let actualPathImg = DirPath.appendingPathComponent(ImageNameFromUrl)
//                              let pg = PDFDoc.page(at: x)
//                              guard let document = pg?.pageRef! else {
//                                  print("Er in Image convertion")
//                                  break
//                              }
//                              queue.addOperation {
//                                  let img = drawPDFfromPDF(page: document)
//
//                                  let PDDoc = PDFDocument()
//                                  PDDoc.insert(pg!, at: 0)
//                                  let pdfDat = PDDoc.dataRepresentation()
//                                  let ImgDat = img?.jpegData(compressionQuality: 0.5)
//                                  do {
//                                      try pdfDat?.write(to: actualPath, options: .atomic)
//                                      print("actualPath : \(actualPath)")
//                                      print("pdf successfully saved!")
//                                      try ImgDat?.write(to: actualPathImg, options: .atomic)
//                                      print("actualPathIm : \(actualPathImg)")
//                                      print("Img successfully saved!")
//                                      //file is downloaded in app data container, I can find file from x code > devices > MyApp > download Container >This container has the file
//                                  } catch {
//                                      print("ERR-\(error)")
//                                  }
//                            }
//                              }
//                          }
//                              if dataTask?.state == .completed{
//                                  queue.addOperation {
//                                  savePdf(urlString:urlString, fileName:fileName)
//                                  }
//                            }
//                      }
//                }
//                }
//                    observation = dataTask?.progress.observe(\.fractionCompleted) { observationProgress, _ in
//                      DispatchQueue.main.async {
//                              progress = observationProgress.fractionCompleted
//                          print("progress",progress)
//                      }
//                }
//                    dataTask?.resume()
//        }
//    } else {
//            print("FILE PATH NOT AVAILABLE")
//        }
//    }
//    @State var NextImdex = -1
//
//    func GetIndexOfset(num:Int) -> Int{
//        var Temp = 0
//        for x in PromotionArray{
//            if num > x {
//                Temp = Temp + 1
//            }
//        }
//        return Temp
//    }
//    @State var showSample = false
//    @State var SampleArray = [0,1,2,3,4]
//    var body: some View {
//        if Toggle {
//            ZStack{
//                //                        Text("PDF")
//                TabView(selection: $SelectedIndex){
//                    ForEach(0..<PDFArray.count,id: \.self){index  in
//                        let item = PDFArray[index]
//                        if index == 13
//                        {
//                        item
//                            .frame(width: UIScreen.main.bounds.width  , height:  UIScreen.main.bounds.height , alignment: .center)
//                            .tag(index)
//                        }else{
//                            item
//                                .frame(width: UIScreen.main.bounds.width  , height:  UIScreen.main.bounds.height , alignment: .center)
//                                .tag(index)
//                        }
//                    }
//                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//
////                                .overlay(
////                                    Text("\(SelectedIndex)")
////                                        .onAppear(perform: {
////
////                                        })
////                                )
//
//
//                    .onTapGesture(perform: {
//                        withAnimation()
//                        {
//                            ShowMenu = true
//                        }
//                    })
//                //                        } }}
//
//                if ShowMenu{
//                    Color.black.opacity(0.7)
//                        .onTapGesture(perform: {
//                            withAnimation(){
//                                ShowMenu = false
//                            }
//                        })
//                }
//                //            if ShowMenu{
//                VStack{
//                    VStack{
//                        HStack{
//                            Button(action: {
//                                PDfStArray.removeAll()
//                                ImageStArray.removeAll()
//                                PDFArray.removeAll()
//                                ImageArray.removeAll()
//                                dataTask?.cancel()
//                                observation?.invalidate()
//                                progress = 0
//                                //                            NotificationCenter.default.post(name:NSNotification.Name.init("AddToWishList"),object: BookID, userInfo: ["BookID":""])
//                                ShowReaderObj.BookID = ""
//                                AlreadyVisitedObj.AlreadyVisitedBool = 0
//                                if LastReadPageObj.PageNo.count != 0{
//                                    for (_,y) in LastReadPageObj.PageNo.enumerated(){
//
//                                        if y.key == BookID {
//                                            LastReadPageObj.PageNo[BookID] = SelectedIndex
//                                        }
//                                        else{
//                                            var dic = [String:Int]()
//                                            dic[BookID] = SelectedIndex
//                                            LastReadPageObj.PageNo[BookID] = SelectedIndex
//                                            //                                LastReadPageObj.$PageNo.append(dic)
//                                        }
//
//                                    }
//                                }else{
//                                    LastReadPageObj.PageNo[BookID] = SelectedIndex
//                                }
//                                observation?.invalidate()
//                                    dataTask?.cancel()
//                                presentationMode.wrappedValue.dismiss()
//                                PDFArray.removeAll()
//                                ImageArray.removeAll()
//
//                            }, label: {
//                                Image(systemName: "chevron.left")
//                                    .font(.system(size: 25))
//                                    .foregroundColor( Color.black.opacity(0.5))
//                            })
//                                .padding(.vertical)
//                            Text("BOOKMADDIE")
//                            //                            .font(.title)
//                                .bold()
//                                .foregroundColor( Color.black.opacity(0.5))
//
//                            Spacer()
//                            //                        Button("Export Document") {
//                            //                            self.isExportingDocument = true
//                            //                            let documentDirectory = FileManager.default.urls(for: .downloadsDirectory,
//                            //                                                                                in: .userDomainMask)[0]
//                            //                            let PdfName = documentDirectory.appendingPathComponent("example.pdf")
//                            //                            let pdfData =  PDFDoc.dataRepresentation()!
//                            //
//                            //                            // 2
//                            //                            print("PdfName : \(PdfName)")
//                            //
//                            //                            do {
//                            //                                try pdfData.write(to: PdfName)
//                            //                            }
//                            //                            catch {
//                            //                                print("error executing fetch request: \(error)")
//                            //                            }
//
//                            //                        }
//                            //                                    .background(DocumentInteractionController($isExportingDocument,
//                            //                                        url: Bundle.main.url(forResource: "sample", withExtension: "pdf")!))
//                        }
//                        .padding()
//                        .frame(height: 70)
//                        .background(Color.white)
//                        .padding(.top)
//                        Spacer()
//                        if ShowMenu && !PromotionArray.contains(SelectedIndex) && !showSample{
//                            HStack{
//                                ForEach(0..<ButtonArray.count,id: \.self){
//                                    index in
//                                    let item = ButtonArray[index]
//                                    if index <= 4 {
//                                        Spacer()
//
//                                        Button(action: {
//                                            if index == 0{
//                                                NotificationCenter.default.post(name:NSNotification.Name.init("AddToWishList"),object: BookID, userInfo: ["BookID":""])
//                                                Wishlisted = WLCoreDataManager.CheckBookAlreadyExist(id: BookID)
//                                                if !Wishlisted {
//                                                    DispatchQueue.main.async{
//                                                        WLCoreDataManager.FetchAndSameBook(Bookid: BookID, BookName: BookTitle, BookImageUrl: BookImageUrl , AuthorNAme: "", Size: "", Publication: "", Doanloaded: false,CategoriesName: "",CategoriesID: "")
//                                                        Wishlisted = WLCoreDataManager.CheckBookAlreadyExist(id: BookID)
//                                                    }
//                                                }else{
//                                                    //
//                                                    WLCoreDataManager.deleteWishListedBook(WishListBook: WLCoreDataManager.PredicateSingleBook(BookId: BookID)[0])
//                                                    Wishlisted = WLCoreDataManager.CheckBookAlreadyExist(id: BookID)
//                                                }
//                                            }
//                                            if index == 1 {
//                                                //                                            let Img = UIImage(named: "BookTemp")!
//                                                //                                            let imgData = Img.jpegData(compressionQuality: 1)
//                                                let imgData = ImageArray[SelectedIndex]?.jpegData(compressionQuality: 1)
//                                                CoreDataManagerClassObj.SaveBookmark(PdfUrl: PDFUrl, BookTitle: BookTitle, BookId: BookID, imageData: imgData!, SelectedIndex:SelectedIndex -  GetIndexOfset(num:SelectedIndex))
//                                                print("ct:\(CoreDataManagerClassObj.ShowAllBookmarks().count)")
//                                                BookmarkedBool = CoreDataManagerClassObj.CheckBookmarkAlreadyExist(id: BookID, SelectedIndex: Int16(SelectedIndex) -  Int16(GetIndexOfset(num:SelectedIndex)))
//                                                print("SI",SelectedIndex)
//                                                print("SI",GetIndexOfset(num:SelectedIndex))
//                                                print("SI",Int16(SelectedIndex) -  Int16(GetIndexOfset(num:SelectedIndex)))
//                                            }
//                                            if index == 2 {
//                                                showShareSheet = true
//                                            }
//                                            //                                        populatedata()
//                                        }, label: {
//                                            //                                         if index == 0{
//                                            VStack{
//                                                Image(systemName: item.Image)
//                                                    .foregroundColor(index == 0 ? Wishlisted ? Color.blue : Color.white : index == 1 && BookmarkedBool ? Color.blue : Color.white)
//                                                    .font(.system(size:50))
//                                                Text(index == 1  && BookmarkedBool ? "Bookmarked" : item.Name)
//                                                    .bold()
//                                                    .foregroundColor(index == 0 ? Wishlisted ? Color.blue : Color.white : index == 1 && BookmarkedBool  ? Color.blue : Color.white)
//                                                    .font(.system(size: 10, weight: .heavy, design: .default))
//                                                    .padding(.vertical,10)
//                                                    .frame(width: 70)
//                                            }
//                                        })
//                                        Spacer()
//                                    }
//                                }
//                            }.frame(width: UIScreen.main.bounds.width - 100)
//                        }
//                    }.frame(height:320)
//                        .offset( y: ShowMenu ? 0 : -320)
//                    Spacer()
//                    VStack{
//                        HStack{
//                            Text(BookTitle)
//                                .lineLimit(1)
//                                .truncationMode(.tail)
//                            Spacer()
////                            Text("\(SelectedIndex % 2 == 0 ?  SelectedIndex == 0 ? "\(SelectedIndex + 1)" : "\(SelectedIndex)-\(SelectedIndex + 1)" : SelectedIndex + 1 == ImageArray.count ? "\(ImageArray.count)" : "\(SelectedIndex + 1)-\(SelectedIndex + 2)" ) / \(ImageArray.count)")
////                            if !PromotionArray.contains(SelectedIndex){
//                            Text("\(SelectedIndex + 1 - GetIndexOfset(num : SelectedIndex))/\(ImageArray.count - PromotionArray.count)")
////                            }
//
//                        }
//                        .padding([.top,.leading],8)
//                        //.border(Color.green)
//                        ScrollViewReader{ val in
//                            ScrollView(.horizontal,showsIndicators: false){
//                                LazyHGrid(rows: [GridItem(.flexible())]){
//                                    ForEach(0..<ImageArray.count,id: \.self){
//                                        index in
//
//                                        //let item = ImageArray[index]
//                                        if PromotionArray.contains(index){
//                                            if index % 2 == 0{
//                                                if !PromotionArray.contains(index - 1){
//                                               if index > 0 {
//                                                Button(action: {
//
//                                                    print(PDFArray.count)
//                                                    SelectedIndex = index - 1
//                                                    withAnimation(){
////                                                        ShowMenu = false
//                                                    }
//                                                    print("SelectedIndex 1",SelectedIndex)
//                                                }, label: {
//                                                    LazyVStack(alignment: .center){
//                                                        Image(uiImage:ImageArray[index - 1]!)
//                                                            .resizable()
//                                                            .frame(width: 80, height: 110, alignment: .center)
//                                                            .border(SelectedIndex == index - 1 ? Color.blue : Color.gray,width: 2)
//                                                        Text("\(index - GetIndexOfset(num : index))")
//                                                    }
//                                                }).id(index)
//                                            }
//                                                }
//                                                Button(action: {
//
//                                                    print(PDFArray.count)
//                                                    SelectedIndex = index
//                                                    withAnimation(){
////                                                        ShowMenu = false
//                                                    }
//                                                    print("SelectedIndex 2",SelectedIndex)
//                                                }, label: {
//                                                    LazyVStack(alignment: .center){
//                                                        Image(uiImage:ImageArray[index]!)
//                                                            .resizable()
//                                                            .frame(width: 80, height: 110, alignment: .center)
//                                                            .border(SelectedIndex == index ? Color.yellow : Color.yellow,width: 2)
//                                                        Text("Promotion")
//                                                            .foregroundColor(Color.yellow)
//                                                    }
//                                                }).id(index)
//                                            }else{
//                                            Button(action: {
//
//                                                print(PDFArray.count)
//                                                SelectedIndex = index
//                                                withAnimation(){
////                                                    ShowMenu = false
//                                                }
//                                                print("SelectedIndex 3",SelectedIndex)
//                                            }, label: {
//                                                LazyVStack(alignment: .center){
//                                                    Image(uiImage:ImageArray[index]!)
//                                                        .resizable()
//                                                        .frame(width: 80, height: 110, alignment: .center)
//                                                        .border(SelectedIndex == index  ? Color.yellow : Color.yellow,width: 2)
//                                                    Text("Promotion")
//                                                        .foregroundColor(Color.yellow)
//                                                }
//                                            }).id(index)
//                                                if !PromotionArray.contains(index + 1){
//                                                Button(action: {
//
//                                                    print(PDFArray.count)
//                                                    SelectedIndex = index + 1
//                                                    withAnimation(){
////                                                        ShowMenu = false
//                                                    }
//                                                    print("SelectedIndex 4",SelectedIndex)
//                                                }, label: {
//                                                    LazyVStack(alignment: .center){
//                                                        Image(uiImage:ImageArray[index + 1]!)
//                                                            .resizable()
//                                                            .frame(width: 80, height: 110, alignment: .center)
//                                                            .border(SelectedIndex == index + 1 ? Color.black : Color.gray,width: 2)
////                                                        Text("\(index + 2 - GetIndexOfset(num : index))")
//                                                        Text("\(index + 1 - GetIndexOfset(num : index))")
//                                                    }
//                                                }).id(index)
//                                            }
//
//                                        }
//                                        }else{
//                                            if !(index == 0) {
//                                            if index % 2 == 0 && !PromotionArray.contains(index - 1){
//                                            Button(action: {
//
//                                                print(PDFArray.count)
//                                                SelectedIndex = index - 1
//                                                withAnimation(){
////                                                    ShowMenu = false
//                                                }
////                                                print("SelectedIndex 5",SelectedIndex)
//                                            }, label: {
//                                                LazyVStack{
//                                                    LazyHStack(alignment: .center){
//                                                        Image(uiImage:ImageArray[index - 1]!)
//                                                            .resizable()
//                                                            .frame(width: 80, height: 110, alignment: .center)
//
//                                                        Image(uiImage: ImageArray[index]!)
//                                                            .resizable()
//                                                            .frame(width: 80, height: 110, alignment: .center)
//
//                                                    }.border(SelectedIndex <= index  && SelectedIndex >= index - 1 ? Color.blue : Color.gray,width: 2)
//                                                    HStack{
//                                                        Text("\(index - GetIndexOfset(num : index) )")
//                                                        Spacer()
//                                                        Text("\(index+1 - GetIndexOfset(num : index) )")
//                                                    }.padding(.horizontal)
//                                                }
//                                            }).id(index)
//
//                                            }else if index == ImageArray.count - 1{
//                                                Button(action: {
//
//                                                    print(PDFArray.count)
//                                                    SelectedIndex = index
//                                                    withAnimation(){
////                                                        ShowMenu = false
//                                                    }
////                                                    print("SelectedIndex 6",SelectedIndex)
//                                                }, label: {
//                                                    LazyVStack(alignment: .center){
//                                                        Image(uiImage:ImageArray[index]!)
//                                                            .resizable()
//                                                            .frame(width: 80, height: 110, alignment: .center)
//                                                            .border(SelectedIndex == index ? Color.blue : Color.gray,width: 2)
//                                                        Text("\(index+1 - GetIndexOfset(num : index))")
//                                                    }
//                                                }).id(0)
//
//                                            }
//                                            }else{
//                                                Button(action: {
//
//                                                    print(PDFArray.count)
//                                                    SelectedIndex = 0
//                                                    withAnimation(){
////                                                        ShowMenu = false
//                                                    }
////                                                    print("SelectedIndex 7",SelectedIndex)
//                                                }, label: {
//                                                    LazyVStack(alignment: .center){
//                                                        Image(uiImage:ImageArray[0]!)
//                                                            .resizable()
//                                                            .frame(width: 80, height: 110, alignment: .center)
//                                                            .border(SelectedIndex == 0 ? Color.blue : Color.gray,width: 2)
//                                                        Text("\(index + 1 - GetIndexOfset(num : index))")
//                                                    }
//                                                }).id(0)
//                                            }
//
//
////                                                else {
////                                                    Button(action: {
////                                                        //PDFArray.append( PDFViewer(showing: doc))
////                                                        print(PDFArray.count)
////                                                        SelectedIndex = index
////                                                        withAnimation(){
////                                                            ShowMenu = false
////                                                        }
////                                                        //print("SelectedIndex",SelectedIndex)
////                                                    }, label: {
////                                                        LazyVStack{
////                                                            LazyHStack(alignment: .center){
////                                                                Image(uiImage:ImageArray[index]!)
////                                                                    .resizable()
////                                                                    .frame(width: 80, height: 110, alignment: .center)
////                                                                if index + 1 < ImageArray.count{
////                                                                Image(uiImage: ImageArray[index + 1]!)
////                                                                    .resizable()
////                                                                    .frame(width: 80, height: 110, alignment: .center)
////                                                                }
////                                                            }.border(SelectedIndex <= index  && SelectedIndex >= index - 1 ? Color.red : Color.gray,width: 2)
////                                                            HStack{
////                                                                Text("\(index)")
////                                                                Spacer()
////                                                                Text("\(index + 1)")
////                                                            }.padding(.horizontal)
////                                                        }
////                                                    }).id(index)
////                                                        .onAppear(perform: {
////                                                            NextImdex = index
////                                                        })
////                                            }
//
////                                            if !PromoNext.contains(index){
////                                        if index % 2 == 0{
////                                            if index == 0{
////                                                Button(action: {
////                                                    //PDFArray.append( PDFViewer(showing: doc))
////                                                    print(PDFArray.count)
////                                                    SelectedIndex = index
////                                                    withAnimation(){
////                                                        ShowMenu = false
////                                                    }
////                                                    //print("SelectedIndex",SelectedIndex)
////                                                }, label: {
////                                                    LazyVStack(alignment: .center){
////                                                        Image(uiImage:ImageArray[index]!)
////                                                            .resizable()
////                                                            .frame(width: 80, height: 110, alignment: .center)
////                                                            .border(SelectedIndex == index ? Color.black : Color.gray,width: 2)
////                                                        Text("\(index + 1)")
////                                                    }
////                                                }).id(index)
////                                            }else {
////                                                Button(action: {
////                                                    //PDFArray.append( PDFViewer(showing: doc))
////                                                    print(PDFArray.count)
////                                                    SelectedIndex = index - 1
////                                                    withAnimation(){
////                                                        ShowMenu = false
////                                                    }
////                                                    //print("SelectedIndex",SelectedIndex)
////                                                }, label: {
////                                                    LazyVStack{
////                                                        LazyHStack(alignment: .center){
////                                                            Image(uiImage:ImageArray[index - 1]!)
////                                                                .resizable()
////                                                                .frame(width: 80, height: 110, alignment: .center)
////
////
////
////                                                            Image(uiImage: ImageArray[index]!)
////                                                                .resizable()
////                                                                .frame(width: 80, height: 110, alignment: .center)
////
////
////                                                        }.border(SelectedIndex <= index  && SelectedIndex >= index - 1 ? Color.green : Color.gray,width: 2)
////                                                        HStack{
////                                                            Text("\(index )")
////                                                            Spacer()
////                                                            Text("\(index + 1)")
////                                                        }.padding(.horizontal)
////                                                    }
////                                                }).id(index)
////                                            }
////                                        }
////                                                else if ImageArray.count == index + 1{
////                                            Button(action: {
////                                                //PDFArray.append( PDFViewer(showing: doc))
////                                                print(PDFArray.count)
////                                                SelectedIndex = index
////                                                withAnimation(){
////                                                    ShowMenu = false
////                                                }
////                                                // print("SelectedIndex",SelectedIndex)
////                                            }, label: {
////                                                VStack(alignment: .center){
////                                                    Image(uiImage: ImageArray[index]!)
////                                                    // Image(uiimage:ImageArray[index])
////                                                        .resizable()
////                                                        .frame(width: 80, height: 110, alignment: .center)
////                                                        .border(SelectedIndex == index ? Color.red : Color.gray,width: 2)
////                                                    Text("\(index + 1)")
////                                                }
////                                            }).id(index)
////                                        }
////                                            }else{
////                                                Button(action: {
////                                                    //PDFArray.append( PDFViewer(showing: doc))
////                                                    print(PDFArray.count)
////                                                    SelectedIndex = index
////                                                    withAnimation(){
////                                                        ShowMenu = false
////                                                    }
////                                                    //print("SelectedIndex",SelectedIndex)
////                                                }, label: {
////                                                    LazyVStack(alignment: .center){
////                                                        Image(uiImage:ImageArray[index]!)
////                                                            .resizable()
////                                                            .frame(width: 80, height: 110, alignment: .center)
////                                                            .border(SelectedIndex == index ? Color.blue : Color.gray,width: 2)
////                                                        Text("\(index)")
////                                                    }
////                                                }).id(index)
////                                            }
//                                        }
//                                    }
//                                }
//                            }.frame(height: 150)
//                                .onAppear(perform: {
////                                    SelectedIndex = SelectedIndex + GetIndexOfset(num: SelectedIndex)
//                                    val.scrollTo(SelectedIndex)
//                                })
//                                .onChange(of: SelectedIndex, perform: {
//                                    _ in
////                                    SelectedIndex = SelectedIndex + GetIndexOfset(num: SelectedIndex)
//                                    val.scrollTo(SelectedIndex)
//                                    if !PromotionArray.contains(SelectedIndex){
//                                        if !showSample{
//                                    if LastReadPageObj.PageNo.count != 0{
//                                        for (_,y) in LastReadPageObj.PageNo.enumerated(){
//
//                                            if y.key == BookID {
//                                                let ind = SelectedIndex - GetIndexOfset(num: SelectedIndex)
////                                                print("ind 1" ,ind)
//                                                LastReadPageObj.PageNo[BookID] = ind
//                                            }
//                                            else{
//                                                var dic = [String:Int]()
//                                                let ind = SelectedIndex - GetIndexOfset(num: SelectedIndex)
//                                                dic[BookID] = ind
////                                                print("ind 2" ,ind)
//                                                LastReadPageObj.PageNo[BookID] = ind
//                                                // LastReadPageObj.$PageNo.append(dic)
//                                            }
//
//                                        }
//                                    }else{
//                                        let ind = SelectedIndex - GetIndexOfset(num: SelectedIndex)
////                                        dic[BookID] = ind
////                                        print("ind 3" ,ind)
//                                        LastReadPageObj.PageNo[BookID] = ind
//                                    }
//                                    }
//                                }
////                                    BookmarkedBool = CoreDataManagerClassObj.CheckBookmarkAlreadyExist(id: BookID, SelectedIndex: Int16(SelectedIndex))
//                                    BookmarkedBool = CoreDataManagerClassObj.CheckBookmarkAlreadyExist(id: BookID, SelectedIndex:   Int16(SelectedIndex - GetIndexOfset(num: SelectedIndex)))
//                                })
//
//                                .onChange(of: ImageArray.count, perform: {
//                                    _ in
////                                    SelectedIndex = SelectedIndex + GetIndexOfset(num: SelectedIndex)
//                                    val.scrollTo(SelectedIndex)
////                                    BookmarkedBool = CoreDataManagerClassObj.CheckBookmarkAlreadyExist(id: BookID, SelectedIndex: Int16(SelectedIndex))
//                                    BookmarkedBool = CoreDataManagerClassObj.CheckBookmarkAlreadyExist(id: BookID, SelectedIndex:   Int16(SelectedIndex - GetIndexOfset(num: SelectedIndex)))
//                                })
//                        }
//                        //.border(Color.blue)
//                        .padding(.horizontal,10)
//                    }
//
//                    .padding(5)
//                    .border(Color.red)
//                    .background(Color.white)
//                    .offset( y: ShowMenu ? 0 : 200)
//                }
//                //            }
//            }
//            .ignoresSafeArea()
//            .edgesIgnoringSafeArea(.all)
//            .navigationBarHidden(true)
//            .onAppear(perform: {
////                downloadFile()
//
//                //                if BookID != ""{
//                //                    BookID = ""
//                //                    ShowReaderObj.BookID = ""
//                //                }
//
//                ShowReaderObj.BookID = BookID
//                if !showSample{
//                print("AlreadyVisitedObj.AlreadyVisitedBoo",AlreadyVisitedObj.AlreadyVisitedBool)
//                AlreadyVisitedObj.AlreadyVisitedBool += 1
//                if AlreadyVisitedObj.AlreadyVisitedBool == 3{
//                    AlreadyVisitedObj.AlreadyVisitedBool = 0
//                    ShowReaderObj.BookID = ""
//                }
//                }
//                print("AlreadyVisitedObj.AlreadyVisitedBoo",AlreadyVisitedObj.AlreadyVisitedBool)
//                /* PDF From URl*/
//                if !fromBookMarks{
//                    for x  in LastReadPageObj.PageNo{
//                        print("SavedPage : \(x)")
//                        if BookID == x.key{
//                            SelectedIndex = x.value
//
//                        }
//                    }
//                }
//
//                if fromBookMarks{
//
//                    print("SelectedIndexz",SelectedIndex)
//                    BookmarkedBool = CoreDataManagerClassObj.CheckBookmarkAlreadyExist(id: BookID, SelectedIndex:   Int16(SelectedIndex - GetIndexOfset(num: SelectedIndex)))
//
////                    SelectedIndex = SelectedIndex + GetIndexOfset(num: SelectedIndex)
////                    SelectedIndex = SelectedIndex + GetIndexOfset(num: SelectedIndex)
////               for x in  CoreDataManagerClassObj.ShowAllBookmarks()
////                {
////                   if x.bookId == BookID{
////                       SelectedIndex = Int(x.selectedIndex)
////                       print("SelectedIndex",SelectedIndex)
////                   }
////               }
//            }
//
////                SelectedIndex = SelectedIndex + GetIndexOfset(num: SelectedIndex)
////                Sample1-10"
//
//                let url = Bundle.main.url(forResource: "sample", withExtension: "pdf")!
//                PDFDoc = PDFDocument(url: url)!
//                for x in PromotionArray{
////                    if x < PdfArray.count{
//                    PDFArray.insert(PDFViewer(showing: PDFDocument(url: url)!), at: x)
//                    ImageArray.insert(drawPDFfromURL(url: url), at: x)
////                    }
//                }
//                print("SelectedIndexy",SelectedIndex)
//
////                SelectedIndex = SelectedIndex + GetIndexOfset(num: SelectedIndex)
//
////                for x in array{
////                    print("int : ",Ck(num: x))
////                }
//                /* MultiPage PDF as Single Page PDF*/
//
//                //let url = Bundle.main.url(forResource: "Sample1", withExtension: "pdf")!
//                //                PDFDoc = PDFDocument(url: url)!
//                //                for x in 0..<PDFDoc.pageCount{
//                //                let pg = PDFDoc.page(at: x)
//                //                    let PDDoc = PDFDocument()
//                //                    PDDoc.insert(pg!, at: 0)
//                //                    PDFArray.append(PDFViewer(showing: PDDoc))
//                //                    let document = CGPDFDocument(url as! CFURL)
//                //                    let page = document!.page(at: x + 1)!
//                //ImageArray.append(drawPDFfromPDF(page: page as! CGPDFPage))
//                //
//                //                }
//
//
//                /* Single Page as PDF*/
//                //                for pdf in PdfArray{
//                //let url = Bundle.main.url(forResource: pdf, withExtension: "pdf")!
//                //                    PDFDoc = PDFDocument(url: url)!
//                //
//                // PDFArray.append(PDFViewer(showing: PDFDocument(url: url)!))
//                //                    ImageArray.append(drawPDFfromURL(url: url))
//                //                }
//
//
//            })
//            .onChange(of: SelectedIndex, perform: {
//                _ in
//                ShowReaderObj.BookID = BookID
//            })
//            .sheet(isPresented: $showShareSheet) {
//                ShareSheet(activityItems: ["Hello World"])
//            }
//
//
//            //            .fileExporter(isPresented: $showingExporter, document: PDFdocument(Pdf: PDFDoc), contentType: .pdf) { result in
//            //                switch result {
//            //                case .success(let url):
//            //                    print("Saved to \(url)")
//            //                case .failure(let error):
//            //                    print(error.localizedDescription)
//            //                }
//            //            }
//
//        }else{
//            let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0] as String
//            let urlPath = NSURL(fileURLWithPath: path)
//            if let pathComponent = urlPath.appendingPathComponent("\(BookID)") {
//                let filePath = pathComponent.path
//                let fileManager = FileManager.default
//                if fileManager.fileExists(atPath: filePath) {
//
//                    VStack{
//                        LoaderView()
//                    }
//                    .navigationBarHidden(true)
//                    .onAppear(perform: {
//                        Wishlisted = WLCoreDataManager.CheckBookAlreadyExist(id: BookID)
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                            downloadFile()
//
//                        }
//                    })
//
//                }else{
//                    VStack{
//                        LoaderView()
//                            .scaleEffect(2)
//                        if !showSample{
//                        if progress < 1 {
//                        Text("\(Int(progress * 100))%")
//                            .padding()
//                        }
//                        if (Int(progress * 100)) == 100{
//                            Text("Loading...")
//                                .padding()
//                        }
//                        if PDFCount > 0{
//                            Text("\(PDFCount)")
//                        }
//                    }
//                    }
//                    .navigationBarHidden(true)
//                    .onAppear(perform: {
//                        Wishlisted = WLCoreDataManager.CheckBookAlreadyExist(id: BookID)
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                            if !showSample{
//                            downloadFile()
//                            }else{
//                                let url = URL(string: PDFUrl)
//                                let pdfData = try? Data.init(contentsOf: url!)
////                                    print("pdfData",pdfData)
//                                let PDfDoc = PDFDocument(data: pdfData!)!
//                                for x in SampleArray{
//                                    let pg = PDfDoc.page(at: x)
//                                    let Dc = PDFDocument()
//                                    Dc.insert(pg!, at: 0)
//                                let view = PDFViewer(showing: Dc)
//                                guard let document = pg?.pageRef! else {
//                                    print("Er in Image convertion")
//                                    break
//                                }
//                                    let img = drawPDFfromPDF(page: document)
//                                    let stImg  = St_ImageArray(Img: img!, No: x)
//                                    ImageStArray.append(stImg)
//                                    let stPdg = St_PDfWithNO(PDf: view, No: x,PDFdoc:Dc)
//                                    //if index == PDfStArray.count{
//                                    PDfStArray.append(stPdg)
//                            }
//                                PDfStArray = PDfStArray.sorted(by: {$0.No < $1.No })
//                                ImageStArray =  ImageStArray.sorted(by: {$0.No < $1.No })
//                                ImageArray = ImageStArray.map({$0.Img })
//                                PDFArray = PDfStArray.map({$0.PDf})
//                                Toggle = true
//                            }
//                        }
//                    })
//                }
//            }
//        }
//    }
//}

//struct PDFReader_Previews: PreviewProvider {
//    static var previews: some View {
//        PDFReader()
//    }
//}
