//
//  UserView.swift
//  CashCrew
//
//  Created by Deniz Ata Eş on 30.07.2023.
//

import SwiftUI

struct UserView: View {
    @State private var selectedUsers: [Bool] = Array(repeating: false, count: exampleUsers.count)
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Kimler İçin")
                    .bold()
                    .foregroundColor(Color("mainColor"))
                Spacer()
                
                Button {
                    withAnimation {
                        let allSelected = !selectedUsers.contains(false)
                        selectedUsers = Array(repeating: !allSelected, count: exampleUsers.count)
                    }
                } label: {
                    Image(systemName: selectedUsers.contains(false) ? "person.2.fill" : "person.2.slash.fill")
                        .foregroundColor(.purple)
                }
                .padding(.trailing)
            }
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 4) {
                    ForEach(exampleUsers.indices, id: \.self) { index in
                        UserRowView(user: exampleUsers[index], isSelected: $selectedUsers[index])
                    }
                }
            }
        }
        .hAlign(.leading)
        .padding()
        .frame(maxHeight: 400)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(50)
    }
}








struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
