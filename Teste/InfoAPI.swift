//
//  InfoAPI.swift
//  Teste
//
//  Created by Santos, Dario Ferreira on 16/02/2023.
//

import Foundation

class InfoAPI {
    static func getProductsDetails() -> [InfoCell]{
        let productInfo = [
            InfoCell(title: "A sought-after version of the Gazelle trainer returns.", text: "Born in the '60s, the adidas Gazelle trainers have a long and rich history on the pitch. For this pair, we're giving some love to a lesser-known version released in 1985. It still has the low-key look and 3-Stripes you're familiar with, but all the other details have been refined. The suede is smooth, the tooling is taller and the pattern is reworked with just the right amount of fresh. No longer made for training, these shoes are pure adidas style."),
            InfoCell(title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", text: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
            InfoCell(title: "A sought-after version of the Gazelle trainer returns.", text: "Born in the '60s, the adidas Gazelle trainers have a long and rich history on the pitch. For this pair, we're giving some love to a lesser-known version released in 1985. It still has the low-key look and 3-Stripes you're familiar with, but all the other details have been refined. The suede is smooth, the tooling is taller and the pattern is reworked with just the right amount of fresh. No longer made for training, these shoes are pure adidas style."),
            InfoCell(title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", text: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
        ]
        return productInfo
    }
    

}
