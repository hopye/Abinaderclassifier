//
//  ContentView.swift
//  abinaderclassifier
//
//  Created by lorenzo gonzalez on 9/22/21.
//

import SwiftUI

import CoreML
import Cocoa

extension String {
    
    func filename() -> String {
        
        return URL(fileURLWithPath: self).deletingPathExtension().lastPathComponent
    }
    func fileExtension() -> String {
        
        return URL(fileURLWithPath: self).pathExtension
    }
    
}




//struct StringChanger: AnimatableModifier {
//    var label: String = ""
//
//    var animatableData: String {
//        get { label }
//        set { label = newValue }
//    }
//
//    func body(content: Content) -> some View {
////        content
////            .overlay(ArcShape(pct: pct).foregroundColor(.red))
////            .overlay(LabelView(pct: pct))
//
//        Text(String(label)).lineLimit(3)
//                            .animation(.easeIn(duration: 0.5))
////                          .frame(width: CGFloat((NSScreen.main?.visibleFrame.width)! * 0.20), height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                            .background(Color("blue"))
//                            .cornerRadius(15)
//                            .padding()
//    }
//
//}

struct ContentView: View {
  
    @StateObject var run = Inference()
    @State private var running:Bool = false
    
    
    var body: some View {
        VStack {
            
            Image("abinader").resizable().clipShape(Circle()).frame(width: 100, height: 100, alignment: .center).shadow(radius: 10)
            Text("ABINADERSH 1.0").padding().font(.title)
            Text("🔥CLASIFICADOR POSITIVO O NEGATIVO COMENTARIOS🔥")
            Text("SEGÚN ACCIÓN")
            Text("🤖").font(.system(size: 36))

            HStack {
                
                
                Text(run.linea)
                    .lineLimit(3)
                  .frame(width: CGFloat((NSScreen.main?.visibleFrame.width)! * 0.20), height: 50, alignment: .center)
                    .background(Color("blue"))
                    .cornerRadius(15)
                    .padding()
                    
                    

                Text(run.label)
                    .font(.title)
                    .frame(width: CGFloat((NSScreen.main?.visibleFrame.width)! * 0.10), height: 50, alignment: .center)
                    .background(Color("blue"))
                    .cornerRadius(15)
                    .padding()

            }
          
            Text(self.running ? "running" : "not running").background(Color(running ? .red : .blue))
           
            Button("CORRER LEYENDO DATA") {

               
                running.toggle()
         
           
                run.identify()
           
            
            }
        
           
            

            Image("logo").aspectRatio(contentMode: .fit).frame(width: 200, height: 100, alignment: .center)
            
        }.frame(width: 500, height: 500, alignment: .center).background(LinearGradient(gradient: Gradient(colors: [Color("blue"), Color("lightblue")]), startPoint: .bottom, endPoint: .top))
    }
        
        

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
