//
//  Work.swift
//  abinaderclassifier
//
//  Created by lorenzo gonzalez on 9/28/21.
//

import Foundation
import CloudKit

class work {
    
    
    static let shared = work()
    
    internal func readCSV( inputFile:String, separator:String) -> [String]{
        
        let fileExtension = inputFile.fileExtension()
        let fileName = inputFile.filename()
        let fileURL = try! FileManager.default.url(for: .downloadsDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let inputFile = fileURL.appendingPathComponent(fileName).appendingPathExtension(fileExtension)
        print("Path final es \(inputFile.path)")
        do {
//            let savedData = try String(contentsOf: inputFile)
            let savedData = try Data(contentsOf: inputFile, options: [.mappedIfSafe, .uncached])
            
            let str = String(decoding: savedData, as: UTF8.self)
            return str.components(separatedBy: separator)
       
//            return savedData.components(separatedBy: separator)
        }
        catch {
            return ["Error in file \(error.localizedDescription)"]
        }
        
    }
    
  // Read LINE BY LINE
    func readFileByLine(_ path: String) -> Void {
        
//        print( "running readFileByLine")
//        errno = 0
//
//        let fileExtension = path.fileExtension()
//        let fileName = path.filename()
//
//        let fileURL = try! FileManager.default.url(for: .downloadsDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//
//
//        let path = fileURL.appendingPathComponent(fileName).appendingPathExtension(fileExtension)
//
//        print("Path final es \(path.path)")
//        if freopen(path.path, "r", stdin) == nil {
//            print(perror(path.path))
//            return "ERROR TRYING TO OPENING"
//        } else {
//
//        }
//        print( "TRYING TO READ")
//        while let line = readLine(strippingNewline: true) {
//            print("line")
//            //print(line)
////            var data = line.components(separatedBy: ",")
//
//            print(line)
//            return(line)
//
//        }
//        return "EOF"
        
        let url = URL(fileURLWithPath: "/Users/lgonzalez/Downloads/\(path)")

        try? String(contentsOf: url, encoding: .utf8)
            .split(separator: "\n")
            .forEach { line in
                print("line: \(line)")
                
        }
        
    }
    
    
    func readfile(file:String) -> [String] {
        print("Trying to read file \(file)")
        let data = readCSV(inputFile: file, separator: "\n")
        
        return data
        
      
    }
    
    
    func createCSV(from data:[lineaprocesada]) {
            var csvString = ""
            for line in data {
                csvString = csvString.appending("\(String(describing: line.texto)) ,\(String(describing: line.clasificacion))\n")
            }

            let fileManager = FileManager.default
            do {
                let path = try fileManager.url(for: .downloadsDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
                let fileURL = path.appendingPathComponent("AbinaderProccessedDOS.csv")
                try csvString.write(to: fileURL, atomically: true, encoding: .unicode)
            } catch {
                print("error creating file \(error.localizedDescription)")
            }

        }
    
    
    
}
