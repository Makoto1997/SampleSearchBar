//
//  ViewController.swift
//  SearchSample
//
//  Created by Makoto on 2021/05/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    private let tableViewCell = "searchTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.placeholder = "検索"
        searchBar.delegate = self
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "searchTableViewCell")
    }
}

extension ViewController: UISearchBarDelegate {
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchTableViewCell") as! SearchTableViewCell
        
        return cell
    }
}
