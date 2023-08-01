//
//  RegisterView.swift
//  CashCrew
//
//  Created by Deniz Ata Eş on 5.07.2023.
//

import SwiftUI
import PhotosUI

struct RegisterView: View {
    
    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var iban: String = ""
    @State var telephone: String = ""
    @Environment(\.dismiss) private var dismiss
    @State private var isLogin: Bool = false
    @Binding var isRegister: Bool
    
    @State var showImagePicker: Bool = false
    @State var photoItem: PhotosPickerItem?
    @State var userProfilePicData: Data?
    
    var body: some View {
        
        VStack(alignment: .leading){
            if isLogin{
                MainTabView()
            }
            else{
                VStack{
                    VStack(alignment: .leading, spacing: 5){
                        Text("Aramıza Hoşgeldin 🥳")
                            .font(.system(size: 48))
                            .foregroundColor(Color("mainColor"))
                            .bold()
                        HStack{
                            
                            
                            Button {
                                isRegister.toggle()
                            } label: {
                                Text("Kaydol")
                                    .font(.system(size: 24))
                                    .bold()
                                    .foregroundColor(Color("mainColor"))
                            }
                            
                            
                       
                            Text("/")
                                .font(.system(size: 20))
                                .bold()
                                .foregroundColor(.purple)
                            
                            Button {
                                isRegister.toggle()
                            } label: {
                                Text("Giriş Yap")
                                    .font(.system(size: 24))
                                    .foregroundColor(Color(.darkGray))
                            }
 
                        }
                        
                    }
                    .foregroundColor(.black)
                    //.shadow(color: Color(hex: "#f3ee77").opacity(0.5), radius: 1)
                    .padding(.top, 10)
                    .padding(.bottom, 50)
                    
                    if let userProfilePicData, let image = UIImage(data: userProfilePicData) {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Rectangle())
                            .cornerRadius(10)
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                withAnimation {
                                    showImagePicker.toggle()
                                }
                            }
                            .hAlign(.center)
                            .padding(.bottom, 36)
                            .transition(.scale)
                            .shadow(radius: 4)
                        
                    } else {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Rectangle())
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(Color("mainColor"))
                            .onTapGesture {
                                withAnimation {
                                    showImagePicker.toggle()
                                }
                            }
                            .hAlign(.center)
                            .padding(.bottom)
                            .transition(.scale)
                        
                        Text("Profil Fotoğrafı Seç")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .hAlign(.center)
                    }
                    
                    
                    
                    
                    VStack(alignment: .leading) {
                        
                        NeumorphicStyleTextField(textField: TextField("Kullanıcı Adı", text: $userName), imageName: "person")
                        
                        NeumorphicStyleTextField(passwordField: SecureField("Şifre", text: $password), imageName: "lock")
                        
                        
                        NeumorphicStyleTextField(textField: TextField("IBAN", text: $iban), imageName: "dollarsign")
                            .padding(.bottom)
                    }
                    
                    
                    Button {
                        isLogin.toggle()
                    } label: {
                        // MARK: Login Button
                        HStack{
                            Text("Kullanıcı Oluştur")
                                .font(.title3)
                                .foregroundColor(.black)
                                .padding(.top,4)
                                .padding(.bottom,4)
                                .hAlign(.center)
                            
                        }
                        .fillView(Color(hex: "#f3ee77"))
                    }
                    
                    
                    
                    Spacer()
                }
                .padding(36)
                
                .navigationBarTitleDisplayMode(.inline)
                .photosPicker(isPresented: $showImagePicker, selection: $photoItem)
                .onChange(of: photoItem) { newValue in
                    // MARK: Extracting UIImage from PhotoItem
                    if let newValue{
                        Task{
                            do{
                                guard let imageData = try await newValue.loadTransferable(type: Data.self) else{return}
                                // MARK: UI Must be updated on Main Thread
                                await MainActor.run(body: {
                                    userProfilePicData = imageData
                                })
                            }catch{
                            }
                        }
                    }
                    
                }
            }
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(isRegister: .constant(false))
    }
}

