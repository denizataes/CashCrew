//
//  LoginView.swift
//  BowlShopSwiftUI
//
//  Created by Baris OZGEN on 28.10.2022.
//

import SwiftUI

struct NewLoginView: View {
    @StateObject private var vm = LoginViewModel()
    @State var countrySelectionViewVisiblity : Bool = false
    
    private let gridItem = GridItem(.flexible(), spacing: 14)

    @State private var animTrans: Bool = false
    @State private var isUserProfileSaved: Bool = false
    
    var body: some View {
        
        ZStack{
            LinearGradient(colors: [Color(hex: "#f3ee77"), .purple], startPoint: .bottom, endPoint: .top)
                .opacity(0.7)
                .ignoresSafeArea()

            
            // Login Views
            VStack{
                headerView
                ZStack{
                    phoneNumberView
                    otpView
                }
                
                keyboardView
            }
            .cornerRadius(animTrans ? 29 : 0)
            .clipped()
            .scaleEffect(animTrans ? 0.29 : 1)
            .rotation3DEffect(.degrees(animTrans ? -90 : 0), axis:(x: 0, y: 1, z: 0))
//            .offset(x: animTrans ? -230 : 0)
//            .onReceive(vm.$userSession) { user in
//                if user != nil {
//                    withAnimation(.easeInOut(duration: 1.4)){
//                        animTrans.toggle()
//                    }
//                }
//            }
            
//            if vm.userSession != nil {
//                ProfileView(isUserProfileSaved: $isUserProfileSaved, gradientBackgroundVisibility: false)
//                    .cornerRadius(!animTrans ? 29 : 0)
//                    .clipped()
//                    .scaleEffect(!animTrans ? 0.29 : 1)
//                    .rotation3DEffect(.degrees(!animTrans ? 90 : 0), axis:(x: 0, y: 1, z: 0))
//                    .offset(x: !animTrans ? 230 : 0)
//
//            }
            
        }
        .overlay{
            //LoadingView(show: $viewModel.isLoading)
            if vm.isLoading{
                CustomLoadingView()
            }
        }
     
        
        if vm.isRegisterViewActive {
            RegisterView()
                .transition(.move(edge: .leading))
        }
        
    }
}

extension NewLoginView {
    private var headerView: some View {
        ZStack(alignment: .top){
            
            VStack{
                Text((vm.loginStep == .phone ? "Cash Crew" : "Telefon Numaranı Onayla").capitalized)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                Spacer()
                Image(vm.loginStep == .phone ? "img-verify-phone" : "img-verify-otp")
                Spacer()
                HStack(spacing:0){
                    Text(vm.loginStep == .phone ? "Telefon numaranla kaydolabilir ya da giriş yapabilirsin." : "+90\(vm.phoneNumberText)")
                        .lineLimit(2)
                        .font(vm.loginStep == .phone ?  .title3 : .title2)
                        .fontWeight(.semibold)
                        .padding()
                    
                    if vm.loginStep == .otp {
                        
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .shadow(radius: 1)
                            .fontWeight(.bold)
                            .onTapGesture {
                                withAnimation(.spring()){
                                    vm.loginStep = .phone
                                }
                            }
                    }
                }
               
            }
            .padding(.vertical)
            .padding(.bottom, 114)
        }
        .foregroundColor(Color(.white))
        .padding(.bottom, -107)
    }
    
