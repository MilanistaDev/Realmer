//
//  ColorModel.swift
//  Realmer
//
//  Created by 麻生 拓弥 on 2017/01/31.
//  Copyright © 2017年 麻生 拓弥. All rights reserved.
//

import UIKit
import RealmSwift

class ColorModel: Object {
    dynamic var id: Int = 0
    dynamic var colorName: String = ""
    dynamic var rgbValue: String = ""
    dynamic var hexValue: String = ""
}
