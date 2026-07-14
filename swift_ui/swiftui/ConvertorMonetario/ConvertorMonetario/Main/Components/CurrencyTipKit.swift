//
//  TipKit.swift
//  ConvertorMonetario
//
//  Created by Lucca Filizzola on 13/07/26.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("you can change currency")
    
    var image: Image? = Image(systemName: "hand.tap.fill")
}
