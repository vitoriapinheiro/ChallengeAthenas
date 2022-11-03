//
 //  Haptics.swift
 //  ChallengeAthenas
 //
 //  Created by vivi on 01/11/22.
 //

 import Foundation
 import SwiftUI

 class HapticManager {
     static let instance = HapticManager()

     func notification(type: UINotificationFeedbackGenerator.FeedbackType){
         let generator = UINotificationFeedbackGenerator()
         generator.notificationOccurred(type)
     }

     func impact(style: UIImpactFeedbackGenerator.FeedbackStyle){
         let generator = UIImpactFeedbackGenerator(style: style)
         generator.impactOccurred()
     }
 }


 struct HapticsView: View {
     var body: some View {
         VStack(spacing: 20){
             Button("Sucess"){
                 HapticManager.instance.notification(type: .success)
             }
             Button("Error"){
                 HapticManager.instance.notification(type: .error)
             }
             Button("Warning"){
                 HapticManager.instance.notification(type: .warning)
             }
             Divider()
             Button("Heavy"){
                 HapticManager.instance.impact(style: .heavy)
             }
             Button("Light"){
                 HapticManager.instance.impact(style: .light)
             }
             Button("Medium"){
                 HapticManager.instance.impact(style: .medium)
             }
             Button("Rigid"){
                 HapticManager.instance.impact(style: .rigid)
             }
             Button("Soft"){
                 HapticManager.instance.impact(style: .soft)
             }
         }
     }
 }
