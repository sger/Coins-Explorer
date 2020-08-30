//
//  TopListRowView.swift
//  Coins-Explorer
//
//  Created by Spiros Gerokostas on 23/8/20.
//

import CryptoCompareKit
import SwiftUI

struct TopListRowView: View {

  let topListData: TopListData
    @StateObject var viewModel: TopListRowViewModel
    
    init(topListData: TopListData) {
        self.topListData = topListData
        self._viewModel = StateObject(wrappedValue: TopListRowViewModel(topListData: topListData))
    }

  var body: some View {
    HStack {
      ImageView(
        path: CryptoCompareClient.baseImageUrl
          + "\(topListData.coinInfo?.imageURL ?? "")", size: 60
      )
      .padding(5)

        VStack(alignment: .leading, spacing: 5){
            Text("\(topListData.coinInfo?.fullName ?? "")")
              .font(.headline)
              .fontWeight(.bold)
            Text("Rating \(topListData.coinInfo?.rating.weiss.rating ?? "-")")
                .font(.subheadline)
                .fontWeight(.light)
        }

      Spacer()

      VStack(alignment: .trailing, spacing: 5) {
        Text("\(topListData.display["USD"]?.price ?? "-")")
          .font(.subheadline)
            .fontWeight(.medium)
        Text("\(viewModel.price > 0 ? "+" : "")\(viewModel.price.formattedPercent(toPlaces: 2))")
          .font(.subheadline)
            .foregroundColor(viewModel.price > 0 ? .green : .red)
      }
    }
  }
}

struct TopListRowView_Previews: PreviewProvider {
  static var previews: some View {
    TopListRowView(topListData: TopListData.mock)
  }
}
