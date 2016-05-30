//
//  ViewController.swift
//  SearchStructA1
//
//  Created by Jakkawad Chaiplee on 5/30/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView:UITableView!
    
    var detailViewController:ProductDetailViewController? = nil
    var products = [Product]()
    var filteredProducts = [Product]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ProductDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let product:Product
                if searchController.active && searchController.searchBar.text != "" {
                    product = filteredProducts[indexPath.row]
                } else {
                    product = products[indexPath.row]
                }
                let controller = segue.destinationViewController as! ProductDetailViewController
                controller.detailProduct = product
                
            }
        }
    }
    func filterContentForSearchText(searchText:String, scope:String = "All") {
        filteredProducts = products.filter { product in
            return product.name.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        tableView.reloadData()
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return products.count
        if searchController.active && searchController.searchBar.text != "" {
            return filteredProducts.count
        }
        
        return products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell0 = tableView.dequeueReusableCellWithIdentifier("tableCell0")
        let product:Product
        if searchController.active && searchController.searchBar.text != "" {
            product = filteredProducts[indexPath.row]
        } else {
            product = products[indexPath.row]
        }
        
        cell0?.textLabel?.text = product.name
        return cell0!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        products = [
            Product(name: "A", id: "1"),
            Product(name: "B", id: "2")]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController:UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

