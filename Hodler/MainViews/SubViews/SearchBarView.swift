//
//  SearchBarView.swift
//  Hodler
//
//  Created by Naji Achkar on 03/01/2022.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ?  Color.theme.secondaryTextColor : Color.theme.accent)
            TextField("Search by name or symbol...", text: $searchText)
                .foregroundColor(Color.theme.accent)
                .disableAutocorrection(true)
                .overlay(
                    Button {
                        eraseInput()
                    } label: {
                        ZStack {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(Color.theme.accent)
                                .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        }
                    },
                    alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.theme.background)
                .shadow(
                    color: Color.theme.accent.opacity(0.15),
                    radius: 10, x: 0, y: 0))
        .padding()
    }
    
    func eraseInput() {
        UIApplication.shared.endEditing()
        searchText = ""
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}

