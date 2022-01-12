//
//  HomeStatsView.swift
//  Hodler
//
//  Created by Naji Achkar on 04/01/2022.
//

import SwiftUI

struct HomeStatsView: View {
    
    @StateObject var vm = HomeStatsViewModel()
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.allStats) { stat in
                StatisticsBlock(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .leading : .trailing)
    }
}

//struct HomeStatsView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeStatsView(showPortfolio: .constant(false))
//
//    }
//}
