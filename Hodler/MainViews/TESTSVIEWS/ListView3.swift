////
////  ListView.swift
////  Hodler
////
////  Created by Naji Achkar on 07/12/21.
////
//
//import SwiftUI
//import Foundation
//
//struct ListView3: View {
//    
//    @ObservedObject var coinsService = CoinsService()
//    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//    var body: some View {
//        NavigationView {
//            GeometryReader { geo in
//                ZStack {
//                    Color.theme.lightGray.ignoresSafeArea()
//                  
//                        VStack(alignment: .center, spacing: 15) {
//                            List {
//                            ForEach(coinsService.coins) { coin in
//                                NavigationLink(destination: CoinDetailedView(coin: coin)) {
//                                    CoinRow2(coin: coin)
//                                        .frame(width: geo.size.width*0.87, height: geo.size.height*0.11)
//                                        .padding()
//                                        .background(Color.white)
//                                        .cornerRadius(10)
//                                        .shadow(color: Color.gray, radius: 2)
////                                        .onChange(of: coin.currentPrice) { _ in
////                                            debugPrint("Price has changed at \(Date())")
////                                        }
//                                }
//                            }
//                        }
//                        }
//                    .navigationTitle("CryptoMarket" )
//                }
//                .onAppear(perform: coinsService.updateCoinsInfo)
//            }
//        }
//    }
//}
//
//struct ListView3_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView2(coinsService: CoinsService())
//            .preferredColorScheme(.light)
//        
//    }
//}
