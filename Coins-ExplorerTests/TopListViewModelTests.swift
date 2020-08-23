//
//  TopListViewModelTests.swift
//  Coins-ExplorerTests
//
//  Created by Spiros Gerokostas on 23/8/20.
//

import XCTest
import CombineSchedulers
import CryptoCompareKit
import Combine
@testable import Coins_Explorer

class TopListViewModelTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable> = []
    private let scheduler = DispatchQueue.testScheduler
    
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {
       cancellables = []
    }

    func testTopListViewModel_whenFetchTopList_returnSuccessResponse() {
        var output: [TopListData] = []
        let sut = TopListViewModel(client: .mock, scheduler: DispatchQueue.immediateScheduler.eraseToAnyScheduler())
        
        sut.$topListData
            .sink { output.append(contentsOf: $0) }
            .store(in: &cancellables)
        
        XCTAssertEqual(output, [TopListData.mock])
    }
    
    func testTopListViewModel_whenFetchTopList_returnEmptyResponse() {
        var output: [TopListData] = []
        let sut = TopListViewModel(client: .failedWithReason, scheduler: DispatchQueue.immediateScheduler.eraseToAnyScheduler())
        
        sut.$topListData
            .sink { output.append(contentsOf: $0) }
            .store(in: &cancellables)
        
        XCTAssertEqual(output, [])
    }
    
    func testTopListViewModel_whenSearchQueryIsNotEmpty_returnSearchResults() throws {
        var output: [TopListData] = []
        let sut = TopListViewModel(client: .mock, scheduler: scheduler.eraseToAnyScheduler())
        
        sut.$searchResults
            .sink { output.append(contentsOf: $0) }
            .store(in: &cancellables)
        
        sut.searchQuery = "B"
        
        scheduler.advance(by: .milliseconds(600))
        
        XCTAssertEqual(output, [TopListData.mock])
    }
    
    func testTopListViewModel_whenSearchQueryIsEmpty_returnEmptySearchResults() throws {
        var output: [TopListData] = []
        let sut = TopListViewModel(client: .mock, scheduler: scheduler.eraseToAnyScheduler())
        
        sut.$searchResults
            .sink { output.append(contentsOf: $0) }
            .store(in: &cancellables)
        
        sut.searchQuery = ""
        
        scheduler.advance(by: .milliseconds(600))
        
        XCTAssertEqual(output, [])
    }
}
