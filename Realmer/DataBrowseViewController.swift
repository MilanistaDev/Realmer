//
//  DataBrowseViewController.swift
//  Realmer
//
//  Created by 麻生 拓弥 on 2017/02/01.
//  Copyright © 2017年 麻生 拓弥. All rights reserved.
//

import UIKit
import RealmSwift

class DataBrowseViewController: UIViewController {

    @IBOutlet weak var dataBrowseTableView: UITableView!
    var dataContents = [Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataBrowseTableView.delegate = self
        self.dataBrowseTableView.dataSource = self
        self.dataBrowseTableView.allowsSelection = false
        self.dataBrowseTableView.estimatedRowHeight = 72.0
        self.dataBrowseTableView.register(UINib(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: "DataCell")
        self.navigationItem.title = "Registerd Color Data"

        // TableViewのDataSource用のArray生成
        self.acquireColorData()
    }

    func acquireColorData() {
        let realm = try! Realm()
        // ColorModel のものをRealmから取得してArrayに格納
        dataContents = Array(realm.objects(ColorModel.self))
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension DataBrowseViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as! DataTableViewCell

        let colorModel:ColorModel = dataContents[indexPath.row] as! ColorModel

        cell.colorView.backgroundColor = UIColor.hexColor(hexStr: colorModel.hexValue as NSString)
        cell.colorNameLabel.text = colorModel.colorName
        cell.rgbLabel.text = colorModel.rgbValue
        cell.hexLabel.text = "#" + colorModel.hexValue
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataContents.count
    }
}

extension DataBrowseViewController: UITableViewDelegate {

}

extension UIColor {
    class func hexColor(hexStr: NSString) -> UIColor {
        let hexStrs = hexStr.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexStrs as String)
        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:1.0)
        } else {
            // Default
            return UIColor.white
        }
    }
}
