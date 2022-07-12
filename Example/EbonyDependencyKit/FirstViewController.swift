//
//  ViewController.swift
//  EbonyDependencyKit
//
//  Created by rising-jun on 07/12/2022.
//  Copyright (c) 2022 rising-jun. All rights reserved.
//

import UIKit
import EbonyDependencyKit

class FirstViewController: UIViewController, DependencySetable {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        DependencyInjector.injecting(to: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        DependencyInjector.injecting(to: self)
    }
    
    private var firstManagable: FirstManagable?
    var dependency: FirstDependency? {
        didSet { self.firstManagable = dependency?.manager }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        firstManagable?.printWhenSetting()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
