//
//  ProductDetailViewController.swift
//  Teste
//
//  Created by Santos, Dario Ferreira on 12/02/2023.
//

import Foundation
import UIKit

class ProductDetailViewController: UIViewController {
    
    //    let descriptionText = UITextView()
    //    var isDescriptionTextVisible = false
    //    var descriptionButton = UIButton()
    //    let deliveryText = UITextView()
    //    var isDeliveryTextVisible = false
    //    var deliveryButton = UIButton()
    //    lazy var divider1 = makeDividerView()
    //    lazy var divider2 = makeDividerView()
    //    lazy var divider3 = makeDividerView()
    //
    //    var descriptionTextHeight: NSLayoutConstraint!
    //    var deliveryTextHeight: NSLayoutConstraint!
    //    var descriptionTextTopAnchor: NSLayoutConstraint!
    //    var deliveryTextTopAnchor: NSLayoutConstraint!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationItem.title = "Detail"
        
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchProducts))
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSizeMake(self.view.frame.width, self.view.frame.height + 1200)
        
//        let favImage = makeImageView(named: "heart")
        let favImage = makeImageView(named: "heart", withTint: .red)


        
        let imageNames = ["first", "second", "third", "fourth"]
        let carrousel = makeImageViews(named: imageNames)
        
        let brandLabel: UILabel = UILabel()
        brandLabel.text = "Mulher Originals"
        brandLabel.font = UIFont(name: "Futura-Medium", size: 16)
        brandLabel.textColor = UIColor(red: 0.635, green: 0.659, blue: 0.694, alpha: 1)
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let modelLabel: UILabel = UILabel()
        modelLabel.text = "Sapatilhas Stan Smith"
        modelLabel.font = UIFont(name: "Futura-Bold", size: 24)
        modelLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let priceLabel: UILabel = UILabel()
        priceLabel.text = "120,00€"
        priceLabel.font = UIFont(name: "Futura-Medium", size: 14)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let discountLabel: UILabel = UILabel()
        discountLabel.text = "00,00€"
        discountLabel.font = UIFont(name: "Futura-Medium", size: 14)
        discountLabel.textColor = UIColor(red: 0.635, green: 0.659, blue: 0.694, alpha: 1)
        discountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let discountedPriceLabel: UILabel = UILabel()
        discountedPriceLabel.text = "00,00€"
        discountedPriceLabel.font = UIFont(name: "Futura-Bold", size: 14)
        discountedPriceLabel.textColor = UIColor(red: 0.871, green: 0.408, blue: 0.114, alpha: 1)
        discountedPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let discountedPercentLabel: UILabel = UILabel()
        discountedPercentLabel.text = "(-44%)"
        discountedPercentLabel.font = UIFont(name: "Futura-Medium", size: 14)
        discountedPercentLabel.textColor = UIColor(red: 0.871, green: 0.408, blue: 0.114, alpha: 1)
        discountedPercentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let sizeGuideLabel: UILabel = UILabel()
        sizeGuideLabel.font = UIFont(name: "Futura-Medium", size: 16)
        sizeGuideLabel.translatesAutoresizingMaskIntoConstraints = false
        sizeGuideLabel.attributedText = NSAttributedString(string: "Size Guide", attributes:
                                                            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        
        let sizeButton = BorderButton(text: "Select size", sfSymbolName: "chevron.down")
        sizeButton.titleLabel?.font = UIFont(name: "Futura-Medium", size: 16)
        sizeButton.translatesAutoresizingMaskIntoConstraints = false
        sizeButton.layer.cornerRadius = 16
        sizeButton.layer.borderWidth = 1
        sizeButton.layer.borderColor = UIColor.black.cgColor
        
        let colorButton = BorderButton(text: "Select colour", sfSymbolName: "chevron.down")
        colorButton.titleLabel?.font = UIFont(name: "Futura-Medium", size: 16)
        colorButton.translatesAutoresizingMaskIntoConstraints = false
        colorButton.layer.cornerRadius = 16
        colorButton.layer.borderWidth = 1
        colorButton.layer.borderColor = UIColor.black.cgColor
        
        let addToBagButton = UIButton()
        addToBagButton.titleLabel?.font = UIFont(name: "Futura-Bold", size: 16)
        addToBagButton.setTitle("Add to Bag", for: .normal)
        addToBagButton.setTitleColor(.white, for: .normal)
        addToBagButton.backgroundColor = UIColor(red:0.93725, green:0.70588, blue:0.55686, alpha: 1)
        addToBagButton.layer.cornerRadius = 16
        addToBagButton.translatesAutoresizingMaskIntoConstraints = false
        addToBagButton.addTarget(self, action: #selector(addToBagAction), for: .touchUpInside)
        
        //        descriptionButton = NoBorderButton(text: "Description", sfSymbolName: "")
        //        descriptionButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        //        descriptionButton.tintColor = .black
        //        descriptionButton.translatesAutoresizingMaskIntoConstraints = false
        //        descriptionButton.setTitleColor(.black, for: .normal)
        //        descriptionButton.addTarget(self, action: #selector(descriptionButtonTapped), for: .touchUpInside)
        //        descriptionButton.contentHorizontalAlignment = .right
        //
        //        descriptionText.text = """
        //                                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop
        //                                """
        //        descriptionText.font = UIFont.systemFont(ofSize: 16)
        //        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        //        descriptionText.sizeToFit()
        //        descriptionText.isScrollEnabled = false
        //
        //        descriptionTextHeight = descriptionText.heightAnchor.constraint(equalToConstant: 0)
        //        descriptionTextHeight.isActive = true
        //
        //        deliveryButton = NoBorderButton(text: "Delivery & Returns", sfSymbolName: "")
        //        deliveryButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        //        deliveryButton.tintColor = .black
        //        deliveryButton.translatesAutoresizingMaskIntoConstraints = false
        //        deliveryButton.setTitleColor(.black, for: .normal)
        //        deliveryButton.addTarget(self, action: #selector(deliveryButtonTapped), for: .touchUpInside)
        //        deliveryButton.contentHorizontalAlignment = .right
        //
        //        deliveryText.text = """
        //                                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop
        //                                """
        //        deliveryText.font = UIFont.systemFont(ofSize: 16)
        //        deliveryText.translatesAutoresizingMaskIntoConstraints = false
        //        deliveryText.sizeToFit()
        //        deliveryText.isScrollEnabled = false
        //
        //        deliveryTextHeight = deliveryText.heightAnchor.constraint(equalToConstant: 0)
        //        deliveryTextHeight.isActive = true
        
        view.addSubview(scrollView)
        scrollView.addSubview(carrousel)
        scrollView.addSubview(brandLabel)
        scrollView.addSubview(modelLabel)
        scrollView.addSubview(favImage)
        scrollView.addSubview(priceLabel)
        scrollView.addSubview(discountLabel)
        scrollView.addSubview(discountedPriceLabel)
        scrollView.addSubview(discountedPercentLabel)
        scrollView.addSubview(sizeGuideLabel)
        scrollView.addSubview(sizeButton)
        scrollView.addSubview(colorButton)
        scrollView.addSubview(addToBagButton)
        //        scrollView.addSubview(divider1)
        //        scrollView.addSubview(descriptionButton)
        //        scrollView.addSubview(descriptionText)
        //        scrollView.addSubview(divider2)
        //        scrollView.addSubview(deliveryButton)
        //        scrollView.addSubview(deliveryText)
        //        scrollView.addSubview(divider3)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            carrousel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            carrousel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carrousel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            carrousel.heightAnchor.constraint(equalToConstant: 418),
            
            brandLabel.topAnchor.constraint(equalTo: carrousel.bottomAnchor, constant: 32),
            brandLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            modelLabel.topAnchor.constraint(equalTo: brandLabel.bottomAnchor, constant: 8),
            modelLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            favImage.centerYAnchor.constraint(equalTo: modelLabel.centerYAnchor),
            favImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            favImage.widthAnchor.constraint(equalToConstant: 22),
            favImage.heightAnchor.constraint(equalToConstant: 18.67),
            
            priceLabel.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            discountLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            discountLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 8),
            
            discountedPriceLabel.centerYAnchor.constraint(equalTo: discountLabel.centerYAnchor),
            discountedPriceLabel.leadingAnchor.constraint(equalTo: discountLabel.trailingAnchor, constant: 8),
            
            discountedPercentLabel.centerYAnchor.constraint(equalTo: discountedPriceLabel.centerYAnchor),
            discountedPercentLabel.leadingAnchor.constraint(equalTo: discountedPriceLabel.trailingAnchor, constant: 8),
            
            sizeGuideLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 40),
            sizeGuideLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            sizeButton.topAnchor.constraint(equalTo: sizeGuideLabel.bottomAnchor, constant: 24),
            sizeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sizeButton.heightAnchor.constraint(equalToConstant: 56),
            sizeButton.widthAnchor.constraint(equalToConstant: 350),
            
            colorButton.topAnchor.constraint(equalTo: sizeButton.bottomAnchor, constant: 24),
            colorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorButton.heightAnchor.constraint(equalToConstant: 56),
            colorButton.widthAnchor.constraint(equalToConstant: 350),
            
            addToBagButton.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: 40),
            addToBagButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addToBagButton.widthAnchor.constraint(equalToConstant: 350),
            addToBagButton.heightAnchor.constraint(equalToConstant: 56),
            
            //            divider1.topAnchor.constraint(equalTo: addToBagButton.bottomAnchor, constant: 56),
            //            divider1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //            divider1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            //            divider1.heightAnchor.constraint(equalToConstant: 1),
            //
            //            descriptionButton.topAnchor.constraint(equalTo: divider1.bottomAnchor, constant: 26),
            //            descriptionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //            descriptionButton.widthAnchor.constraint(equalToConstant: 350),
            //
            ////            descriptionText.topAnchor.constraint(equalTo: descriptionButton.bottomAnchor, constant: 0),
            //            descriptionText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //            descriptionText.widthAnchor.constraint(equalToConstant: 350),
            //
            //            divider2.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 32),
            //            divider2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //            divider2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            //            divider2.heightAnchor.constraint(equalToConstant: 1),
            //
            //            deliveryButton.topAnchor.constraint(equalTo: divider2.bottomAnchor, constant: 26),
            //            deliveryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //            deliveryButton.widthAnchor.constraint(equalToConstant: 350),
            //
            ////            deliveryText.topAnchor.constraint(equalTo: deliveryButton.bottomAnchor, constant: 32),
            //            deliveryText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //            deliveryText.widthAnchor.constraint(equalToConstant: 350),
            //
            //            divider3.topAnchor.constraint(equalTo: deliveryText.bottomAnchor, constant: 32),
            //            divider3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //            divider3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            //            divider3.heightAnchor.constraint(equalToConstant: 1),
        ])
        //
        //        descriptionTextTopAnchor = descriptionText.topAnchor.constraint(equalTo: descriptionButton.bottomAnchor, constant: 0)
        //        descriptionTextTopAnchor.isActive = true
        //
        //        deliveryTextTopAnchor = descriptionText.topAnchor.constraint(equalTo: deliveryButton.bottomAnchor, constant: 0)
        //        deliveryTextTopAnchor.isActive = true
        
    }
    
    @objc func searchProducts() {
        print("Search Button tapped")
    }
    
    @objc func addToBagAction() {
        print("Add To Bag Button tapped")
    }
    
