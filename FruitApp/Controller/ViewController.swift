//
//  ViewController.swift
//  FruitApp
//
//  Created by Mavin on 7/12/21.
//

import UIKit

class ViewController: UIViewController,UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: ViewFruit?
    let searchController = UISearchController(searchResultsController: nil)
    var fruitsFilter: [Fruit] = []
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Fruits"
        
        self.navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
        let searchBar = searchController.searchBar
        filterContent(searchBar.text!)
    }
    
    func filterContent(_ searchText: String ) {
        fruitsFilter = fruitsData.filter { (fruit: Fruit) -> Bool in
            return fruit.title.lowercased().contains(searchText.lowercased())
        }
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
           return fruitsFilter.count
        }
        
        return fruitsData.count

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let fruit: Fruit
        if isFiltering {
            fruit = fruitsFilter[indexPath.row]
        }else{
            fruit = fruitsData[indexPath.row]
        }
        
        let DetailVC = storyboard?.instantiateViewController(identifier: "DetailVC") as! DetailViewController
        
        self.delegate = DetailVC
        delegate?.onViewData(fruit: fruit)
        
        self.navigationController?.pushViewController(DetailVC, animated: true)
        
//        DetailVC.modalPresentationStyle = .fullScreen
//
//        self.present(DetailVC, animated: true, completion: nil)
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FruitTableViewCell
        let fruit: Fruit
        if isFiltering {
            fruit = fruitsFilter[indexPath.row]
        }else{
            fruit = fruitsData[indexPath.row]
        }
        cell.thumbnail?.image = UIImage(named: fruit.image)
        cell.titleLabel?.text = fruit.title
        cell.descriptionLabel?.text = fruit.headline
        cell.thumbnail?.backgroundColor = UIColor(named: fruit.gradientColors[1])
        return cell
    }


}

