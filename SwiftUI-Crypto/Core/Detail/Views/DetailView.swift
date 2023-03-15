//
//  DetailView.swift
//  SwiftUI-Crypto
//
//  Created by Thien Vu Le on Mar/14/23.
//

import SwiftUI

struct DetailView: View {
    
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        print("Initializing detail view for \(coin.name)")
    }
    
    var body: some View {
        Text(coin.name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
