//
//  LoginViewModel.swift
//  AdminSwiftUI_Mac
//
//  Created by Baris OZGEN on 30.10.2022.
//

//import Firebase
import SwiftUI

class LoginViewModel: ObservableObject {
    //@Published var userSession: Firebase.User?

    @Published var loginStep : ELoginStep = .phone
    @Published var padNumbers = ["1","2","3","4","5","6","7","8","9","","0","delete.left"]
    @Published var phoneCountryCodeText: String = "49"
    @Published var phoneNumberText: String = ""
    @Published var otpText: String = ""
    @Published var emailText: String = "baris@admin.bowlShopSwiftUI.com"
    @Published var isLoading: Bool = false
    
    @Published var warningPhoneNumberText: String = ""
    @Published var warningOtpText: String = ""
    @Published var warningEmailText: String = ""
    
    @Published var isRegisterViewActive = false

    
    //@Published var selectedCountry = CountriesQuery.Data.Country(code: "DE", name: "Germany", emoji: "🇩🇪", phone: "49")
   
    private var recievedOTPText: String = ""

    //MARK: Phone Number Section
    func setPhoneNumberText(keyTag: String){
        
        //check if empty button pressed
        guard !keyTag.isEmpty else {return}
        
        // number button pressed
        if let numberButton = Int(keyTag),
           phoneNumberText.count < 16 {
            phoneNumberText += "\(numberButton)"
            return
        }
        
        // delete button pressed
        if keyTag == padNumbers.last,
           !phoneNumberText.isEmpty {
            phoneNumberText.removeLast()
        }
    }
    
    func sendSMSButton(){
        if phoneNumberText.count != 10 {
            warningPhoneNumberText = "Yanlış Telefon Numarası!"
            return
        }
        warningPhoneNumberText = ""
        loginStep = .otp
    
        
        // For testing we define it true, when the real message is required we need to make it false
        //Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        
        //let phoneNumber = "+\(selectedCountry.phone)\(phoneNumberText)"
        
    }
    
    // MARK: OTP Section
    func setOTPText(keyTag: String){
        
        //check if empty button pressed
        guard !keyTag.isEmpty else {return}
        
        // number button pressed
        if let numberButton = Int(keyTag),
           otpText.count < 7 {
            otpText += "\(numberButton)"
            return
        }
        
        // delete button pressed
        if keyTag == padNumbers.last,
           !otpText.isEmpty {
            otpText.removeLast()
        }
    }
    
    func sendOTPButton(){
        if otpText.count != 6 {
            warningOtpText = "⚠ Yanlış onay kodu"
            return
        }
        warningOtpText = ""
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation(.easeInOut){
                self.isLoading = false
                self.isRegisterViewActive = true
            }
        }
//        Auth.auth().signIn(withEmail: emailText, password: otpText){ [weak self] (result, error) in
//         if let error = error {
//             self?.warningOtpText = error.localizedDescription
//             return
//         }
//
//            guard let user = result?.user else {return}
//            self?.userSession = user
//         }
    }
    
    enum ELoginStep : Int {
        case phone
        case otp
    }
}