    private var phoneNumberView: some View {
        ZStack{
            GeometryReader { geo in
                
                Wave(waveHeight: 14, phase: Angle(degrees: Double(geo.frame(in: .global).minY) * 0.7))
                    .foregroundColor(.white)
            }
            HStack(alignment: .bottom){
                VStack(alignment: .leading){
                    Text(vm.warningPhoneNumberText.isEmpty ? "Telefon Numaranı Gir" : vm.warningPhoneNumberText)
                        .font(.subheadline)
                        .padding(.vertical,4)
                        .foregroundColor(vm.warningPhoneNumberText.isEmpty ? .gray : Color(hex: "8696FE"))
                    HStack{
                        HStack{
                            Text("+90")
                            //Text("+\(vm.selectedCountry.phone)")
                        }
                        .onTapGesture {
                            countrySelectionViewVisiblity.toggle()
                        }
//                        .sheet(isPresented: $countrySelectionViewVisiblity){
//                            CountrySelectionView(selectedCountry: $vm.selectedCountry)
//                                .accessibilityIdentifier("countrySelectionView")
//                                .presentationDetents([.height(292), .fraction(0.52), .fraction(0.7)])
//                                .presentationDragIndicator(.visible)
//                        }
                        
                        Text(vm.phoneNumberText)
                            .lineLimit(1)
                            .frame(maxWidth: 150, alignment: .leading)
                    }
                    Divider()
                        .background(.primary)
                        .padding(.top, 0)
                        .padding(.trailing, 7)
                    
                }
                .foregroundColor(Color(.darkGray))
                
                Spacer()
                
                Button(action: {
                    withAnimation(.spring()){
                        vm.sendSMSButton()
                    }
                }) {
                    Text("Devam")
                        .font(.headline)
                }
                .frame(width: 80)
                .foregroundColor(Color(.white))
                .padding()
                .background(Color(hex: "9376E0"))
                .cornerRadius(4)
                
            }
            .font(.title3)
            .fontWeight(.semibold)
            .padding()
            .padding(.top, 14)
        }
        .frame(height: 100)
        .offset(x: vm.loginStep == .phone ? 0 : -430)
    }
    
    private var otpView: some View {
        ZStack{
            GeometryReader { geo in
                Wave(waveHeight: 14, phase: Angle(degrees: Double(geo.frame(in: .global).minY) * 0.3))
                    .foregroundColor(.white)
            }
            HStack(alignment: .bottom){
                VStack(alignment: .leading){
                    Text(vm.warningOtpText.isEmpty ? "Onay kodunu gir" : vm.warningOtpText)
                        .font(.subheadline)
                        .padding(.vertical,4)
                        .foregroundColor(vm.warningOtpText.isEmpty ? .gray : .orange)
                    HStack{
                        Image(systemName: "lock.shield")
                        Text(vm.otpText)
                            .lineLimit(1)
                            .frame(maxWidth: 150, alignment: .leading)
                    }
                    Divider()
                        .background(.primary)
                        .padding(.top, 0)
                        .padding(.trailing, 7)
                    
                }
                .foregroundColor(Color(.darkGray))
                
                Spacer()
                
                Button(action: {
                    vm.sendOTPButton()
                }) {
                    Text("Onayla")
                        .font(.headline)
                }
                .frame(width: 80)
                .foregroundColor(Color(.white))
                .padding()
                .background(Color(hex: "00C4FF"))
                .cornerRadius(4)
                
            }
            .font(.title3)
            .fontWeight(.semibold)
            .padding()
            .padding(.top, 14)
        }
        .frame(height: 100)
        .offset(x: vm.loginStep == .otp ? 0 : 430)
    }
    
    private var keyboardView: some View {
        LazyVGrid(columns:
                    Array(repeating: gridItem, count: 3), spacing: 14) {
            ForEach(vm.padNumbers, id: \.self) { keyTag in
                
                Button(action: {
                    withAnimation(.spring()){
                        switch vm.loginStep {
                        case .phone:
                            vm.setPhoneNumberText(keyTag: keyTag)
                        case .otp:
                            vm.setOTPText(keyTag: keyTag)
                        }
                    }
                }) {
                    if keyTag != vm.padNumbers.last {
                        Text(keyTag)
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                        
                    }
                    else {
                        Image(systemName: keyTag)
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                    }
                }
                .fontWeight(.bold)
                .background(.white.opacity(keyTag.isEmpty ? 0.29 : 1))
                .cornerRadius(7)
            }
        }
                    .foregroundColor(Color(.darkText))
                    .padding(14)
                    .padding(.bottom)
                    .background(Color(.systemGroupedBackground))
    }
    
    struct Wave: Shape {
        
        var waveHeight: CGFloat
        var phase: Angle
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: 0, y: rect.maxY)) // Bottom Left
            
            for x in stride(from: 0, through: rect.width, by: 1) {
                let relativeX: CGFloat = x / 50 //wavelength
                let sine = CGFloat(sin(relativeX + CGFloat(phase.radians)))
                let y = waveHeight * sine //+ rect.midY
                path.addLine(to: CGPoint(x: x, y: y))
            }
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY)) // Top Right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // Bottom Right
            
            return path
        }
    }
}
struct NewLoginView_Previews: PreviewProvider {
    static var previews: some View {
        NewLoginView()
    }
}
