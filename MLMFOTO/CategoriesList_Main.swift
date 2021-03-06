//
//  ViewController.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 9/11/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class CategoriesList: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var newestVersion: Int?
    
    var categories = [Categories]()
    var filteredCategories = [Categories]()
    var selectedSubCategory: [SubCategories]?
    var selectedCategory: Categories?
    var tableViewShouldAnimate: Bool = false
    
    var searchController: LightSearchController?
    
    var isViewDidLoad = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigationBar()
        initStyling()
        
        // It's all begin here..
        fetchVersion()
        
        initTableView()
        initSearchController()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if tableViewShouldAnimate {
            initStyleForTableView()
            tableViewShouldAnimate = false
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
        if isViewDidLoad {
            checkUpdateVersion()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        initObserver()
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        // Dismiss SearchController if it's in active state
        dismissSearchController()
        removeAllObserver()
    }
}

