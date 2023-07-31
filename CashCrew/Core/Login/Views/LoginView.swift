//
//  LoginView.swift
//  CashCrew
//
//  Created by Deniz Ata Eş on 4.07.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var userName: String = ""
    @State private var password: String = ""
    
    @State private var offset = CGSize.zero // Geçiş yaparken yana kayma için offset değişkeni ekliyoruz
    
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading){
                
                
                VStack{
                    Image("money")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .padding(.bottom)
                        .padding(.top)
                    HStack{
                        
                        
                        NavigationLink {
                            RegisterView()
                        } label: {
                            Text("Kaydol")
                                .font(.system(size: 24))
                                .foregroundColor(Color(.darkGray))
                        }
                        
                        
                        
                        Text("/")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.purple)
                        
                        
                        Text("Giriş Yap")
                            .font(.system(size: 24))
                            .bold()
                            .foregroundColor(.black)
                        
                        
                        
                    }
                }
                .hAlign(.center)
                .font(.system(size: 20))
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    HStack {
                        NeumorphicStyleTextField(textField: TextField("Kullanıcı Adı", text: $userName), imageName: "person")
                    }
                }
                .padding(.bottom)
                
                
                VStack(alignment: .leading) {
                    HStack {
                        NeumorphicStyleTextField(passwordField: SecureField("Şifre", text: $password), imageName: "lock")
                    }
                }
                
                HStack{
                    Text("Şifremi Unuttum")
                        .foregroundColor(Color(.darkGray))
                    
                }
                .font(.system(size: 20))
                .padding(.top)
                
                Button {
                    
                } label: {
                    // MARK: Login Button
                    HStack{
                        Text("Giriş Yap")
                            .font(.title3)
                            .foregroundColor(.black)
                            .padding(.top,4)
                            .padding(.bottom,4)
                            .hAlign(.center)
                    }
                    .fillView(Color(hex: "#f3ee77"))
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Giriş Yap")
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
struct NeumorphicStyleTextField: View {
    var textField: TextField<Text>?
    var passwordField: SecureField<Text>?
    var isNumber: Bool = false
    var imageName: String
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.green)
                .bold()
            if textField != nil{
                textField
                    .keyboardType(isNumber ? .numberPad : .default)
                
            }
            else{
                passwordField
            }
        }
        .padding()
        .foregroundColor(.black)
        .cornerRadius(6)
        //            .shadow(color: Color.darkShadow.opacity(0.2), radius: 3, x: 2, y: 2)
        //            .shadow(color: Color.lightShadow.opacity(0.2), radius: 3, x: -2, y: -2)
    }
}
