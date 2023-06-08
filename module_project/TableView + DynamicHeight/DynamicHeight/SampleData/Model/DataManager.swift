//
//  DataManager.swift
//  DynamicHeight
//
//  Created by 小口 哲史 on 2018/02/07.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    class func getDataSouceInfo() -> Array<DataSourceInfo> {
        var infos = Array<DataSourceInfo>()
        let infoA = DataSourceInfo()
        infoA.name = "のび太 社長"
        infoA.title = "【業務連絡】件名が入ります件名が入ります"
        infoA.subject = "宛先が入ります,広島・放送部(23名)"
        infoA.date = "2018/01/25 10:55"
        infos.append(infoA)
        
        let infoB = DataSourceInfo()
        infoB.name = "のび太 本部長"
        infoB.title = "【業務連絡】件名が入ります件名が入ります件名が入ります件名が入ります件名が入ります件名が入ります"
        infoB.subject = "宛先が入ります,広島・放送部(23名),広島・技術部(6名)"
        infoB.date = "2018/01/25 10:55"
        infos.append(infoB)
        
        let infoC = DataSourceInfo()
        infoC.name = "のび太 部長"
        infoC.title = "【業務連絡】件名が入ります件名が入ります"
        infoC.subject = "宛先が入ります,広島・放送部(23名),広島・技術部(6名),技術・報道技術部(145名),広島・放送部(23名),広島・技術部(6名),技術・報道技術部(145名)"
        infoC.date = "2018/01/25 10:55"
        infos.append(infoC)
        
        let infoD = DataSourceInfo()
        infoD.name = "のび太 副部長"
        infoD.title = "【業務連絡】件名が入ります件名が入ります"
        infoD.subject = "宛先が入ります,技術・報道技術部(145名)"
        infoD.date = "2018/01/25 10:55"
        infos.append(infoD)
        
        let infoE = DataSourceInfo()
        infoE.name = "のび太 本部著"
        infoE.title = "【業務連絡】件名が入ります件名が入ります"
        infoE.subject = "宛先が入ります,広島・技術部(6名),技術・報道技術部(145名)"
        infoE.date = "2018/01/25 10:55"
        infos.append(infoE)
        
        return infos
    }
}
