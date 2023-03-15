//
//  HomeViewModel.swift
//  SwiftUI-Crypto
//
//  Created by Thien Vu Le on Mar/14/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private let dataService = CoinDataService()
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        addSubcripbers()
    }
    
    func addSubcripbers() {
        dataService.$allCoins
            .sink { [weak self] returnedCoins in
                guard let self else { return }
                self.allCoins = returnedCoins
            }
            .store(in: &cancellable)
    }

}
