//
//  ContentView.swift
//  ConvertorMonetario
//
//  Created by Lucca Filizzola on 19/05/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var showEnchangeInfo = false
    @State var leftCurrencyAmount = ""
    @State var rightCurrencyAmount = ""
    
    var body: some View {
        // Oranizado de tras para frente, oque tiver mais pro final vai sobresair
        ZStack {
            /*
             Por padrão as imagem são fullSize, por isso utilizamos o
             resizable, para caber na tela
             // Image("background") ->funciona tambem
             */
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            
            VStack {
                /*
                 PoneyImage
                 
                 scaleToFit - mantem a proporcao original de altura e largura
                 */
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200) //Nao preciso por largura pelo scaleToFit
                
                //CurrencyView
                Text("Conversor Monetario")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                
                HStack {
                    //View Moeda 1
                    
                    VStack {
                        //Curreency
                        HStack {
                            //imagem moeda 1
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 33)
                            
                            // texto moeda
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        
                        TextField("Amount", text: $leftCurrencyAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    // Equal Sign - Usei o SF Images, que ja sao intergradas no xcode
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    VStack {
                        HStack {
                            //imagem moeda 2
                            
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            
                            // texto moeda
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        
                        //input - text Field
                        TextField("Amount", text: $rightCurrencyAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                
                //Info Button
                
                HStack {
                    Spacer()
                    
                    Button {
                        showEnchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    
                }
                
                
            }
            .border(.blue)
        }
        .sheet(isPresented: $showEnchangeInfo) {
            InfoScreen()
        }
    }
}

/*
 Anotações legais das aulas
 
 1 - struct é um tipo de estrutura de dadas imutavel, tentei mudar uma var que estava dentro de uma struct atraves da action de um button e tive esse erro
         Button {
            showEnchangeInfo = false -> Cannot assign to property: 'self' is immutable
         }
     eu tive que usar um properity wrapper -> algo que nao podemos ver mas envolve a propriedade, de mode que a altera de forma a fazer certas coisas ou permitir certas funcionalidades
    @State var showEnchangeInfo = false -> State é um wrapper que da a permissao de alterar o estado da view
 
 2 - Como podemos fazer com que o usuario consiga alterar o valor, usando o sinal de $, pois ai estamos informando que aquele tipo vai ser do tipo binding
 
 3 - alem de modificadores que modificam a visualizacao, tambem usamos modificadores de acao, como foi o caso do .sheet no botao que apresenta um conteudo em forma de bottomSheet, acho curioso voltar nessa aula porque ele mostrou que oque conhece a ação de shet, na verdade é a contentView como um todo, entao em qualquer lugar que colocassemos a funcao, ele abriria da mesma forma, ela responde a mudanca de estado do showEnchangeInfo mas ela nao precisa nescessariemente estar ligada ao botao
 
 .sheet(isPresented: $showEnchangeInfo) {
 InfoScreen()
 }
 
 4 
 
 */
