//
//  TopListRowViewModel.swift
//  Coins-Explorer
//
//  Created by Spiros Gerokostas on 23/8/20.
//

import Foundation
import CryptoCompareKit

final class TopListRowViewModel: ObservableObject {
    
    let topListData: TopListData
    
    var price: Double {
        self.topListData.raw["USD"]?.changePct24Hour ?? 0.0
    }
    
    init(topListData: TopListData) {
        self.topListData = topListData
    }
}
