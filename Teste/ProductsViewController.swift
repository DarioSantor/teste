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
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchProducts))
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSizeMake(self.view.frame.width, self.view.frame.height + 100)
        
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
        
        let sizeButton = SFButton(text: "Select size", sfSymbolName: "chevron.down")
        sizeButton.translatesAutoresizingMaskIntoConstraints = false
        sizeButton.layer.cornerRadius = 8
        sizeButton.layer.borderWidth = 1
        sizeButton.layer.borderColor = UIColor.black.cgColor
        
        let colorButton = SFButton(text: "Select colour", sfSymbolName: "chevron.down")
        colorButton.translatesAutoresizingMaskIntoConstraints = false
        colorButton.layer.cornerRadius = 8
        colorButton.layer.borderWidth = 1
        colorButton.layer.borderColor = UIColor.black.cgColor
        
        let addToBagButton = UIButton()
        addToBagButton.setTitle("Add to Bag", for: .normal)
        addToBagButton.setTitleColor(.white, for: .normal)
        addToBagButton.backgroundColor = .black
        addToBagButton.layer.cornerRadius = 8
        addToBagButton.translatesAutoresizingMaskIntoConstraints = false
        addToBagButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        let divider = UIView(frame: CGRect(x: 0, y: 100, width: 320, height: 1.0))
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .black

        
        view.addSubview(scrollView)
        scrollView.addSubview(image)
        scrollView.addSubview(brandLabel)
        scrollView.addSubview(favImage)
        scrollView.addSubview(modelLabel)
        scrollView.addSubview(priceLabel)
        scrollView.addSubview(sizeGuideLabel)
        scrollView.addSubview(sizeButton)
        scrollView.addSubview(colorButton)
        scrollView.addSubview(addToBagButton)
        scrollView.addSubview(divider)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            image.topAnchor.constraint(equalTo: scrollView.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: 418),

            brandLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 40),
            brandLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            favImage.centerYAnchor.constraint(equalTo: brandLabel.centerYAnchor),
            favImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            favImage.widthAnchor.constraint(equalToConstant: 22),
            favImage.heightAnchor.constraint(equalToConstant: 18.67),
            
            modelLabel.topAnchor.constraint(equalTo: brandLabel.bottomAnchor, constant: 8),
            modelLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            priceLabel.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            sizeGuideLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 32),
            sizeGuideLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            sizeButton.topAnchor.constraint(equalTo: sizeGuideLabel.bottomAnchor, constant: 32),
            sizeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sizeButton.heightAnchor.constraint(equalToConstant: 56),
            sizeButton.widthAnchor.constraint(equalToConstant: 350),
            
            colorButton.topAnchor.constraint(equalTo: sizeButton.bottomAnchor, constant: 24),
            colorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorButton.heightAnchor.constraint(equalToConstant: 56),
            colorButton.widthAnchor.constraint(equalToConstant: 350),
            
            addToBagButton.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: 32),
            addToBagButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addToBagButton.widthAnchor.constraint(equalToConstant: 350),
            addToBagButton.heightAnchor.constraint(equalToConstant: 56),
            
            divider.topAnchor.constraint(equalTo: addToBagButton.bottomAnchor, constant: 24),
            divider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            divider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            divider.heightAnchor.constraint(equalToConstant: 1)
        ])

    }
    
    
    @objc func searchProducts() {
        print("Button tapped") // Print a message when the button is tapped
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
    
    @objc func buttonTapped() {
        print("Button tapped") // Print a message when the button is tapped
    }

}

