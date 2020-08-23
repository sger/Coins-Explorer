//
//  TopListViewTests.swift
//  Coins-ExplorerTests
//
//  Created by Spiros Gerokostas on 23/8/20.
//

import XCTest
import CryptoCompareKit
import SnapshotTesting
import SwiftUI
@testable import Coins_Explorer

class TopListViewTests: XCTestCase {

    func testTopListView_whenFetchData_returnSuccessResponse() {
        let viewModel = TopListViewModel(client: .mock,
                                         scheduler: DispatchQueue.immediateScheduler.eraseToAnyScheduler())
        let sut: TopListView = TopListView(viewModel: viewModel)

        let vc = UIHostingController(rootView: sut)
        vc.view.frame = UIScreen.main.bounds
        assertSnapshot(matching: vc, as: .image)
    }

}
