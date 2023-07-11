//
//  MainVacationView.swift
//  CashCrew
//
//  Created by Deniz Ata Eş on 11.07.2023.
//

import SwiftUI

struct MainVacationView: View {
    var body: some View {

        ScrollView(.vertical) {
            LazyVGrid(columns: [
                GridItem(.fixed(150)),
                GridItem(.fixed(150))
            ]) {
                ForEach(0..<10, id: \.self) { _ in
                    VacationCellView(color: Color.random)
                        .padding(.top,7)
                }
            }
        }
        .padding()
        .navigationTitle("Tatillerim 🏖️")
        .navigationBarTitleDisplayMode(.large)

    }
}

struct MainVacationView_Previews: PreviewProvider {
    static var previews: some View {
        MainVacationView()
    }
}
