//
//  Buttons.swift
//  Teste
//
//  Created by Santos, Dario Ferreira on 14/02/2023.
//

import Foundation
import UIKit

class BorderButton: UIButton {
    private let textLabel = UILabel()
    private let sfImageView = UIImageView()
    init(text: String, sfSymbolName: String) {
        super.init(frame: .zero)
        textLabel.text = text
        textLabel.textAlignment = .left
        textLabel.textColor = UIColor(red: 0.325, green: 0.337, blue: 0.353, alpha: 0.5)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        sfImageView.image = UIImage(systemName: sfSymbolName)
        sfImageView.tintColor = .black
        sfImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(sfImageView)
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            sfImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -23.5),
            sfImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class NoBorderButton: UIButton {
    private let textLabel = UILabel()
    private let sfImageView = UIImageView()
    init(text: String, sfSymbolName: String) {
        super.init(frame: .zero)
        textLabel.text = text
        textLabel.textAlignment = .left
        textLabel.textColor = .black
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        sfImageView.image = UIImage(systemName: sfSymbolName)
        sfImageView.tintColor = .black
        sfImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(sfImageView)
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            sfImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            sfImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
