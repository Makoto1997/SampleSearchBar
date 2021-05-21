//
//  ViewController.swift
//  SearchSample
//
//  Created by Makoto on 2021/05/16.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    private let tableViewCell = "searchTableViewCell"
    private let dataList = ["東京","大阪", "京都", "北海道", "沖縄", "愛知", "神奈川", "福岡", "兵庫", "青森", "鹿児島", "福井", "宮城", "静岡", "宮崎", "秋田"]
    
    private var searchResult = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        //何も入力されていなくてもReturnキーを押せるようにする。
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.placeholder = "検索"
        
        searchResult = dataList
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "searchTableViewCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchTableViewCell") as! SearchTableViewCell
        
        cell.label.text = searchResult[indexPath.row]
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        //検索結果配列を空にする。
        searchResult.removeAll()
        if(searchBar.text == "") {
            
            searchResult = dataList
        } else {
            
            dataList.forEach { (data) in
                if data.contains(searchBar.text!) {
                    
                    searchResult.append(data)
                }
            }
        }
        
        searchTableView.reloadData()
    }
}
