//
//  HomeViewController.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 29/08/22.
//

import UIKit

class HomeViewController: UIViewController, UISearchControllerDelegate {
    
    var restaurantes: [Restaurant] = []
    var searchActive = true
    
    
    private let homeView: HomeView = {
        let homeView = HomeView()
        homeView.translatesAutoresizingMaskIntoConstraints = false
        
        return homeView
    }()
    
    private let searchBar: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "Procure um restaurante"
        search.searchBar.tintColor = UIColor(named: "mainYellow")
        search.searchBar.setValue("Cancelar", forKey: "cancelButtonText")
        search.searchBar.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    lazy var restaurantsCollectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor(named: "mainBackground")
        collection.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: "RestaurantCollectionViewCell")
        
        return collection
    }()
    
    lazy var categoryCollectionView : UICollectionView = {
        
        let carouselCollectionView = UICollectionViewFlowLayout()
        carouselCollectionView.scrollDirection = .horizontal
        
        let carouselFlowCollectionView = UICollectionView(frame: .zero, collectionViewLayout: carouselCollectionView)
        carouselFlowCollectionView.translatesAutoresizingMaskIntoConstraints = false
        carouselFlowCollectionView.backgroundColor = UIColor(named: "mainBackground")
        carouselFlowCollectionView.register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: "CarouselCollectionViewCell")
        
        return carouselFlowCollectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadJson()
        
        setupView()
        
        setupCollectionView()
        
        view.backgroundColor = UIColor(named: "mainBackground")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func loadJson() {
        
        guard let jsonURL = Bundle.main.url(forResource: "server-response", withExtension: "json") else { return }
        
        do {
            let data = try Data(contentsOf: jsonURL)
            let decoder = JSONDecoder()
            restaurantes = try decoder.decode([Restaurant].self, from: data)
        } catch {
            print(error)
        }
    }
    
    private func setupCollectionView() {
        
        restaurantsCollectionView.delegate = self
        restaurantsCollectionView.dataSource = self
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        searchBar.delegate = self
    }
}



extension HomeViewController: ViewConfiguration {
    
    func buildViewHierarchy() {
        
        view.addSubview(homeView)
        view.addSubview(searchBar.searchBar)
        navigationItem.searchController = searchBar
        view.addSubview(restaurantsCollectionView)
        
//        view.addSubview(categoryCollectionView)
    }
    
    func setupContraints() {
        
        NSLayoutConstraint.activate([
            
            homeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
//            categoryCollectionView.topAnchor.constraint(equalTo: homeView.topAnchor, constant: 125),
//            categoryCollectionView.leadingAnchor.constraint(equalTo: homeView.leadingAnchor, constant: 0),
//            categoryCollectionView.trailingAnchor.constraint(equalTo: homeView.trailingAnchor, constant: 0),
//            categoryCollectionView.heightAnchor.constraint(equalToConstant: 30),
            
            restaurantsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            restaurantsCollectionView.leadingAnchor.constraint(equalTo: homeView.leadingAnchor, constant: 8),
            restaurantsCollectionView.trailingAnchor.constraint(equalTo: homeView.trailingAnchor, constant: -8),
            restaurantsCollectionView.bottomAnchor.constraint(equalTo: homeView.bottomAnchor, constant: 0)
        ])
    }
    
    func setupAdditionalConfiguration() {
        
        navigationItem.setHidesBackButton(true, animated: true)
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == restaurantsCollectionView {
            return restaurantes.count
        }
        
        return restaurantes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == restaurantsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantCollectionViewCell",
                                                                for: indexPath) as? RestaurantCollectionViewCell else { return UICollectionViewCell() }
            
            cell.configuraCell(restaurantes[indexPath.row])
            
            return cell
        } else {
            guard let carouCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCollectionViewCell",
                                                                     for: indexPath) as? CarouselCollectionViewCell else { return UICollectionViewCell() }
            
            carouCell.configuraCarrouCell(restaurantes[indexPath.row])
            
            return carouCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == restaurantsCollectionView {
            
            let restaurante = restaurantes[indexPath.item]
            
            let infosViewController = InfosViewController()
            infosViewController.update(restaurant: restaurante)
            
            let navigationController = UINavigationController(rootViewController: infosViewController)
            
            self.present(navigationController, animated: true)
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == restaurantsCollectionView {
            return CGSize(width: 165, height: 200)
        }
        
        if collectionView == categoryCollectionView {
            return CGSize(width: 150, height: 100)
        }
        
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 8, bottom: 8, right: 8)
    }
}
extension HomeViewController: UISearchBarDelegate{
    
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
}
