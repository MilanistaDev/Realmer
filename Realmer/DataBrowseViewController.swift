//
//  DataBrowseViewController.swift
//  Realmer
//
//  Created by 麻生 拓弥 on 2017/02/01.
//  Copyright © 2017年 麻生 拓弥. All rights reserved.
//

import UIKit

class DataBrowseViewController: UIViewController {

    @IBOutlet weak var dataBrowseTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataBrowseTableView.delegate = self
        self.dataBrowseTableView.dataSource = self

        self.dataBrowseTableView.estimatedRowHeight = 72.0
        self.dataBrowseTableView.register(UINib(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: "DataCell")

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

        cell.colorView.backgroundColor = UIColor.red
        cell.colorNameLabel.text = "Maunouchi Line"
        cell.rgbLabel.text = "(255, 0, 0)"
        cell.hexLabel.text = "#FF0000"
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }


}


extension DataBrowseViewController: UITableViewDelegate {

}
