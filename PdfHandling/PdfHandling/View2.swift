//
//  View2.swift
//  PdfHandling
//
//  Created by Arun Skyraan on 20/03/23.
//

import SwiftUI

struct View2: View {
    
    func getDirectoryPath(fileNameNumber:String) -> URL {
        
        let DocumentDirectory = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0])
        let DirPath = DocumentDirectory.appendingPathComponent("\(fileNameNumber)")
        do {
            try FileManager.default.createDirectory(atPath: DirPath!.path, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print("Unable to create directory \(error.debugDescription)")
        }
        return DirPath!
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct View2_Previews: PreviewProvider {
    static var previews: some View {
        View2()
    }
}
