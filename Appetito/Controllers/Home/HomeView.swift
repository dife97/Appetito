//
//  HomeView.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 29/08/22.
//

import UIKit


class HomeView: UIView {
    
    
    
    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension HomeView: ViewConfiguration {
    func buildViewHierarchy() {
        self.backgroundColor = UIColor(named: "mainBackground")
    }
    
    func setupContraints(){
        
    }
}
