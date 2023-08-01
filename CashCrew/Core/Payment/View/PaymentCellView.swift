//
//  PaymentCellView.swift
//  CashCrew
//
//  Created by Deniz Ata Eş on 1.08.2023.
//

import SwiftUI

struct PaymentCellView: View {
    let exampleUsers: [User] = [
        User(UserID: 1, FirstName: "Deniz Ata", LastName: "EŞ", IBAN: "TR1234567890", ProfilePictureURL: "ata"),
        User(UserID: 2, FirstName: "Idil", LastName: "GÜL", IBAN: "TR0987654321", ProfilePictureURL: "idil"),
        User(UserID: 3, FirstName: "Seza", LastName: "YEĞENOĞLU", IBAN: "TR1111111111", ProfilePictureURL: "seza")
    ]
    
    var body: some View {
        
        
        HStack{
            VStack{
                Text("Migros Alışverişi")
                    .font(.headline)
                    .padding(.top, 12)
                    .padding(.leading)
                    .foregroundColor(Color("mainColor"))
                    .hAlign(.leading)
                
                HStack{
                    VStack{
                        HStack{
                            Image("ata")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 48, height: 48)
                                .clipShape(Circle())
                            
                            Image(systemName: "chevron.forward.2")
                                .bold()
                                .foregroundColor(Color("mainColor"))
                            
                            ForEach(0..<exampleUsers.count, id: \.self) { index in
                                Image(exampleUsers[index].ProfilePictureURL)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 36, height: 36)
                                    .clipShape(Circle())
                                
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            
            VStack{
                Spacer()
                HStack(spacing: 2){
                    Text("400")
                        .font(.title)
                        .foregroundColor(.green)
                        .bold()
                    Image(systemName: "turkishlirasign")
                        .resizable()
                        .frame(width: 16, height: 18)
                        .foregroundColor(.green)
                        .bold()
                }
                Spacer()
                
                HStack(spacing: 0){
                    Text("19")
                        .font(.subheadline)
                        .bold()
                    Text(":")
                        .font(.callout)
                    Text("19")
                        .font(.subheadline)
                        .bold()
                }
                .foregroundColor(Color("mainColor"))
                
                Text("30.07.2022")
                    .font(.system(size: 10))
                    .foregroundColor(Color("mainColor"))
                    
               
            }
            .frame(maxHeight: .infinity)
            .padding(.vertical)
            
        }
        .padding(.horizontal)
        .frame(maxHeight: 140)
        
        
        
        
        
        
    }
}

struct PaymentCellView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentCellView()
    }
}
