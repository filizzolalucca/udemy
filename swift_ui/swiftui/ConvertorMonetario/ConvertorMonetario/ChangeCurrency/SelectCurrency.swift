//
//  ExtractView.swift
//  ConvertorMonetario
//
//  Created by Lucca Filizzola on 24/05/26.
//

import SwiftUI

struct SelectCurrencyView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrencySelected: CurrencyModel
    @Binding var bottomCurrencySelected: CurrencyModel
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                //Text
                Text("Select the currency you are stating with:")
                    .fontWeight(.bold)
                    .font(.headline)
                    .foregroundColor(.black)
                
               //Currency Icons
                IconGridCurrency(currencySelected: $topCurrencySelected)
                
                //Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.top)
                
                
               //Currency Icons
                IconGridCurrency(currencySelected: $bottomCurrencySelected)
                
               //Done button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black) // Para forcar os textos a ficarem brancos mesmo no darkMode
            
        }
    }
}

#Preview {
    @Previewable @State var topCurrencySelected: CurrencyModel = .copperPenny
    @Previewable @State var bottomCurrencySelected: CurrencyModel = .silverPenny
    SelectCurrencyView(
        topCurrencySelected: $topCurrencySelected,
        bottomCurrencySelected: $bottomCurrencySelected
    )
}

/*
 Anotações interessantes
 
 
 1 - A ordem dos modificadores importa muito
 
 Exemplo pratico:
 
 1.1 - O background dessa forma apos o frame infinite vai ate o final, como deveria ser para nossa task
 Text("Copper Penny")
     .padding(3)
     .font(.caption)
     .frame(maxWidth: .infinity)
     .background(.brown.opacity(0.75))
 
 1.2 - O background dessa forma, antes o frame infinite, fica apenas na palavra
 Text("Copper Penny")
     .padding(3)
     .font(.caption)
     .background(.brown.opacity(0.75)
     .frame(maxWidth: .infinity)
 
 isso acontece porque o background colore oque esta na view ate aquele ponto, logo se ele fosse colocado no inicio ele iria ficar atras da palavra
  
 2 - A diferença de Lazy Componets e Componets normais:
 
 2.1 - VStack x LazyVStack
 
 A VStack carrega todas as suas views imediatamernte, ate aquelas que não estão sendo vistas na tela. Enquanto a lazy so mostra aquelas que precisam ser mostradas e entao essas sao carregadas, o restante vai sendo carregada conforme o usuário scrollar a tela. Isso é muito util em cenários que é uma grande lista, sao muito itens, economiza procesamento
 
 3 - Usando VGridLayout
 
 LazyVGrid(columns: [
     GridItem(), GridItem(), GridItem()
 ]) {
     ForEach(0..<5) {_ in
         CurrencyCoinSelected(currencyImage: .copperpenny, currencyName: "Copper Penny")

     }
 }
 
 4 - Modificador overlay
 
 Modificador usado para colocar algo sobre a view, em sua frente
 
 
*/
