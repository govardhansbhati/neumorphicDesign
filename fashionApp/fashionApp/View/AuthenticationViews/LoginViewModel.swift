//
//  LoginViewModel.swift
//  fashionApp
//
//  Created by govardhan singh on 21/12/20.
//

import Foundation
import Combine

class SignInModel : ObservableObject{
    
    private var cancellableBag = Set<AnyCancellable>()
    
    @Published var userNumber : String = ""
    var userNameError :String = ""
    @Published var password : String = ""
    var passwordError : String = ""
    
    private var userNameValidPublisher : AnyPublisher<Bool,Never> {
        return $userNumber.map{ !$0.isEmpty }.eraseToAnyPublisher()
    }
    
    init() {
        userNameValidPublisher.receive(on: RunLoop.main)
            .dropFirst()
            .map {$0 ? "" : "Username is missing"}
            .assign(to: \.userNameError, on :self)
            .store(in: &cancellableBag)
    }
}
