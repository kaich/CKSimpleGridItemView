//
//  ViewController.swift
//  CKSimpleGridItemView
//
//  Created by kaich on 10/19/2016.
//  Copyright (c) 2016 kaich. All rights reserved.
//

import UIKit
import CKSimpleGridItemView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let gridView = CKSimpleGridItemView(items: [CKGridItem(content: "5.72", unit: "版本"),CKGridItem(content: "106.66MB", unit: "大小"),CKGridItem(content: "1284万", unit: "下载量")], frame: CGRect(x: 10, y: 300, width: 300, height: 49))
        self.view.addSubview(gridView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

