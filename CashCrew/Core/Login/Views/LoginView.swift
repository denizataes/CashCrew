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
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("Hey,")
                    Text("Giriş Yap!")
                }
                .font(.system(size: 48))
                .bold()
                .shadow(color: Color(hex: "#f3ee77").opacity(0.5), radius: 1)
                .padding(.top, 100)
                .padding(.bottom, 50)
                
                
                HStack{
                    Button {
                        
                    } label: {
                        Text("Kaydol")
                            .foregroundColor(Color(.darkGray))
                    }

            
                    Text("/")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.purple)
                    
                    Button {
                        
                    } label: {
                        Text("Giriş Yap")
                            .bold()
                            .foregroundColor(.black)
                    }

                    
                }
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
            .padding(36)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "moon.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.leading)
                    
                }
            }
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
                .foregroundColor(.darkShadow)
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
            .background(Color.background.opacity(0.2))
            .cornerRadius(6)
            .shadow(color: Color.darkShadow.opacity(0.2), radius: 3, x: 2, y: 2)
            .shadow(color: Color.lightShadow.opacity(0.2), radius: 3, x: -2, y: -2)
        }
}
