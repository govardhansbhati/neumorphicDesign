//
//  HomeView.swift
//  fashionApp
//
//  Created by govardhan singh on 22/12/20.
//

import SwiftUI

struct HomeView: View {
    
    @State private var currentPosition: CGSize = CGSize(width: 0, height: UIScreen.main.bounds.height / 2)//.zero//
    @State private var newPosition: CGSize =  CGSize(width: 0, height: UIScreen.main.bounds.height / 2)//.zero
    
    @State var yAxis : CGFloat = 0
    
    var gradient1 = [Color("gradient3"),Color("gradient2"),Color("gradient1") ]
    var body: some View {
        ZStack{
            HStack(alignment: .top){
                ZStack(alignment:Alignment(horizontal: .center, vertical: .top)){
                    Color(#colorLiteral(red: 0.8823478222, green: 0.9979607463, blue: 1, alpha: 1))
                        .clipShape(CartWaveShape(yAxis: currentPosition.height))
//                        .cornerRadius(25)
                }
                
//                #colorLiteral(red: 0.3550756545, green: 0.8867811346, blue: 1, alpha: 0.4)
                .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 5, x: -10, y: -10)
                    .shadow(color: Color(#colorLiteral(red: 0.3550756545, green: 0.8867811346, blue: 1, alpha: 0.4)), radius: 5, x: 10, y: 10)
//                .shadow(color: Color(#colorLiteral(red: 0.235524565, green: 0.9191946387, blue: 0.5864252448, alpha: 1)), radius: 5, x: 10, y: 10)
                .padding(.trailing, -80)
                ZStack{
                    Color(#colorLiteral(red: 0.8823478222, green: 0.9979607463, blue: 1, alpha: 1))
                        .clipShape(cartShape())
                        .shadow(color: Color(#colorLiteral(red: 0.3550756545, green: 0.8867811346, blue: 1, alpha: 0.4)), radius: 2, x: -5, y: 5)
                    HStack{
                            
                               
                            Image(systemName: "cart.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.blue)
                                .rotationEffect(.degrees(-90))
                                .padding(.leading, 20)
                    }
                }
                .frame(width: 80, height: 100)
                .padding(.top, -50)
                .offset(y: self.currentPosition.height)
            
                .gesture(DragGesture()
                            .onChanged { value in
                                self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                                print("value \(self.currentPosition)")
                            }
                            .onEnded { value in
                                self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                                self.newPosition = self.currentPosition
                            }
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.trailing, 0)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct CartWaveShape : Shape {
    
    var yAxis : CGFloat
    
    func path(in rect : CGRect) -> Path {
        return Path{ path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x:  rect.width - 20, y:0))
            path.addLine(to: CGPoint(x: rect.width - 20, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let center = yAxis
            
            path.move(to: CGPoint(x: rect.width - 20, y: center - 100))
            
            let to = CGPoint(x: rect.width - 100, y: center)
            let control1 = CGPoint(x: rect.width - 20, y: center - 50)
            let control2 = CGPoint(x: rect.width - 100, y: center - 50)
            
            let to1 = CGPoint(x: rect.width - 20, y: center + 100)
            let control3 = CGPoint(x: rect.width - 100, y: center + 50)
            let control4 = CGPoint(x: rect.width - 20, y:  center + 50)
            
            path.addCurve(to: to, control1: control1, control2: control2)
            path.addCurve(to: to1, control1: control3, control2: control4)
        }
    }
}



struct cartShape : Shape {
    
    func path(in rect : CGRect) -> Path {
        return Path{ path in
            let rectCenter = rect.height / 2
            path.move(to: CGPoint(x: rect.width, y: rectCenter - 100))
        
            let to = CGPoint(x: 0, y: rectCenter)
            let control1 = CGPoint(x: rect.width, y: 0)
            let control2 = CGPoint(x: 0, y: 0)
            
            let to1 = CGPoint(x: rect.width, y: rectCenter + 100)
            let control3 = CGPoint(x: 0, y: rectCenter * 2)
            let control4 = CGPoint(x: rect.width, y: rectCenter * 2)
            
            path.addCurve(to: to, control1: control1, control2: control2)
            path.addCurve(to: to1, control1: control3, control2: control4)
        }
    }
}
