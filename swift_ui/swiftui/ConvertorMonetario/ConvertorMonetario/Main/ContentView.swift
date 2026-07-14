//
//  ContentView.swift
//  ConvertorMonetario
//
//  Created by Lucca Filizzola on 19/05/26.
//

import Foundation
import SwiftUI
import TipKit

struct ContentView: View {
    
    @State var showEnchangeInfo = false
    @State var showChangeCurrencyScreen = false
    
    @State var leftCurrencyAmount = ""
    @State var rightCurrencyAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: CurrencyModel = .silverPiece
    @State var rightCurrency: CurrencyModel = .goldPiece
    
    let userDefaults = UserDefaults.standard
    let leftCurrencyKey = "leftCurrency"
    let rightCurrencyKey = "rightCurrency"
    
    let currencyTip = CurrencyTip()
    
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
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 33)
                            
                            // texto moeda
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        
                        TextField("Amount", text: $leftCurrencyAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping) //captura o momento que o usuario clica no textField
                            .onChange(of: leftCurrencyAmount) {
                                if leftTyping {
                                    rightCurrencyAmount = leftCurrency.convert(leftCurrencyAmount, to: rightCurrency)
                                }
                            }
                    }
                    
                    // Equal Sign - Usei o SF Images, que ja sao intergradas no xcode
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                        .onTapGesture {
                            showChangeCurrencyScreen.toggle()
                            currencyTip.invalidate(reason: .actionPerformed) // para tirar o aviso depois que o usuário usar
                        }
                        .popoverTip(currencyTip, arrowEdge:  .bottom)
                        .sheet(isPresented: $showChangeCurrencyScreen) {
                            SelectCurrencyView(
                                topCurrencySelected: $leftCurrency,
                                bottomCurrencySelected: $rightCurrency
                            )
                        }
                    
                    VStack {
                        HStack {
                            //imagem moeda 2
                            
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            
                            // texto moeda
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        
                        //input - text Field
                        TextField("Amount", text: $rightCurrencyAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping) //captura o momento que o usuario clica no textField
                            .onChange(of: rightCurrencyAmount) {
                                if rightTyping {
                                    leftCurrencyAmount = rightCurrency.convert(rightCurrencyAmount, to: leftCurrency)
                                }
                            }
                    }
                    
                    
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                .keyboardType(.decimalPad)
                
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
        }
        .contentShape(Rectangle()) // necessário para capturar toque em área "vazia"/transparente
        .onTapGesture {
            leftTyping = false
            rightTyping = false
        }
        .task {
            let savedLeft = UserDefaults.standard.double(forKey: "leftCurrency")
            if let currency = CurrencyModel(rawValue: savedLeft) {
                leftCurrency = currency
            }
            
            let savedRight = UserDefaults.standard.double(forKey: "rightCurrency")
            if let currency = CurrencyModel(rawValue: savedRight) {
                rightCurrency = currency
            }
            try? Tips.configure()
        }
        .onChange(of: leftCurrency) {
            leftCurrencyAmount = rightCurrency.convert(rightCurrencyAmount, to: leftCurrency)
            userDefaults.set(leftCurrency.rawValue, forKey: leftCurrencyKey)
        }
        .onChange(of: rightCurrency) {
            rightCurrencyAmount = leftCurrency.convert(leftCurrencyAmount, to: rightCurrency)
            userDefaults.set(rightCurrency.rawValue, forKey: rightCurrencyKey)
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
 
 4 State e Binding
 
  Basicamente se não definromos nossas propriedades fora do contexto principal
  como binding estamos criando uma copia do valor da variavel e passando para
  frente sem refletir no contexto da variavel original.
  Logo a variavel no contexto orignal/ importante deve ter o wrapper state
  e as demais devem ter o wrapper binding. Assim a comunicação fica de fato bilateral, na qual o inicialmente o contentView informa a moeda inicial para a SelectCurrency que informa o IconGridCurrency, e ao tocar em outro icone esse informacao e passada por bind do gird para o selected para o content que tem no state o valor que precisa ser refletido
  
 5 Observable Properties
 No nosso caso, queremos que a função de converter seja chamada toda vez que mudarmos a moeda da esquerda e da direita e toda vez que digitarmos ou no campo da direita ou no campo da esquerda, por isso essas variavies precisam ser observaveis
 
 5.1 FocusState
 Um wrapper booleano que nos permite inditificar onde em nosso app, ou onde em nossa tela estamos focados. Precisamos dele nesse caso porque ao mesmo tempo que um campo esta atualziando o valor do outro, o outro tenta atualizar o valro do campo que estamos digitando dando erros de conversão. Logo precisamos desse cara para informar que estamos focados em um wrapper especifico.
 
 @FocusState var leftTyping

 TextField("Amount", text: $leftCurrencyAmount)
     .textFieldStyle(.roundedBorder)
     .focused($leftTyping)
     .onChange(of: leftCurrencyAmount) {
         if leftTyping {
             rightCurrencyAmount = leftCurrency.convert(leftCurrencyAmount, to: rightCurrency)
         }
     }
 
 6 Usando o currencyTip, é um pacote para informar melhor o usuário o que pode ser tocado. Mas oque eu achei interessente foi a inserção dele ao cycle view da tela, usando o
 .task, que vai executar o codigo nele ao carregar a tela, e nele ele configura o tipKit
 
 7 Desafios da aula
 
 7.1 Usando o UserDefaults
 
 
 */

#Preview {
    ContentView()
}
