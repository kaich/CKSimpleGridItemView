//
//  CKGridInformationView.swift
//  AwesomeBat
//
//  Created by mac on 16/10/19.
//  Copyright © 2016年 kaicheng. All rights reserved.
//

import UIKit
import SnapKit

let HexColor = {(hex :Int, alpha :Float) in return UIColor.init(colorLiteralRed: ((Float)((hex & 0xFF0000) >> 16))/255.0, green: ((Float)((hex & 0xFF00) >> 8))/255.0, blue: ((Float)(hex & 0xFF))/255.0, alpha: alpha) }

public struct CKGridItem {
    fileprivate var content :String
    fileprivate var unit :String
    
    public init(content :String, unit :String) {
        self.content = content
        self.unit = unit
    }
}

public class CKSimpleGridItemView: UIView {
    fileprivate var items = [CKGridItem]()
    
    public convenience init(items :[CKGridItem], frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)) {
        self.init(frame: frame)
        self.items = items
        setup()
    }
    
    fileprivate override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        let contentView = UIView()
        contentView.backgroundColor = UIColor.white
        addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(8)
            make.bottom.equalTo(self).offset(-8)
            make.left.right.equalTo(self)
        }
        
        layer.cornerRadius = 3
        layer.borderWidth = 1 / UIScreen.main.scale
        layer.borderColor = HexColor(0xbbbbbb,1).cgColor
        
        var lastGridView :UIView? = nil
        for (index,emItem) in items.enumerated() {
            let gridView = UIView()
            gridView.backgroundColor = UIColor.clear
            contentView.addSubview(gridView)
            
            let lblContent = UILabel()
            lblContent.backgroundColor = UIColor.clear
            lblContent.font = UIFont.systemFont(ofSize: 13)
            lblContent.textAlignment = .center
            lblContent.text = emItem.content
            gridView.addSubview(lblContent)
            
            let lblUnit = UILabel()
            lblUnit.backgroundColor = UIColor.clear
            lblUnit.font = UIFont.systemFont(ofSize: 10)
            lblUnit.textColor = HexColor(0x999999,1)
            lblUnit.textAlignment = .center
            lblUnit.text = emItem.unit
            gridView.addSubview(lblUnit)
            
            gridView.snp.makeConstraints({ (make) in
                if index == 0 {
                    make.left.equalTo(self)
                }
                else {
                    if let lastGridView = lastGridView {
                        make.left.equalTo(lastGridView.snp.right)
                        make.width.equalTo(lastGridView)
                    }
                    if index == self.items.count - 1 {
                        make.right.equalTo(contentView)
                    }
                }
                make.top.equalTo(0)
                make.bottom.equalTo(0)
            })
            
            lblContent.snp.makeConstraints({ (make) in
                make.width.height.equalTo(lblUnit)
                make.left.right.equalTo(gridView)
                make.left.right.equalTo(lblUnit)
                make.top.equalTo(gridView)
            })
            
            lblUnit.snp.makeConstraints({ (make) in
                make.top.equalTo(lblContent.snp.bottom)
                make.bottom.equalTo(gridView)
            })
            
            if index != items.count - 1 {
                let seperate = UIView()
                seperate.backgroundColor = HexColor(0xdddddd,1)
                addSubview(seperate)
                seperate.snp.makeConstraints({ (make) in
                    make.left.equalTo(gridView.snp.right)
                    make.top.bottom.equalTo(self)
                    make.width.equalTo(1 / UIScreen.main.scale)
                })
            }
            
            lastGridView = gridView
        }
    }

}
