//
//  DataManager.swift
//  TableViewApp
//
//  Created by 小口哲史 on 2017/05/31.
//  Copyright © 2017年 microwave. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    class func getSmartPhoneInfo() -> Array<SmartPhoneInfo> {
        var infos:Array<SmartPhoneInfo> = Array<SmartPhoneInfo>()
        let infoA:SmartPhoneInfo = SmartPhoneInfo()
        infoA.name = "Xperia X Performance S0-04H"
        infoA.maker = "ソニーモバイル"
        infoA.weight = "165g"
        infoA.deviceSize = "71×144×8.6mm"
        infoA.displaySize = "5.0インチ"
        infoA.cpu = "2.2GHz+1.6GHZクアッドコア"
        infoA.thumbnailFile = "Xperia X Performance S0-04H.png"
        infos.append(infoA)
        
        let infoB:SmartPhoneInfo = SmartPhoneInfo()
        infoB.name = "Xperia X Performance"
        infoB.maker = "ソニーモバイル"
        infoB.weight = "165g"
        infoB.deviceSize = "71×144×8.6mm"
        infoB.displaySize = "5.0インチ"
        infoB.cpu = "2.2GHz+1.6GHZクアッドコア"
        infoB.thumbnailFile = "Xperia X Performance.png"
        infos.append(infoB)
        
        let infoC:SmartPhoneInfo = SmartPhoneInfo()
        infoC.name = "HUAWEI P9 Lite"
        infoC.maker = "Huawei"
        infoC.weight = "147g"
        infoC.deviceSize = "73×147×7.5mm"
        infoC.displaySize = "5.2インチ"
        infoC.cpu = "2GHz+1.7GHZオタクコア"
        infoC.thumbnailFile = "HUAWEI P9 Lite.png"
        infos.append(infoC)
        
        let infoD:SmartPhoneInfo = SmartPhoneInfo()
        infoD.name = "AQUOS ZETA SH-04H"
        infoD.maker = "シャープ"
        infoD.weight = "155g"
        infoD.deviceSize = "73×149×7.6mm"
        infoD.displaySize = "5.3インチ"
        infoD.cpu = "2.2GHz+1.6GHZクアッドコア"
        infoD.thumbnailFile = "AQUOS ZETA SH-04H.png"
        infos.append(infoD)
        
        let infoE:SmartPhoneInfo = SmartPhoneInfo()
        infoE.name = "HTC 10"
        infoE.maker = "HTC"
        infoE.weight = "161g"
        infoE.deviceSize = "72×146×9.2mm"
        infoE.displaySize = "5.2インチ"
        infoE.cpu = "2.2GHz+1.6GHZクアッドコア"
        infoE.thumbnailFile = "HTC 10.png"
        infos.append(infoE)
        
        let infoF:SmartPhoneInfo = SmartPhoneInfo()
        infoF.name = "Galaxy S7 edge SCV33"
        infoF.maker = "サムスン"
        infoF.weight = "158g"
        infoF.deviceSize = "73×151×7.7mm"
        infoF.displaySize = "5.5インチ"
        infoF.cpu = "2.2GHz+1.6GHZクアッドコア"
        infoF.thumbnailFile = "Galaxy S7 edge SCV33.png"
        infos.append(infoF)
        
        let infoG:SmartPhoneInfo = SmartPhoneInfo()
        infoG.name = "BREEZ X5"
        infoG.maker = "Covia"
        infoG.weight = "148g"
        infoG.deviceSize = "73×145×8.9mm"
        infoG.displaySize = "5.0インチ"
        infoG.cpu = "1.1GHzクアッドコア"
        infoG.thumbnailFile = "BREEZ X5.png"
        infos.append(infoG)
        
        let infoH:SmartPhoneInfo = SmartPhoneInfo()
        infoH.name = "iPhone SE"
        infoH.maker = "アップル"
        infoH.weight = "113g"
        infoH.deviceSize = "59×124×7.6mm"
        infoH.displaySize = "4.0インチ"
        infoH.cpu = "1.85GHzデュアルコア"
        infoH.thumbnailFile = "iPhone SE.png"
        infos.append(infoH)
        
        return infos
    }
}
