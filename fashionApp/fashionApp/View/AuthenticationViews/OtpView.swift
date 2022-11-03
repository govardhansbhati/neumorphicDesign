//
//  OtpView.swift
//  fashionApp
//
//  Created by govardhan singh on 22/12/20.
//

import SwiftUI

struct OtpView: View {
    
    var gradient1 = [Color("gradient3"),Color("gradient2"),Color("gradient1") ]
    
    var maxDigit : Int = 4
    @State var pin: String = ""
    @State var showPin = false
    @State var isDisabled = false
    
    @ObservedObject private var viewModel : SignInModel
    @ObservedObject var loginDate : SignInModel
    
    @Environment(\.presentationMode) var present
    
    init(viewModel : SignInModel) {
        self.viewModel = viewModel
        self.loginDate = viewModel
    }
    
    
    
    var body: some View {
        ZStack{
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
                LoginHeaderView(headerText: "Verification \nCode")
                
                HStack{
                    Text("Please enter Code sent to")
                        .fontWeight(.regular)
                        .font(.system(size: 17))
                        .padding(.all , 24)
                    Spacer()
                }
                
                HStack{
                    Text(viewModel.userNumber)
                        .fontWeight(.bold)
                        .font(.system(size: 17))
                        
                    Spacer()
                    
                    Button(action: {
                        present.wrappedValue.dismiss()
                        print("change number")
                    }, label: {
                        Text("Change phone number")
                            .underline()
                            .fontWeight(.regular)
                            .foregroundColor(Color(#colorLiteral(red: 0.2039215686, green: 0.1568627451, blue: 0.2431372549, alpha: 1)))
                            .font(.system(size: 12))
            
                    })
                }
                .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
                
                
                ZStack {
                    HStack {
                        ForEach(0..<maxDigit) { index in
                            Spacer()
    //                        ForEach(0..<maxDigits) { index in
    //                            Image(systemName: self.getImageName(at: index))
    //                                .font(.system(size: 15, weight: .thin, design: .default))
    //                            Spacer()
    //                        }
//                            otpTextView(index: index, pin: self.pin)
                            if index >= self.pin.count {
                                otpViewDown
                            }
                            else {
                                otpViewUp
                            }
    //                        otpTextView(codeText: $viewModel.userNumber)
                            Spacer()
                        }
                        
                        
    //                    otpTextView(codeText: $viewModel.password)
    //                    Spacer()
    //                    otpTextView(codeText: $viewModel.userNumber)
    //                    Spacer()
    //                    otpTextView(codeText: $viewModel.userNumber)
    //                    Spacer()
                    }
                    backgroundField
                }
                .padding(EdgeInsets(top: 24, leading: 24, bottom: 0, trailing: 24))
                
//                Button(action: {
//                    print("Send Verification Code")
//                }, label:
                    
                NavigationLink(
                    destination: TabView())//OtpView(viewModel: viewModel))
                {
                    Text("Continue")
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
                .frame(alignment: .center)
                
//                .background(LinearGradient(gradient: .init(colors: gradient1), startPoint: .topLeading, endPoint: .bottomTrailing)
//                                .cornerRadius(15)
//                )
//                .padding(24)
                
                    Button(action: {
                        print("SKIP")
                    }, label: {
                        Text("Resend code")
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
    
    
//    func codeField() -> <View>{
//
//        if index >= self.pin.count {
//            return otpViewDown
//        }
//
//        if self.showPin {
//            return self.pin.digits[index].numberString + ".circle"
//        }
//
//        return otpViewUp
//    }
    
    private var backgroundField: some View {
        let boundPin = Binding<String>(get: { self.pin }, set: { newValue in
            self.pin = newValue
            self.submitPin()
        })
        
        return TextField("", text: boundPin, onCommit: submitPin).frame(height: 50)
      
      // Introspect library can used to make the textField become first resonder on appearing
      // if you decide to add the pod 'Introspect' and import it, comment #50 to #53 and uncomment #55 to #61
            
            
//            1857
      
           .accentColor(.clear)
           .foregroundColor(.clear)
           .keyboardType(.numberPad)
           .disabled(isDisabled)
      
//             .introspectTextField { textField in
//                 textField.tintColor = .clear
//                 textField.textColor = .clear
//                 textField.keyboardType = .numberPad
//                 textField.becomeFirstResponder()
//                 textField.isEnabled = !self.isDisabled
//         }
    }
    private func submitPin() {
        guard !pin.isEmpty else {
            showPin = false
            return
        }
        
        if pin.count == maxDigit {
            isDisabled = true
            
//            handler(pin) { isSuccess in
//                if isSuccess {
//                    print("pin matched, go to next page, no action to perfrom here")
//                } else {
//                    pin = ""
//                    isDisabled = false
//                    print("this has to called after showing toast why is the failure")
//                }
//            }
        }
        
        // this code is never reached under  normal circumstances. If the user pastes a text with count higher than the
        // max digits, we remove the additional characters and make a recursive call.
        if pin.count > maxDigit {
            pin = String(pin.prefix(maxDigit))
            submitPin()
        }
    }
    
    var otpViewDown : some View {
        ZStack(alignment: .center){
//                TextField("",text: $codeText)
//                    .multilineTextAlignment(.center)
//                    .padding()
//                    .background(Color.clear)
//                    .cornerRadius(23)
//                    .keyboardType(UIKeyboardType.phonePad)
        }
        .frame(width: 50, height: 50, alignment: .center)
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
    }
    
    var otpViewUp : some View {
        ZStack(alignment: .center){
//                TextField("0",text: $codeText)
//                    .multilineTextAlignment(.center)
//                    .padding()
//                    .background(Color.clear)
//                    .cornerRadius(23)
//                    .keyboardType(UIKeyboardType.phonePad)
        }
        .frame(width: 50, height: 50, alignment: .center)

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
    }
    
}
 
struct OtpView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SignInModel()
        OtpView(viewModel: viewModel)
    }
}


struct otpTextView : View {
    var index : Int
    @State var pin: String = ""
    
    var body: some View{
        
        if index >= self.pin.count {
            otpViewDown
        }
        else {
            otpViewUp
        }
        
//        if codeText.count > 0 {
//            otpViewUp
//        }else {
//            otpViewDown
//        }
    }
    
    
    
    var otpViewDown : some View {
        ZStack(alignment: .center){
//                TextField("",text: $codeText)
//                    .multilineTextAlignment(.center)
//                    .padding()
//                    .background(Color.clear)
//                    .cornerRadius(23)
//                    .keyboardType(UIKeyboardType.phonePad)
        }
        .frame(width: 50, height: 50, alignment: .center)
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
    }
    
    var otpViewUp : some View {
        ZStack(alignment: .center){
//                TextField("0",text: $codeText)
//                    .multilineTextAlignment(.center)
//                    .padding()
//                    .background(Color.clear)
//                    .cornerRadius(23)
//                    .keyboardType(UIKeyboardType.phonePad)
        }
        .frame(width: 50, height: 50, alignment: .center)

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
    }
}

/*
public struct OtpView: View {
    
    var maxDigits: Int = 4
    var label = "Enter One Time Password"
    
    @State var pin: String = ""
    @State var showPin = false
    @State var isDisabled = false
    
    
    @ObservedObject private var viewModel : SignInModel
    @ObservedObject var loginDate : SignInModel
    
    @Environment(\.presentationMode) var present
    
    init(viewModel : SignInModel) {
        self.viewModel = viewModel
        self.loginDate = viewModel
    }
    
    
//    var handler: (String, (Bool) -> Void) -> Void
    
    public var body: some View {
        VStack(spacing: 10) {
            Text(label).font(.title)
            ZStack {
                pinDots
                backgroundField
            }
            showPinStack
        }
        
    }
    
    private var pinDots: some View {
        HStack {
            Spacer()
            ForEach(0..<maxDigits) { index in
                Image(systemName: self.getImageName(at: index))
                    .font(.system(size: 15, weight: .thin, design: .default))
                Spacer()
            }
        }
    }
    
    private var backgroundField: some View {
        let boundPin = Binding<String>(get: { self.pin }, set: { newValue in
            self.pin = newValue
            self.submitPin()
        })
        
        return TextField("", text: boundPin, onCommit: submitPin)
      
      // Introspect library can used to make the textField become first resonder on appearing
      // if you decide to add the pod 'Introspect' and import it, comment #50 to #53 and uncomment #55 to #61
      8209398028
           .accentColor(.clear)
           .foregroundColor(.clear)
           .keyboardType(.numberPad)
           .disabled(isDisabled)
      
//             .introspectTextField { textField in
//                 textField.tintColor = .clear
//                 textField.textColor = .clear
//                 textField.keyboardType = .numberPad
//                 textField.becomeFirstResponder()
//                 textField.isEnabled = !self.isDisabled
//         }
    }
    
    private var showPinStack: some View {
        HStack {
            Spacer()
            if !pin.isEmpty {
                showPinButton
            }
        }
        .frame(height: 50)
        .padding([.trailing])
    }
    
    private var showPinButton: some View {
        Button(action: {
            self.showPin.toggle()
        }, label: {
            self.showPin ?
                Image(systemName: "eye.slash.fill").foregroundColor(.primary) :
                Image(systemName: "eye.fill").foregroundColor(.primary)
        })
    }
    
    private func submitPin() {
        guard !pin.isEmpty else {
            showPin = false
            return
        }
        
        if pin.count == maxDigits {
            isDisabled = true
            
//            handler(pin) { isSuccess in
//                if isSuccess {
//                    print("pin matched, go to next page, no action to perfrom here")
//                } else {
//                    pin = ""
//                    isDisabled = false
//                    print("this has to called after showing toast why is the failure")
//                }
//            }
        }
        
        // this code is never reached under  normal circumstances. If the user pastes a text with count higher than the
        // max digits, we remove the additional characters and make a recursive call.
        if pin.count > maxDigits {
            pin = String(pin.prefix(maxDigits))
            submitPin()
        }
    }
    
    private func getImageName(at index: Int) -> String {
        if index >= self.pin.count {
            return "circle"
        }
        
        if self.showPin {
            return self.pin.digits[index].numberString + ".circle"
        }
        
        return "circle.fill"
    }
}
*/
extension String {
    
    var digits: [Int] {
        var result = [Int]()
        
        for char in self {
            if let number = Int(String(char)) {
                result.append(number)
            }
        }
        
        return result
    }
    
}

extension Int {
    
    var numberString: String {
        
        guard self < 10 else { return "0" }
        
        return String(self)
    }
}


