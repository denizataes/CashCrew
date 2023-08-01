//
//  VacationCellView.swift
//  CashCrew
//
//  Created by Deniz Ata Eş on 11.07.2023.
//

import SwiftUI

struct VacationCellView: View {
    var color: Color
    var body: some View {
        
        VStack{
            Text("URLA")
                .font(.title3)
                .bold()
            
            VStack{
                HStack{
                    Image("idil")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                        .contentShape(Circle())
                        .shadow(radius: 1)
                    
                    Image("ata")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                        .contentShape(Circle())
                        .shadow(radius: 1)
                    
                    Image("seza")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                        .contentShape(Circle())
                        .shadow(radius: 1)
                }
                
                HStack{
                    
                    
                    Image("selen")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                        .contentShape(Circle())
                        .shadow(radius: 1)
                    Image("ugur")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                        .contentShape(Circle())
                        .shadow(radius: 1)
                    Image("basak")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                        .contentShape(Circle())
                        .shadow(radius: 1)
                }
            }
            
            VStack(spacing: 1){
                HStack(spacing: 0){
                    Text("15")
                        .font(.system(size: 10))
                    Text("TEM")
                        .font(.system(size: 12))
                        .bold()
                    Text("21")
                        .font(.system(size: 10))
                }
                
                
                HStack(spacing: 0){
                    Text("18")
                        .font(.system(size: 9))
                        
                    
                    Text(":")
                        .font(.system(size: 9))
                    
                    Text("12")
                        .font(.system(size: 9))
                }
            }
            .padding(.top, 10)

        }
        .padding()
        .background(color.opacity(0.2))
        .cornerRadius(10)
        .foregroundColor(Color("mainColor"))
        .frame(maxWidth: 150)
        //.shadow(color: .green, radius: 0.5)
    
    }
}

struct VacationCellView_Previews: PreviewProvider {
    static var previews: some View {
        VacationCellView(color: .green)
    }
}
