//
//  UserRowView.swift
//  CashCrew
//
//  Created by Deniz Ata Eş on 30.07.2023.
//

import SwiftUI

struct UserRowView: View {
    var user: User = User(UserID: 1, FirstName: "Deniz Ata", LastName: "EŞ", IBAN: "TR01241242141", ProfilePictureURL: "ata")
    @State var isSelected: Bool = true
    var body: some View {
        
        
        Button {
            self.isSelected.toggle()
        } label: {
            
            ZStack{
                if isSelected{
                    selectedUserBackground
                        .cornerRadius(10)
                        .transition(.slide)
                }
                HStack{
                    
                    HStack{
                        Image(user.ProfilePictureURL)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 60, height: 60)
                            .shadow(radius: isSelected ? 0 : 2)
                        
                        VStack{
                            Text("\(user.FirstName) \(user.LastName)")
                                .bold()
                        }
                        .transition(.slide)
                    }
                    .opacity(isSelected ? 1 : 0.5)
                    
                    Spacer()
                    
                    
                    Button {
                        withAnimation {
                            self.isSelected.toggle()
                        }
                        
                    } label: {
                        
                        Image(systemName:
                                isSelected ? "person.crop.circle.badge.minus" : "person.crop.circle.badge.plus")
                        .resizable()
                        .shadow(radius: isSelected ? 2 : 0)
                        .frame(width: 24, height: 20)
                        .foregroundColor(isSelected ? .red : .green)
                        
                    }
                    
                    
                }
                .foregroundColor(.black)
                .padding(.horizontal)
            }
            .frame(maxHeight: 80)
        }
        
        
        
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
            .previewLayout(.sizeThatFits)
    }
}


extension UserRowView{
    var selectedUserBackground: some View{
        
        GeometryReader{proxy in
            let size = proxy.size
            
            //            KFImage(URL(string: "\(Statics.URL)\(movie.artwork)" ))
            Image(user.ProfilePictureURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .clipped()
            
            
            // .tag(index)
            
            
            let color: Color = .black
            // Custom Gradient
            LinearGradient(colors: [
                .black.opacity(0.1),
                .black.opacity(0.5),
                .black.opacity(0.1),
            ], startPoint: .top, endPoint: .bottom)
            
            // Blurred Overlay
            Rectangle()
                .fill(.ultraThinMaterial.opacity(0.9))
        }
        .ignoresSafeArea()
    }
}
