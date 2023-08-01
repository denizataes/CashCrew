//
//  VacationView.swift
//  CashCrew
//
//  Created by Deniz Ata Eş on 1.08.2023.
//

import SwiftUI


struct VacationView: View {
    let exampleUsers: [User] = [
        User(UserID: 1, FirstName: "Deniz Ata", LastName: "EŞ", IBAN: "TR1234567890", ProfilePictureURL: "ata"),
        User(UserID: 2, FirstName: "Idil", LastName: "GÜL", IBAN: "TR0987654321", ProfilePictureURL: "idil"),
        User(UserID: 3, FirstName: "Seza", LastName: "YEĞENOĞLU", IBAN: "TR1111111111", ProfilePictureURL: "seza"),
        User(UserID: 4, FirstName: "Selen", LastName: "YEĞENOĞLU", IBAN: "TR2222222222", ProfilePictureURL: "selen"),
        User(UserID: 5, FirstName: "Uğur", LastName: "ŞAHİN", IBAN: "TR3333333333", ProfilePictureURL: "ugur"),
        User(UserID: 6, FirstName: "Serav", LastName: "GÜL", IBAN: "TR004124214", ProfilePictureURL: "serav"),
        User(UserID: 7, FirstName: "Serav", LastName: "GÜL", IBAN: "TR004124214", ProfilePictureURL: "serav"),
        User(UserID: 7, FirstName: "Serav", LastName: "GÜL", IBAN: "TR004124214", ProfilePictureURL: "serav")
    ]
    
    @State private var selectedFilter: SearchFilterViewModel  = .payments
    @Namespace var animation
    @State private var createNewPayment: Bool = false
    var body: some View {
        ZStack{
            //selectedUserBackground
            VStack{
                ScrollView(.vertical, showsIndicators: false){
                    
                    users
                    
                    searchFilterBar
                    
                    payments
                    
                    Spacer()
                }
            }
        }
        .fullScreenCover(isPresented: $createNewPayment){
            NavigationView{
                PaymentView()
            }
        }
        .overlay(
            Button(action: {
                withAnimation {
                    createNewPayment.toggle()
                }
            }, label: {
                Image(systemName: "plus")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.white))
                    .padding(13)
                    .background(Color(.systemPink), in: Circle())
                    .shadow(radius: 2)
            })
            .padding(15)
            , alignment: .bottomTrailing
        )
        .navigationTitle("Urla")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "gear")
                        .foregroundColor(Color("mainColor"))
                }

                
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                HStack(spacing: 20){
                    HStack(spacing: 2){
                        VStack(alignment: .leading){
                            Text("Tatil")
                            Text("Başlangıcı")
                        }
                        .font(.system(size: 10))
                        .foregroundColor(Color("mainColor"))
                        
                        Divider()
                            .accentColor(.green)
                        
                        HStack(spacing: 3){
                            VStack{
                                Text("19")
                                    .font(.system(size: 8))
                                    .italic()
                                Text("07")
                                    .font(.system(size: 12))
                                Text("23")
                                    .font(.system(size: 8))
                                    .italic()
                            }
                            .foregroundColor(Color("mainColor"))
                                
                        }
                        .bold()
                    }
                    
//                    HStack(spacing: 2){
//                        VStack{
//                            Text("En Çok")
//                            Text("Harcayan")
//                        }
//                        .font(.system(size: 10))
//
//                        Divider()
//                            .accentColor(.green)
//
//                        HStack(spacing: 3){
//                            Text("Ata")
//                                .font(.caption)
//                        }
//                        .bold()
//                    }
//                    .foregroundColor(Color("mainColor"))
                    
                    Button {
                        
                    } label: {
                        HStack(spacing: 2){
                            VStack{
                                Text("Toplam")
                                Text("Harcama")
                            }
                            .font(.system(size: 10))
                            
                            Divider()
                                .accentColor(.green)
                            
                            HStack(spacing: 3){
                                Text("1200")
                                    .font(.caption)
                                    .foregroundColor(Color(.systemRed))
                                Image(systemName: "turkishlirasign")
                                    .resizable()
                                    .foregroundColor(Color(.systemRed))
                                    .frame(width: 7, height: 8)
                            }
                            .bold()
                        }
                        .foregroundColor(Color("mainColor"))
                    }

             
                }
                
            }
        }
    }
    
    var payments: some View{
        
        VStack(spacing: 10){
            ForEach(0..<10, id: \.self) { _ in
                Button {
                    
                } label: {
                    PaymentCellView()
                }
                
            }
        }
    }
    
    var users: some View{
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 16){
                ForEach(0..<exampleUsers.count, id: \.self) { index in
                    
                    Button {
                        
                    } label: {
                        VStack{
                            Image(exampleUsers[index].ProfilePictureURL)
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 64, height: 64)
                            
                            Text(exampleUsers[index].FirstName)
                                .font(.caption2)
                                .bold()
                                .foregroundColor(Color("mainColor"))
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    
    
    
    var selectedUserBackground: some View{
        
        GeometryReader{proxy in
            let size = proxy.size
            
            //            KFImage(URL(string: "\(Statics.URL)\(movie.artwork)" ))
            Image("urla")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .clipped()
            
            
            // .tag(index)
            
            
            let color: Color = .black
            // Custom Gradient
            LinearGradient(colors: [
                .white.opacity(0.3),
                .white.opacity(0.7),
                .white.opacity(0.3),
            ], startPoint: .top, endPoint: .bottom)
            
            // Blurred Overlay
            Rectangle()
                .fill(.ultraThinMaterial.opacity(0.9))
        }
        .ignoresSafeArea()
    }
}



struct VacationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VacationView()
        }
    }
}


extension VacationView{
    
    var searchFilterBar: some View{
        
        HStack{
            
            ForEach(SearchFilterViewModel.allCases, id: \.rawValue){ item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? Color("mainColor") : .gray)
                    
                    if selectedFilter == item{
                        Capsule()
                            .foregroundColor(Color(.systemYellow))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }
                    else{
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                    
                }
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.selectedFilter = item
                    }
                }
            }
            
        }
        .padding()
    }
}
