//
//  CoinImageViewModel.swift
//  SwiftUI-Crypto
//
//  Created by Thien Vu Le on Mar/14/23.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let coin: CoinModel
    private let dataService: CoinImageService
    private var cancellable = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        addSubcibers()
        self.isLoading = true
    }
    
    private func addSubcibers() {
        dataService.$image
            .sink { [weak self] _ in
                guard let self else { return }
                self.isLoading = false
            } receiveValue: { [weak self] returnImage in
                guard let self else { return }
                self.image = returnImage
            }
            .store(in: &cancellable)
    }
}
