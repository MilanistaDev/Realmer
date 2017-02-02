//
//  ViewController.swift
//  Realmer
//
//  Created by 麻生 拓弥 on 2017/01/30.
//  Copyright © 2017年 麻生 拓弥. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    let realmDB = ColorModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        let dataContent = realm.objects(ColorModel.self)
        print(dataContent)
    }

    @IBAction func registerColor(_ sender: Any) {
        realmDB.id = 1
        realmDB.colorName = "Ginza Line"
        realmDB.rgbValue = "(243, 151, 0)"
        realmDB.hexValue = "F39700"
        let realm = try! Realm()
        realm.beginWrite()
        //self.storeColorData()
        //self.findColorData()
    }

    func storeColorData() {
        do {
            let realm = try! Realm()
            try! realm.write {
                realm.add(self.realmDB)
            }
        } catch {

        }
    }
    func findColorData() {
        let realm = try! Realm()
        let dataContent = realm.objects(ColorModel.self)
        print(dataContent)
    }

    func dataUpdate() {

        do {
            let realm = try! Realm()

            let data = realm.objects(ColorModel.self).last!
            try realm.write {
                data.colorName = "Marunouchi Line"
            }

        } catch {

        }
    }

    func delete() {

        do {
            let realm = try! Realm()

            let data = realm.objects(ColorModel.self).last!

            try realm.write {
                realm.delete(data)
            }
            
        } catch {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

