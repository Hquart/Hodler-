//
//  UIApplication.swift
//  Hodler
//
//  Created by Naji Achkar on 03/01/2022.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
