//
//  ProductsViewController.swift
//  Teste
//
//  Created by Santos, Dario Ferreira on 12/02/2023.
//

import Foundation
import UIKit

class ProductsViewController: UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchProducts))
        
        let image = makeImageView(named: "airwalk_one")
        let favImage = makeImageView(named: "heart")
        
        let brandLabel: UILabel = UILabel()
        brandLabel.text = "Mulher Originals"
        brandLabel.font = UIFont(name: "Roboto-Regular", size: 16)
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let modelLabel: UILabel = UILabel()
        modelLabel.text = "Sapatilhas Stan Smith"
        modelLabel.font = UIFont(name: "Roboto-Bold", size: 20)
        modelLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let priceLabel: UILabel = UILabel()
        priceLabel.text = "120,00€"
        priceLabel.font = UIFont(name: "Roboto-Regular", size: 16)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let sizeGuideLabel: UILabel = UILabel()
        sizeGuideLabel.font = UIFont(name: "Roboto-Regular", size: 16)
        sizeGuideLabel.translatesAutoresizingMaskIntoConstraints = false
        sizeGuideLabel.attributedText = NSAttributedString(string: "Size Guide", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        
        view.addSubview(image)
        view.addSubview(brandLabel)
        view.addSubview(favImage)
        view.addSubview(modelLabel)
        view.addSubview(priceLabel)
        view.addSubview(sizeGuideLabel)
        
        image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: 418).isActive = true

        brandLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 40).isActive = true
        brandLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        favImage.centerYAnchor.constraint(equalTo: brandLabel.centerYAnchor).isActive = true
        favImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        favImage.widthAnchor.constraint(equalToConstant: 22).isActive = true
        favImage.heightAnchor.constraint(equalToConstant: 18.67).isActive = true
        
        modelLabel.topAnchor.constraint(equalTo: brandLabel.bottomAnchor, constant: 8).isActive = true
        modelLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        priceLabel.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: 8).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        sizeGuideLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 32).isActive = true
        sizeGuideLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    
    @objc func searchProducts() {
        // TODO
    }
    
    public func makeImageView(named: String) -> UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: named)
        view.setContentHuggingPriority(UILayoutPriority(rawValue: 250), for: .vertical)
        view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 750), for: .vertical)

        return view
    }

}

