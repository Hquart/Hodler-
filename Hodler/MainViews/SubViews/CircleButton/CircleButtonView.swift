//
//  CircleButtonView.swift
//  Hodler
//
//  Created by Naji Achkar on 28/12/2021.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(Circle().foregroundColor(Color.theme.background)
            )
            .shadow(color: Color.theme.accent, radius: 10, x: 0, y: 0)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        CircleButtonView(iconName: "bolt.fill")
                .previewLayout(.sizeThatFits)
            CircleButtonView(iconName: "bolt.circle")
                    .previewLayout(.sizeThatFits)
                    .colorScheme(.dark)
        }
    }
}
