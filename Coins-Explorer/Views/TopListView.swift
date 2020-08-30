//
//  TopListView.swift
//  Coins-Explorer
//
//  Created by Spiros Gerokostas on 23/8/20.
//

import CryptoCompareKit
import SwiftUI

struct TopListView: View {

  @StateObject var viewModel: TopListViewModel = TopListViewModel()

  var body: some View {
    NavigationView {
      List {
        Section(
          header: SearchFieldView(
            searchText: $viewModel.searchQuery,
            placeholder: "Search Crypto")
        ) {
          ForEach(viewModel.currentTopListData) { topListData in
            TopListRowView(topListData: topListData)
          }
        }
      }
      .listStyle(GroupedListStyle())
      .navigationBarTitle(
        Text("Currencies"),
        displayMode: .automatic)
    }
  }
}

struct TopListView_Previews: PreviewProvider {
  static var previews: some View {
    TopListView()
  }
}
