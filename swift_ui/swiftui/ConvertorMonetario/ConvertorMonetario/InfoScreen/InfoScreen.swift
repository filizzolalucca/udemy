//
//  InfoScreen.swift
//  ConvertorMonetario
//
//  Created by Lucca Filizzola on 24/05/26.
//

import SwiftUI

struct InfoScreen: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            //BackgorundImage
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                //Title
                Text("Enchange Rates")
                    .font(.largeTitle)
                    .tracking(3) //adiciona espaco entre as letras
                
                //Text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .padding()
                
                //Exchange rate
                ExtractView(
                    leftImage: .goldpiece,
                    textExtract: "1 peça de ouro = 4 moedas de ouro",
                    rightImage: .goldpenny
                )
                
                ExtractView(
                    leftImage: .goldpenny,
                    textExtract: "1 moeda de ouro = 4 pecas de prata",
                    rightImage: .silverpiece
                )
                
                ExtractView(
                    leftImage: .silverpiece,
                    textExtract: "1 peça de prata = 4 moedas de prata",
                    rightImage: .silverpenny
                )
                
                ExtractView(
                    leftImage: .silverpenny,
                    textExtract: "1 moeda de prata = 100 moedas de prata",
                    rightImage: .copperpenny
                )
                
                
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2)) //mistura com uma cor
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
            }
            .foregroundStyle(.black)
        }
    }
}


#Preview {
    InfoScreen()
}
/*
 Anotações interessantes
 
 1 - Dark Mode e modificadores globais: Basicamente e mostrou que no dark mode os textos ficavam brancos e nao ficavam legais para essa tela, ai ao inves de colocar modificador de cor em cada view, ele coloca na stack toda, e no caso do botao que a cor deveria ser branca ele colocou um modificador so para o botao
 
 2 -  @Environment é um wrapper que usamos para usar funcoes pre-definidas do swift ui, como no nosso caso a função dismiss que fecha um apresentação (present)
 */
