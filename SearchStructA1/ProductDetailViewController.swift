//
//  ProductDetailViewController.swift
//  SearchStructA1
//
//  Created by Jakkawad Chaiplee on 5/30/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var lblProductName:UILabel!
    
    var detailProduct:Product? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        if let detailProduct = detailProduct {
            if let detailProductLabel = lblProductName {
                detailProductLabel.text = detailProduct.name
                title = detailProduct.id
            }
        }
    }
    /*
     func configureView() {
     if let detailCandy = detailCandy {
     if let detailDescriptionLabel = detailDescriptionLabel, candyImageView = candyImageView {
     detailDescriptionLabel.text = detailCandy.name
     candyImageView.image = UIImage(named: detailCandy.name)
     title = detailCandy.category
            }
        }
     }
*/
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
