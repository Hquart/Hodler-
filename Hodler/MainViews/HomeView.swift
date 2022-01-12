//
//  ContentView.swift
//  Hodler
//
//  Created by Naji Achkar on 06/12/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ZStack {
                    Color.theme.background
                        .ignoresSafeArea()
                    VStack {
                        HeaderView(showSecondaryView: $showPortfolio)
//                        HomeStatsView(showPortfolio: $showPortfolio)
                        SearchBarView(searchText: $viewModel.searchText)
                        Spacer(minLength: 0)
                        if !showPortfolio {
                            pricesList
                                .transition(.move(edge: .leading))
                        }
                        if showPortfolio {
                            portfolioList
                                .transition(.move(edge: .trailing))
                        }
                    }
                }
                .navigationBarHidden(true)
            }
        }
    }
}
//////////////////////////////////// PREVIEW ///////////////////////////////////////////////////////////
struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            HomeView()
        }
        .preferredColorScheme(.light)
        .navigationBarHidden(true)
        .environmentObject(HomeViewModel())
    }
}
///////////////////////////////////// VIEW EXTENSION ////////////////////////////////////////////////////
extension HomeView {
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    private var pricesList: some View {
        List {
            ForEach(viewModel.coins) { coin in
                CoinRow(coin: coin)
                    .listRowInsets(.init(top: 15, leading: 10, bottom: 70, trailing: 10))
                    .listRowBackground(Color.theme.background)
                    .overlay(NavigationLink(destination: CoinDetailedView(coin: coin)) {})
            }
        }
        .listStyle(PlainListStyle())
        .refreshable {
            viewModel.updateCoinsInfo()
        }
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    private var portfolioList: some View {
        List {
            ForEach(viewModel.coins) { coin in
                CoinRow(coin: coin)
                    .listRowInsets(.init(top: 15, leading: 10, bottom: 70, trailing: 10))
                    .listRowBackground(Color.theme.background)
                    .overlay(NavigationLink(destination: CoinDetailedView(coin: coin)) {})
                  
            }
        }
        .listStyle(PlainListStyle())
        .refreshable {
            viewModel.updateCoinsInfo()
        }
    }
    
  
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

