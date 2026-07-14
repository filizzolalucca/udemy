//
//  ExtractView.swift
//  ConvertorMonetario
//
//  Created by Lucca Filizzola on 24/05/26.
//

import SwiftUI

struct ExtractView: View {
    let leftImage: ImageResource
    let textExtract: String
    let rightImage: ImageResource
    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            Text(textExtract)
            
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
        }
    }
}

#Preview {
    ExtractView(
        leftImage: .goldpenny,
        textExtract:  "Extract",
        rightImage: .silverpenny
    )
}

