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
    
    private let client: CryptoCompareClient
    private let scheduler: AnySchedulerOf<DispatchQueue>
    
    private var clientCancellable: AnyCancellable? {
        willSet {
            clientCancellable?.cancel()
        }
    }
    
    init(client: CryptoCompareClient = .live,
         scheduler: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler()) {
        self.client = client
        self.scheduler = scheduler
        
        fetchTopList(limit: 20, tsym: "USD")
    }
    
    func fetchTopList(limit: Int, tsym: String) {
        clientCancellable = client.topList(limit, tsym)
            .replaceError(with: TopList())
            .receive(on: scheduler)
            .map { $0.data }
            .sink(receiveValue: { [weak self] in self?.topListData = $0 })
    }
}
