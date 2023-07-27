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
    
    
    @State var showImagePicker: Bool = false
    @State var photoItem: PhotosPickerItem?
    @State var userProfilePicData: Data?
    
    var body: some View {
        
        
        VStack(alignment: .leading){
            VStack(alignment: .leading, spacing: 5){
                Text("Aramıza Hoşgeldin 🥳")
                    .font(.system(size: 48))
                    .bold()
                
                Text("Kaydol")
                    .foregroundColor(.gray)
                    .font(.system(size: 24))
                
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
                    .foregroundColor(.black)
                    .onTapGesture {
                        withAnimation {
                            showImagePicker.toggle()
                        }
                    }
                    .hAlign(.center)
                    .padding(.bottom, 36)
                    .transition(.scale)
                
            }
            
            
            
            
            VStack(alignment: .leading) {
                HStack {
                    NeumorphicStyleTextField(textField: TextField("Kullanıcı Adı", text: $userName), imageName: "person")
                    
                }
                .padding(.bottom)
                
                HStack {
                    NeumorphicStyleTextField(textField: TextField("IBAN", text: $iban), imageName: "dollarsign")
                }
                .padding(.bottom)
                
                
                
            }
            
            
            NavigationLink {
                MainTabView()
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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

