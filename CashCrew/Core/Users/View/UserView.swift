//
//  UserView.swift
//  CashCrew
//
//  Created by Deniz Ata Eş on 30.07.2023.
//

import SwiftUI

struct UserView: View {
    
    var body: some View {
        VStack{
            Text("Kimler İçin")
                .bold()
            
            ScrollView(showsIndicators: false){
                VStack(spacing: 3){

                    ForEach(exampleUsers){user in
                        UserRowView(user: user, isSelected: false)
                    }
                }
            }
            
        }
        .hAlign(.leading)
        .padding()
        .frame(maxHeight: 400)
        .background(.gray.opacity(0.1))
        .cornerRadius(50)
        
        
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
