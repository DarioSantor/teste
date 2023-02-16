//
//  ProductDetailViewController.swift
//  Teste
//
//  Created by Santos, Dario Ferreira on 12/02/2023.
//

import Foundation
import UIKit

class ProductDetailViewController: UIViewController {
    
    private let productsInfo = InfoAPI.getProductsDetails()
    
    var detailsTableView = UITableView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchProducts))
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSizeMake(self.view.frame.width, self.view.frame.height + 600)
        
        let favImage = makeImageView(named: "heart")
        
        let imageNames = ["first", "second", "third", "fourth"]
        let carrousel = makeImageViews(named: imageNames)
        
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
        
        let sizeButton = BorderButton(text: "Select size", sfSymbolName: "chevron.down")
        sizeButton.translatesAutoresizingMaskIntoConstraints = false
        sizeButton.layer.cornerRadius = 8
        sizeButton.layer.borderWidth = 1
        sizeButton.layer.borderColor = UIColor.black.cgColor
        
        let colorButton = BorderButton(text: "Select colour", sfSymbolName: "chevron.down")
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
        addToBagButton.addTarget(self, action: #selector(addToBagAction), for: .touchUpInside)
        
        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)
        
        detailsTableView = UITableView()
        detailsTableView.translatesAutoresizingMaskIntoConstraints = false
        detailsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        detailsTableView.dataSource = self
        detailsTableView.delegate = self
        detailsTableView.rowHeight = 68
        
        var tableViewHeight: CGFloat {
            detailsTableView.layoutIfNeeded()

            return detailsTableView.contentSize.height
        }
        
        view.addSubview(scrollView)
        scrollView.addSubview(carrousel)
        scrollView.addSubview(brandLabel)
        scrollView.addSubview(favImage)
        scrollView.addSubview(modelLabel)
        scrollView.addSubview(priceLabel)
        scrollView.addSubview(sizeGuideLabel)
        scrollView.addSubview(sizeButton)
        scrollView.addSubview(colorButton)
        scrollView.addSubview(addToBagButton)
        scrollView.addSubview(divider)
        scrollView.addSubview(detailsTableView)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            carrousel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            carrousel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carrousel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            carrousel.heightAnchor.constraint(equalToConstant: 418),
            
            brandLabel.topAnchor.constraint(equalTo: carrousel.bottomAnchor, constant: 40),
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
            
            divider.topAnchor.constraint(equalTo: addToBagButton.bottomAnchor, constant: 56),
            divider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            divider.widthAnchor.constraint(equalToConstant: 350),
            divider.heightAnchor.constraint(equalToConstant: 1),
            
            detailsTableView.topAnchor.constraint(equalTo: divider.bottomAnchor),
            detailsTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailsTableView.widthAnchor.constraint(equalToConstant: 350),
            detailsTableView.heightAnchor.constraint(equalToConstant: tableViewHeight)
        ])
        
    }
    
    @objc func searchProducts() {
        print("Search Button tapped")
    }
    
    @objc func addToBagAction() {
        print("Add To Bag Button tapped")
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
    
    public func makeImageViews(named imageNames: [String]) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.bounces = false
        
        var previousView: UIView? = nil
        for imageName in imageNames {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.image = UIImage(named: imageName)
            imageView.setContentHuggingPriority(UILayoutPriority(rawValue: 250), for: .vertical)
            imageView.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 750), for: .vertical)
            scrollView.addSubview(imageView)
            NSLayoutConstraint.activate([
                imageView.leadingAnchor.constraint(equalTo: previousView?.trailingAnchor ?? scrollView.leadingAnchor),
                imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            ])
            previousView = imageView
        }
        if let previousView = previousView {
            NSLayoutConstraint.activate([
                previousView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
            ])
        }
        return scrollView
    }
}

extension ProductDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(String(describing: productsInfo[indexPath.row].title))")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsInfo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(productsInfo[indexPath.row].title ?? "Error fetching data!")"
        return cell
    }

}

