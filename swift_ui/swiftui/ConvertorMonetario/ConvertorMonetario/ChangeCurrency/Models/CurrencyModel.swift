//
//  CurrencyModel.swift
//  ConvertorMonetario
//
//  Created by Lucca Filizzola on 11/07/26.
//

import SwiftUI

enum CurrencyModel: Double, CaseIterable, Identifiable {
    var id: CurrencyModel {
        self
    }
    
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var image: ImageResource {
        switch self {
        case .copperPenny:
            return .copperpenny
        case .silverPenny:
            return .silverpenny
        case .silverPiece:
            return .silverpiece
        case .goldPenny:
            return .goldpenny
        case .goldPiece:
            return .goldpiece
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        }
    }
    
    func convert(_ amountString: String, to currency: CurrencyModel) -> String {
        guard let doubleAmount = Double(amountString) else { return "" }
        let result = currency.rawValue  * (doubleAmount / self.rawValue)
        return String(format: "%.2f", result)
    }
}


/*
 Anotações interessantes
 
 
 1 - Self
 
 So reforcando, mas quando usamos self usamos a referencia da classe, struct ou enum que estamos tratando no momento,
 cada um desses já e criado com a referencia self que se auto referencia
 
 2 - Collections
 
 Ponto atencão !!!! -> Nesse aula ele explica sobre as collection principais, array, dicionario, e set. Percebi que nunca entende bem set, ver a explicacao depos.
 
 **Set** é uma coleção sem ordem e sem duplicatas, ideal quando você só precisa responder "isso já existe?" de forma rápida (O(1), ao contrário do `Array` que percorre item por item). Para isso funcionar, o tipo guardado precisa ser `Hashable` — ou seja, o Swift consegue calcular um número (hash) a partir do valor e usar isso como "endereço" para achar ou guardar o item instantaneamente, sem precisar comparar com todos os outros. Structs simples (como `String`, `Int`, ou suas próprias structs com propriedades `Hashable`) ganham isso automaticamente.

 Use `Set` para: remover duplicatas, checar existência repetidamente (ex: IDs já processados), ou comparar grupos com `union`/`intersection`/`subtracting`. Evite `Set` quando a ordem importa (histórico, listas exibidas na UI), quando duplicatas são intencionais (carrinho de compras), ou quando você precisa acessar por índice (`array[0]`) — nesses casos, `Array` é a escolha certa.

 Use `Dictionary` quando, além de checar existência, você precisa **associar um valor a uma chave** (ex: código da moeda → objeto/valor completo, ou código → taxa de câmbio). Regra prática: "isso existe?" → `Set`; "isso existe, e qual é o valor?" → `Dictionary`; "a ordem/repetição importa?" → `Array`.
 
 2.1 -> Como fazer um array de enum
 
 Basta adicionar no nosso enum a propriedade CaseIterable, que var criar um array com todos os possiveis valores. Todavia parece que para usar o enum como uma propriedade interavel(array), precisamos de usar o protocol Identifier na classe e defini-lo. Isso ocorre pois o foreach exige uma coleção de dados identificaveis
 
 3 -> função argument Label e Param Name
 Eu já vi isso, mas achei legal reforçar que ele explica que em siwft podemos ter o nome que aparece para quem chama a funcao (ou nao aparece quando é _)  "argument label" e o nome que usamos no escopro da funcao param Name e sao nesse modelo que escrevi na convert
 
 convert(_ amountString: String, to currency: CurrencyModel) -> String {
*/
