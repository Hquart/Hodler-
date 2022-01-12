//
//  HodlerApp.swift
//  Hodler
//
//  Created by Naji Achkar on 06/12/21.
//

import SwiftUI

@main
struct HodlerApp: App {
    
    @StateObject var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(vm)
        }
    }
}

