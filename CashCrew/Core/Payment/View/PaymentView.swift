//
//  PaymentView.swift
//  CashCrew
//
//  Created by Deniz Ata Eş on 30.07.2023.
//

import SwiftUI
import PhotosUI

struct PaymentView: View {
    @State private var isDatePickerShown = false
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var selectedDate = Date()
    @Environment(\.dismiss) private var dismiss
    
    @State var showImagePicker: Bool = false
    @State var photoItem: PhotosPickerItem?
    @State var userProfilePicData: Data?
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy • EE • HH:MM"
        formatter.locale = Locale(identifier: "tr_TR")
        return formatter
    }
    
    var body: some View {
        VStack {
            VStack{
                VStack{
                    HStack(spacing: 0){
                        NeumorphicStyleTextField(textField: TextField("Başlık", text: $title),isUnderline: true, imageName: "pencil.line", imageColor: Color(.systemGray))
                        
                        Spacer()
                        
                        
                        if let userProfilePicData, let image = UIImage(data: userProfilePicData) {
                            
                            ZStack(alignment: .topTrailing){
                                
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Rectangle())
                                    .cornerRadius(10)
                                    .aspectRatio(contentMode: .fill)
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        withAnimation {
                                            showImagePicker.toggle()
                                        }
                                    }
                                    .shadow(radius: 4)
                                
                                
                                Button {
                                    withAnimation {
                                        self.userProfilePicData = nil
                                    }
                                    
                                } label: {
                                    Image(systemName: "multiply")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                        .padding(8)
                                        .foregroundColor(.red)
                                        .clipShape(Circle())
                                        .offset(x: 5, y: -25)
                                        .shadow(radius: 2)
                                }
                            }
                            
                        }
                        else{
                            Image(systemName: "photo.on.rectangle.angled")
                                .resizable()
                                .foregroundColor(Color(.darkGray))
                                .frame(width: 24, height: 24)
                                .clipShape(Rectangle())
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(Color("mainColor"))
                                .onTapGesture {
                                    withAnimation {
                                        showImagePicker.toggle()
                                    }
                                }
                                .padding(.trailing)
                            
                            
                        }
                        
                        
                    }
                    .transition(.slide)
                    
                    
                    NeumorphicStyleTextField(textField: TextField("Fiyat", text: $description), isNumber: true, isUnderline: true, imageName: "turkishlirasign", imageColor: Color(.systemGray))
                    
                    
                    Button {
                        isDatePickerShown = true
                    } label: {
                        VStack{
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundColor(Color(.systemGray))
                                Text(selectedDate, formatter: dateFormatter)
                                    .foregroundColor(Color("mainColor"))
                                    //.bold()
                            }
                            .hAlign(.leading)
                            .padding()
                            
                            Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.gray)
                            
                            
                        }
                    }
                    
                }
                
                
                
            }
            
            Spacer()
            UserView()
        }
        .photosPicker(isPresented: $showImagePicker, selection: $photoItem)
        .onChange(of: photoItem) { newValue in
            // MARK: Extracting UIImage from PhotoItem
            if let newValue{
                Task{
                    do{
                        guard let imageData = try await newValue.loadTransferable(type: Data.self) else{return}
                        // MARK: UI Must be updated on Main Thread
                        await MainActor.run {
                            withAnimation {
                                userProfilePicData = imageData
                            }
                        }
                    }catch{
                    }
                }
            }
            
        }
        .sheet(isPresented: $isDatePickerShown) {
            VStack {
                HStack {
                    Spacer()
                    Button("Seç") {
                        isDatePickerShown.toggle()
                    }
                    .foregroundColor(.green)
                    .padding(.trailing, 20)
                    .padding(.top, 40)
                }
                
                DatePicker("Doğum Tarihi", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
            }
            .presentationDetents([.height(250)])
            
        }
        .padding(.top, 12)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 1){
                        Image(systemName: "chevron.backward")
                        Text("Geri")
                            .bold()
                    }
                    .foregroundColor(.green)
                }
                
                Spacer()
            }
            
            
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    dismiss()
                } label: {
                    Text("Kaydet")
                        .foregroundColor(.green)
                        .bold()
                }
            }
        }
        
        .navigationTitle("Ödeme Ekle")
        .padding()
    }
    
    
}


struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PaymentView()
        }
    }
}
