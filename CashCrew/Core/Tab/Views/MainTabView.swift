//
//  MainTabView.swift
//  TwitterSwiftUI
//
//  Created by Deniz Ata Eş on 26.11.2022.
//

import SwiftUI

struct MainTabView: View {
    //@AppStorage("user_UID") var userUID: String = ""
    var body: some View {
        
        TabView {
            NavigationView{
                MainVacationView()
            }
                .tabItem {
                    Image(systemName: "suitcase.fill")
                    Text("Tatillerim")
                }
            NavigationView{
                
            }
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Oluştur")
                }
         
            
            NavigationView{
                ProfileView()
            }
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profil")
                }
        }
        .accentColor(.green)
        

    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
