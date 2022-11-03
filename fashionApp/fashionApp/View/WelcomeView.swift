//
//  WelcomeView.swift
//  fashionApp
//
//  Created by govardhan singh on 18/12/20.
//

import SwiftUI


struct WelcomeView: View {
    var gradient1 = [Color("gradient3"),Color("gradient2"),Color("gradient1") ]
    var gradient = [Color("AppRed"),Color("AppRed1"),Color("AppRed2"),Color("AppRed3"),Color("gradient1") ]
    
    var body: some View {
        
        ZStack{
            Image("wall").scaledToFill()
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height, alignment: .center)
            VStack{
                
                // Buttton
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                    LinearGradient(gradient: .init(colors: gradient1), startPoint: .top, endPoint: .bottom)
                        .clipShape(StartShoppingShape())
                    
                    NavigationLink (
                        destination:  LoginView(viewModel: SignInModel())){//TabView()){
                        VStack(spacing:10){
                            Image(systemName: "cart")
                                .font(.system(size: 70))
                                .foregroundColor(.gray)
                            Text("Get Started")
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                        }
                        .padding(50)
    //                    .background(Color.white)
                        .background(
                            ZStack {
                                Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
                                    Circle()
                                //RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .foregroundColor(.white)
                                    .blur(radius: 4)
                                    .offset(x: -8, y: -8)

                                Circle()
    //                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(
                                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                        )
                                    .padding(2)
                                    .blur(radius: 2)
                            }
                        )
                        .clipShape(Circle())
                        .shadow(color: Color("gradient2"), radius: 5, x: 5, y: 5)
                        .shadow(color: Color("gradient3"), radius: 5, x: -5, y: -5)
                        .padding(15)
                        }
                    .offset(y:-65)
                    .padding(.bottom, -65)
                })
                .padding(.top, 60)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.top, UIScreen.main.bounds.height / 2.2)
        }
        
       
    }
}


//return Path{ path in
//    path.move(to: CGPoint(x: 0, y: 70))
//    path.addLine(to: CGPoint(x: 0, y: rect.height + 40))
//    path.addLine(to: CGPoint(x: rect.width, y: rect.height + 40))
//    path.addLine(to: CGPoint(x: rect.width, y: 70))
//
//    let MidX = rect.width / 2
//    let Width = rect.width
//
//    let ControlWidth = MidX - 100
//
//    path.move(to: CGPoint(x: 0, y: 70))
//    
//    let to = CGPoint(x: MidX, y: -55)
//    let control1 = CGPoint(x: ControlWidth, y: 70)
//    let control2 = CGPoint(x: ControlWidth - 30, y: -55)
//
//    let to1 = CGPoint(x: Width, y: 70)
//    let control3 = CGPoint(x: Width - (ControlWidth - 30), y: -55)
//    let control4 = CGPoint(x: Width - ControlWidth, y: 70)
//
//    path.addCurve(to: to, control1: control1, control2: control2)
//    path.addCurve(to: to1, control1: control3, control2: control4)
//}



//struct WelcomeView: View {
//    var body: some View {
//        ZStack{
//            Color.red.edgesIgnoringSafeArea(.all)
//                .opacity(0.5)
//            ZStack{
//
//                VStack{
//                    Spacer()
//
//
//
//                        VStack{
//                            Text("My Shop")
//                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry")
//                        }
//                        .padding()
//                        .background(LinearGradient(gradient: Gradient(colors: [.red, .white]), startPoint: .topLeading, endPoint: .bottomTrailing))
////                        .padding()
//                        .edgesIgnoringSafeArea(.bottom)
//                }
//            }
//        }
//    }
//}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
