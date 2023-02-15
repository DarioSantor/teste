//
//  ViewController.swift
//  Teste
//
//  Created by Santos, Dario Ferreira on 12/02/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var productsButton: UIButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(productsButton)
        productsButton.translatesAutoresizingMaskIntoConstraints = false
        productsButton.setTitle("Go to Products", for: .normal)
        productsButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            productsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    @objc func handleLogin() {
        let navController = navigationController
        navController?.pushViewController(ProductsViewController(), animated: true)
        let navBar = navController!.navigationBar
        navBar.backgroundColor = .white
        navBar.tintColor = .black
        navigationItem.backButtonTitle = ""
    }
    
}

