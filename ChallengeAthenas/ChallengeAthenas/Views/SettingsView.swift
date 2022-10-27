//
//  Settings.swift
//  ChallengeAthenas
//
//  Created by vivi on 14/10/22.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    
    @State var showPopUp = false
    @State var showLoading = false
    
    var body: some View {
        ZStack{
            VStack {
                Spacer()
                AppButton(
                    title: "Volume do jogo",
                    action: { alertView() },
                    enable: true,
                    isFill: true,
                    height: 48,
                    width: 300
                )
                AppButton(
                    title: "Volume da música",
                    action: {withAnimation{
                        showLoading.toggle()
                    }},
                    enable: true,
                    isFill: true,
                    height: 48,
                    width: 300
                )
                AppButton(
                    title: "Vibrações",
                    action: {print("2")},
                    enable: true,
                    isFill: true,
                    height: 48,
                    width: 300
                )
            }
            if showLoading{
                CustomAlertView(show: $showLoading)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func alertView(){
        let alert = UIAlertController(title: "Login", message: "Email", preferredStyle: .alert)
        alert.addTextField{
            (pass) in
            pass.isSecureTextEntry = true
            pass.placeholder = "Senha"
        }
        
        let login = UIAlertAction(title: "Login", style: .default){
            (_) in
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive){
            (_) in
        }
        
        alert.addAction(cancel)
        alert.addAction(login)
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {})
        
    }
}

struct HUDProgressView: View {
    var placeholder: String
    @Binding var show: Bool
    @State var animate: Bool = false
    
    var body: some View{
        VStack(spacing: 32){
            Circle()
                .stroke(AngularGradient(gradient: .init(colors: [Color.pink]), center: .center))
                .frame(width: 80, height: 80)
                .rotationEffect(.init(degrees: animate ? 270 : 0))
            Text(placeholder)
                .fontWeight(.bold)
        }
        .padding(.vertical, 25)
        .padding(.horizontal, 35)
        .cornerRadius(20)
        .background(BlurView())
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.cyan.opacity(0.35)
            .onTapGesture {
                withAnimation{
                    show.toggle()
                    
                }
            })
        .onAppear{
            withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)){
                animate.toggle()
            }
        }
    }
}

struct BlurView : UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct CustomAlertView : View {
    @Binding var show : Bool
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack(spacing: 25){
                Image("leaf")
                Text("Parabéns, bb!")
                    .font(.title)
                    .foregroundColor(.pink)
                Text("Você ganhou moreee!")
                Button(action: {}){
                    Text("Voltar")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Color.purple)
                        .clipShape(Capsule())
                }
                
            }
            .padding()
            Button(action: {
                withAnimation {
                    show.toggle()
                }
            }){
                Image(systemName: "xmark.circle")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.purple)
            }
            
        }
        .padding(.vertical, 25)
        .padding(.horizontal, 30)
        .background(BlurView())
        .cornerRadius(25)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.cyan.opacity(0.35)
            .onTapGesture {
                withAnimation{
                    show.toggle()
                    
                }
            })
    }
}
