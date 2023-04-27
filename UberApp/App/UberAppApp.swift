//
//  UberAppApp.swift
//  UberApp
//
//  Created by Nick Pavlov on 4/26/23.
//

import SwiftUI

@main
struct UberAppApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
