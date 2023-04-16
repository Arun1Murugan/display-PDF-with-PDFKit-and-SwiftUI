// BOYCOTT on russia! Don't buy, sell, support - HELP TO STOP WAR!
// «Русский военный корабль, иди на хуй!» (c) Ukrainian Frontier Guard
//
// ATTENTION: This is a demo - use it as you wish. Reference is appriciated.
// If you want to thank - buy me coffee: https://secure.wayforpay.com/donate/asperi

import SwiftUI
import PDFKit

struct TestPDFViewNavigation: View {
	var body: some View {
		PDFKitView(url: Bundle.main.url(forResource: "TheWakingLights", withExtension: "pdf")!)
	}

	struct PDFKitView: View {
		var url: URL

		@State var currentPage: Int = 0
		@State var total: Int = 0

		var body: some View {
			VStack {
                
				HStack {
                    
					Button("<") { currentPage -= 1 }.padding()
						.disabled(currentPage == 0)
                    
					Button(">") { currentPage += 1 }.padding()
						.disabled(currentPage == total - 1)
				}
                
				PDFKitRepresentedView(url, $currentPage, $total)
                
			}
            .navigationBarHidden(true)
		}
	}

	struct PDFKitRepresentedView: UIViewRepresentable {
		let url: URL
		@Binding var currentPage: Int
		@Binding var total: Int

		init(_ url: URL, _ currentPage: Binding<Int>, _ total: Binding<Int>) {
			self.url = url
			self._currentPage = currentPage
			self._total = total
		}

		func makeUIView(context: Context) -> UIView {
            
            
			guard let document = PDFDocument(url: self.url) else { return UIView() }

            let pdfView = PDFView()
            
            //hide scroll indicators
            let pdfScrollView = pdfView.subviews.first?.subviews.first as? UIScrollView
            
            pdfScrollView?.showsHorizontalScrollIndicator = false
            pdfScrollView?.showsVerticalScrollIndicator = false
            
			print("PDFVIEW IS CREATED")
            
			pdfView.document = document
			pdfView.displayDirection = .horizontal
            pdfView.displaysPageBreaks = false
			pdfView.autoScales = true
			pdfView.usePageViewController(true)
            pdfView.maxScaleFactor = 5.0
            pdfView.minScaleFactor = pdfView.scaleFactorForSizeToFit

			DispatchQueue.main.async {
				self.total = document.pageCount
				print("Total pages: \(total)")
			}
            
			return pdfView
		}

		func updateUIView(_ uiView: UIView, context: Context) {
            
//            let page = document.page(at: 0)!

			guard let pdfView = uiView as? PDFView else { return }

			if currentPage < total {
				pdfView.go(to: pdfView.document!.page(at: currentPage)!)
			}
            
		}

	}
}

struct TestPDFViewNavigation_Previews: PreviewProvider {
	static var previews: some View {
		TestPDFViewNavigation()
	}
}
