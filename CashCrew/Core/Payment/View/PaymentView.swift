//
//  PaymentView.swift
//  CashCrew
//
//  Created by Deniz Ata Eş on 30.07.2023.
//

import SwiftUI

struct PaymentView: View {
    @State private var isDatePickerShown = false
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var selectedDate = Date()
    @Environment(\.dismiss) private var dismiss
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.timeZone = TimeZone(identifier: "Europe/Istanbul")
        return formatter
    }
    
    var body: some View {
        VStack {
            HStack{
                VStack{
                    NeumorphicStyleTextField(textField: TextField("Başlık", text: $title), imageName: "pencil.line")
                        
                    
                    NeumorphicStyleTextField(textField: TextField("Fiyat", text: $description), imageName: "turkishlirasign")
                        
                    
                }
                Image("fiss")
                    .resizable()
                    .frame(width: 120, height: 200)
                    .cornerRadius(5)
                    .shadow(radius: 5)
                
            }
       
            Spacer()
            UserView()
        }
        .sheet(isPresented: $isDatePickerShown) {
            VStack {
                HStack {
                    Spacer()
                    Button("Seç") {
                        isDatePickerShown.toggle()
                    }
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
                    Text("Geri")
                        .foregroundColor(Color("mainColor"))
                        .bold()
                }
                
                Spacer()
            }
            
            ToolbarItemGroup(placement: .navigation) {
                Button {
                    isDatePickerShown = true
                } label: {
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.green)
                        Text(selectedDate, formatter: dateFormatter)
                            .foregroundColor(.green)
                    }
                    .padding(.leading, 60)
                }
                
                Spacer() 
            }
            
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    dismiss()
                } label: {
                    Text("Kaydet")
                        .foregroundColor(Color("mainColor"))
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
