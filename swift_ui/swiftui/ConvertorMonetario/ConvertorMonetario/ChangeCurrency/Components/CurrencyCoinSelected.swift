//
//  CurrencyCoinSelected.swift
//  ConvertorMonetario
//
//  Created by Lucca Filizzola on 07/07/26.
//

import SwiftUI

struct CurrencyCoinSelected: View {
    
    let currencyImage: ImageResource
    let currencyName: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
            
            
                
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyCoinSelected(
        currencyImage: .goldpenny,
        currencyName: "Gold Penny"
    )
}