//    public func makeImageView(named: String) -> UIImageView {
//        let view = UIImageView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.contentMode = .scaleAspectFill
//        view.image = UIImage(named: named)
//        view.setContentHuggingPriority(UILayoutPriority(rawValue: 250), for: .vertical)
//        view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 750), for: .vertical)
//        view.tintColor = UIColor(red:0.87059, green:0.40784, blue:0.11373, alpha: 1)
//
//        return view
//    }
    
    func makeImageView(named: String, withTint tint: UIColor? = nil) -> UIImageView {
            let view = UIImageView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.contentMode = .scaleAspectFill
            view.image = UIImage(named: named)?.withRenderingMode(.alwaysTemplate)
            view.setContentHuggingPriority(UILayoutPriority(rawValue: 250), for: .vertical)
            view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 750), for: .vertical)
            if let tint = tint {
                view.tintColor = tint
            }
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
    
    //    @objc func descriptionButtonTapped() {
    //        print("Description Button tapped")
    //        isDescriptionTextVisible.toggle()
    //        if isDescriptionTextVisible {
    //            descriptionTextHeight.constant = 200
    //            descriptionTextTopAnchor.constant = 0
    //            descriptionButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
    //        } else {
    //            descriptionTextHeight.constant = 0
    //            descriptionTextTopAnchor.constant = 32
    //            descriptionButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    //        }
    //    }
    //
    //    @objc func deliveryButtonTapped() {
    //        print("Delivery Button tapped")
    //        isDeliveryTextVisible.toggle()
    //        if isDeliveryTextVisible {
    //            deliveryTextHeight.constant = 200
    //            deliveryTextTopAnchor.constant = 0
    //            deliveryButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
    //        } else {
    //            deliveryTextHeight.constant = 0
    //            deliveryTextTopAnchor.constant = 32
    //            deliveryButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    //        }
    //    }
    //
    //
    //    public func makeDividerView() -> UIView {
    //        let view = UIView(frame: CGRect(x: 0, y: 100, width: 320, height: 1.0))
    //        view.translatesAutoresizingMaskIntoConstraints = false
    //        view.backgroundColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)
    //        return view
    //    }
}
