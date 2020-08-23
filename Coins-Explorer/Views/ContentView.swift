//
//  TopListView.swift
//  Coins-Explorer
//
//  Created by Spiros Gerokostas on 23/8/20.
//

import SwiftUI
import CryptoCompareKit

struct TopListView: View {
    
    @StateObject var viewModel: TopListViewModel = TopListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Section(header: SearchFieldView(searchText: $viewModel.searchQuery,
                                                placeholder: "Search"))
                {
                    ForEach(viewModel.currentTopListData) { topListData in
                        HStack {
                            Text("\(topListData.coinInfo.fullName)")
                                .font(.headline)
                                .fontWeight(.bold)
                            Spacer()
                            Text("\(topListData.coinInfo.name)")
                                .font(.subheadline)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Currencies"),
                                displayMode: .automatic)
        }
    }
}

struct TopListView_Previews: PreviewProvider {
    static var previews: some View {
        TopListView()
    }
}
