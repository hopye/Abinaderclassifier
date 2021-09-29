//
//  Inference.swift
//  abinaderclassifier
//
//  Created by lorenzo gonzalez on 9/28/21.
//

import Foundation
import SwiftUI

struct lineaprocesada {
    var texto:String
    var clasificacion:String
    
}

class Inference: ObservableObject {
    
//    @Published var label:String = ""
//    @Published var linea:String = ""
    
    var label:String = "" {
        willSet {
            objectWillChange.send()
        }
    }
    
    var linea:String = "" {
        willSet {
            objectWillChange.send()
        
        }
    }
    
    init() {
       
        
    }
    
    func identify() {
        
        
        let readFile = work.shared.readfile(file: "datafinal-merged-abinader.csv")
        
       
        let model = AbinaderClassifier5()
        var lineas  = [lineaprocesada]()
        var label1 = ""
   
       
        for line in readFile.prefix(200) {
                let line2 = line.components(separatedBy: ",")

                print(line2[0])
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    self.linea = line2[0]
                }

                do {
                let prediction = try model.prediction(text: line2[0])
                    print(prediction.label)

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        self.label = prediction.label
                    }



                } catch {
                    // something went wrong!
                }
                
               
                   
                
                
                let linea = lineaprocesada(texto: line2[0],clasificacion: label1)
                
                lineas.append(linea)
            
                   
         }
            
        



        print("-- Creating CSV --")
        work.shared.createCSV(from: lineas)
        
    }
    
    func identifyLinebyLine() {

        
        let path = "datafinal-merged-abinader.csv"
        let url = URL(fileURLWithPath: "/Users/lgonzalez/Downloads/\(path)")

        try? String(contentsOf: url, encoding: .utf8)
            .split(separator: "\n")
            .forEach { line in
                let line2 = line.components(separatedBy: ",")

//                print(line2[0])
                print("line: \(line)")
                DispatchQueue.main.async {
                    self.linea = String(line)
                }
              
                
                
        }
        self.linea = ""
    }
    
    
}
