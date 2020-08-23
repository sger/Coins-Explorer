//
//  TopListViewModel.swift
//  Coins-Explorer
//
//  Created by Spiros Gerokostas on 23/8/20.
//

import Foundation
import Combine
import CryptoCompareKit
import CombineSchedulers

final class TopListViewModel: ObservableObject {
    
    @Published var topListData: [TopListData] = []
    @Published var searchResults: [TopListData] = []
    @Published var searchQuery: String = ""
    
    private let client: CryptoCompareClient
    private let scheduler: AnySchedulerOf<DispatchQueue>
    
    private var clientCancellable: AnyCancellable? {
        willSet {
            clientCancellable?.cancel()
        }
    }
    
    private var searchQueryCancellable: AnyCancellable?
    
    var currentTopListData: [TopListData] {
        get {
            if !searchQuery.isEmpty {
                return searchResults
            } else {
                return topListData
            }
        }
    }
    
    init(client: CryptoCompareClient = .live,
         scheduler: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler()) {
        self.client = client
        self.scheduler = scheduler
        
        fetchTopList(limit: 20, tsym: "USD")
        
        searchQueryCancellable = $searchQuery
            .debounce(for: .milliseconds(300), scheduler: scheduler)
            .removeDuplicates()
            .filter { !$0.isEmpty }
            .map { [weak self] in self?.filteredTopListData(with: $0) ?? []
            }
            .sink(receiveValue: { [weak self] in self?.searchResults = $0 })
    }
    
    func fetchTopList(limit: Int, tsym: String) {
        clientCancellable = client.topList(limit, tsym)
            .replaceError(with: TopList())
            .receive(on: scheduler)
            .map { $0.data }
            .sink(receiveValue: { [weak self] in self?.topListData = $0 })
    }
    
    private func filteredTopListData(with string: String) -> [TopListData] {
        topListData.filter {
            $0.coinInfo?.fullName.lowercased().contains(string.lowercased()) == true
        }
    }
}
