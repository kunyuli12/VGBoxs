//
//  VGBoxApp.swift
//  VGBox
//
//  Created by kai wen chen on 2022/1/14.
//

import SwiftUI

@main
struct VGBoxApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var viewModel =  AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainViews().environmentObject(viewModel)
        }
    }
}
