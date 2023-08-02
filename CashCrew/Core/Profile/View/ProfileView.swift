//
//  ProfileView.swift
//  CashCrew
//
//  Created by Deniz Ata Eş on 2.08.2023.
//

import SwiftUI

struct ProfileView: View {
    var iban: String = "TR030006400000142780556509"
    @State private var isCopied = false

    var body: some View {
        VStack{
            
            Image("ata")
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 140)
                .clipShape(Circle())
                .shadow(color: Color(.systemGreen), radius: 4)
            
                VStack(alignment: .center, spacing: 15){
                    Text("Deniz Ata EŞ")
                        .font(.system(size: 24))
                        .bold()
                    
                    HStack{
                        Text("IBAN: ")
                            .font(.caption)
                            .bold()
                            .foregroundColor(Color(.systemGreen))
                        Text(iban)
                            .font(.caption)
                            .padding(.trailing, 6)
                            
                        Button {
                            UIPasteboard.general.string = iban
                            withAnimation {
                                isCopied = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    withAnimation {
                                        isCopied = false
                                    }
                                    
                                }
                            }
                                         

                        } label: {
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .frame(width: 16, height: 20)
                                
                        }

                        
                            
                    }
                    
                    
                    if isCopied {
                        Text("Kopyalandı")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(.systemGreen))
                            .cornerRadius(8)
                            .transition(.opacity)
                            .vAlign(.bottom)
                    }
                }

        }
        .padding()
    
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
