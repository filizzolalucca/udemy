//
//  IconGridCurrency.swift
//  ConvertorMonetario
//
//  Created by Lucca Filizzola on 12/07/26.
//

import SwiftUI

struct IconGridCurrency: View {
    @Binding var currencySelected: CurrencyModel

    var body: some View {
        LazyVGrid(columns: [
            GridItem(), GridItem(), GridItem()
        ]) {
            
            ForEach(CurrencyModel.allCases) { currencyCoin in
                if currencySelected == currencyCoin {
                    CurrencyCoinSelected(currencyImage: currencyCoin.image, currencyName: currencyCoin.name)
                        .shadow(color: .black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                } else {
                    CurrencyCoinSelected(currencyImage: currencyCoin.image, currencyName: currencyCoin.name)
                        .onTapGesture {
                            self.currencySelected = currencyCoin
                            //Essa ação vai montar a tela do zero novamente, por conta da propriedade state
                        }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var currencySelected: CurrencyModel = .copperPenny
    IconGridCurrency(currencySelected: $currencySelected)
}
