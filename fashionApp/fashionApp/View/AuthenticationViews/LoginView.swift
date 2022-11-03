//
//  LoginView.swift
//  fashionApp
//
//  Created by govardhan singh on 21/12/20.
//

import SwiftUI

struct LoginView: View {
    
    var gradient1 = [Color("gradient3"),Color("gradient2"),Color("gradient1") ]
    
    
    @ObservedObject private var viewModel : SignInModel
    @Environment(\.presentationMode) var present
    
    
    init(viewModel : SignInModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack{
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                LoginHeaderView(headerText: "What Is Your Phone Number?")
                
                Text("Please enter your phone number to verify your account")
                    .fontWeight(.regular)
                    .font(.system(size: 17))
                    .padding(.all , 24)
                
                ZStack{
                    HStack{
                        Button(action: {
                            print("")
                        }, label: {
                            HStack{
                                Image("flag")
                                Image("dropDown")
                            }
                        })
                        Text("+91")
                        TextField("0000000",text: $viewModel.userNumber)
                            .padding(EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 24))
                            .background(Color.clear)
                            .cornerRadius(23)
                            .keyboardType(UIKeyboardType.phonePad)
                    }
                }
                .padding(EdgeInsets(top: 4, leading: 15, bottom: 4, trailing: 15))
                .background(Color.white)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black.opacity(0.05), lineWidth: 4)
                        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(color: Color.black.opacity(0.2), radius: 3, x: -5, y: -5)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                )
                
//                Circle()
//                    .fill(Color.offWhite)
//                    .overlay(
//                        Circle()
//                            .stroke(Color.gray, lineWidth: 4)
//                            .blur(radius: 4)
//                            .offset(x: 2, y: 2)
//                            .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
//                    )
//                    .overlay(
//                        Circle()
//                            .stroke(Color.white, lineWidth: 8)
//                            .blur(radius: 4)
//                            .offset(x: -2, y: -2)
//                            .mask(Circle().fill(LinearGradient(Color.clear, Color.black)))
//                    )
                
//                .background(
//                    ZStack {
//                        Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
////                                    Circle()
//                        RoundedRectangle(cornerRadius: 10, style: .continuous)
//                            .foregroundColor(.white)
//                            .blur(radius: 4)
//                            .offset(x: -8, y: -8)
//
////                                Circle()
//                        RoundedRectangle(cornerRadius: 10, style: .continuous)
//                            .fill(
//                                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                                )
//                            .padding(2)
//                            .blur(radius: 2)
//                    }
//                )
//                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
//                .shadow(color: Color("lairBackground"), radius: 5, x: 5, y: 5)
//                .shadow(color: Color("lairBackground"), radius: 5, x: -5, y: -5)
//
//                .cornerRadius(6)
//                .overlay(
//                        RoundedRectangle(cornerRadius: 6)
//                            .stroke(Color.red, lineWidth: 2)
//                    )
                .padding(24)
                
                NavigationLink(
                    destination: OtpView(viewModel: viewModel)){
                    Text("Send Verification Code")
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width - 48 ,height: 64, alignment: .center)
                        .foreground(LinearGradient(gradient: .init(colors: gradient1), startPoint: .topLeading, endPoint: .bottomTrailing))
//                        .padding()
                        .background(
                            ZStack {
                                Color(#colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9529411765, alpha: 1))
                                   
//                                    Circle()
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .foregroundColor(.white)
                                    .blur(radius: 4)
                                    .offset(x: -8, y: -8)
//
////                                Circle()
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(
                                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                        )
                                    .padding(2)
                                    .blur(radius: 2)
                                    .shadow(color: Color(#colorLiteral(red: 0.6823529412, green: 0.6823529412, blue: 0.7529411765, alpha: 0.25)), radius: 2, x: -10, y: -10)
                                    .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 2, x: 10, y: 10)
//
                            }
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous)
                        )
                        .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 5, x: -10, y: -10)
                        .shadow(color: Color(#colorLiteral(red: 0.6823529412, green: 0.6823529412, blue: 0.7529411765, alpha: 0.4)), radius: 5, x: 10, y: 10)
                        .padding(15)
                }
                
//                .background(LinearGradient(gradient: .init(colors: gradient1), startPoint: .topLeading, endPoint: .bottomTrailing)
//                                .cornerRadius(15)
//                )
//                .padding(24)
                
                Button(action: {
                    print("SKIP")
                }, label: {
                    Text("Skip")
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                        .foregroundColor(Color.gray)
                        
                        .padding()
                    
                })
                    
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SignInModel()
        LoginView(viewModel: viewModel)
    }
}

extension View {
    public func foreground<Overlay: View>(_ overlay: Overlay) -> some View {
        self.overlay(overlay).mask(self)
    }
}
