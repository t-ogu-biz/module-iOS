//
//  DateManager.swift
//  PersonnelManagementApp
//
//  Created by 小口 哲史 on 2018/01/30.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

import UIKit
enum DateFormat {
    case YEAR
    case MONTH
    case DAY
    case HOUR
    case MINUTE
    case SECOND
}
class DateManager: NSObject {
    /*
     * 指定日から指定期間分の日にち一覧を返却
     *
     * @param:  {baseDate} 基準日
     * @param: {term} 期間
     * @methodOf DateManager
     */
     class func getTermDays(baseDate:Date, term:Int) -> [String] {
        var result:[String] = []
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        //formatter.dateFormat = "yyyy-MM-dd"
        var components = DateComponents()
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        for i in 0 ..< term {
            components.setValue(i,for: Calendar.Component.day)
            let wk = calendar.date(byAdding: components, to: Date())!
            let wkStr = formatter.string(from:wk)
            result.append(wkStr)
        }
        return result
    }
    
    /*
     * 曜日を返却
     *
     * @param: {baseDate} 基準日
     * @param: {date} 日にち
     * @methodOf DateManager
     */
    class func getDayOfWeek(dateStr:String) -> String {
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        //formatter.dateFormat = "yyyy-MM-dd"
        let dateData:NSDate = formatter.date(from:dateStr)! as NSDate
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let weekdayIndex = calendar.component(.weekday, from: dateData as Date) - 1
        //formatter.dateFormat = "M月d日 \(formatter.shortWeekdaySymbols[weekdayIndex]) H:mm"
        formatter.dateFormat = "\(formatter.shortWeekdaySymbols[weekdayIndex])"
        return formatter.string(from:dateData as Date)
    }
    /*
     * 　日時に関して、指定の項目を返却
     *
     * @param: {dateStr} 日時
     * @param: {format} 項目
     * @methodOf DateManager
     */
    class func getFormatDate(dateStr:String, format:DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        formatter.locale = Locale(identifier: "ja_JP")
        let date = formatter.date(from: dateStr)
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var formatDate = 0
            if  (format == DateFormat.YEAR) {
                formatDate = calendar.component(.year, from:date!)
            } else if (format == DateFormat.MONTH) {
                formatDate = calendar.component(.month, from:date!)
            } else if (format == DateFormat.DAY) {
                formatDate = calendar.component(.day, from:date!)
            } else if (format == DateFormat.HOUR) {
                formatDate = calendar.component(.hour, from:date!)
            } else if (format == DateFormat.MINUTE) {
                formatDate = calendar.component(.minute, from:date!)
            } else {
                formatDate = calendar.component(.second, from:date!)
        }
        return String(formatDate)
    }
    /*
     * yyyymmddの形式に成形し日にちを返却
     *
     * @param: {originalDate} 日時
     * @methodOf DateManager
     */
    class func getMoldingDateWithSchedule(originalDate:String) -> String {
        let array = originalDate.components(separatedBy: " ")
        let dateStr = array[0]
        let dateArray = dateStr.components(separatedBy: "-")
        let year = dateArray[0]
        let month = dateArray[1]
        let day = dateArray[2]
        let moldingDate:String = year + month + day
        return moldingDate
    }
    /*
     * mmddデータを表示用データに成形し返却
     *
     * @param: {originalDate} 日時
     * @methodOf DateManager
     */
    class func getMoldingDateWithMMDD(originalDate:String) -> String {
            if (originalDate == "") {
                return ""
            }
        var moldingDate:String = originalDate
        let startIndex = moldingDate.index(moldingDate.startIndex, offsetBy: 2)
        moldingDate.insert(":", at:startIndex)
        return moldingDate
    }
    /*
     * mmddデータを表示用データに成形し返却
     *
     * @param: {originalDate} 日時
     * @methodOf DateManager
     */
    class func getMoldingDateWithYYYYMMDD(originalDate:String) -> String {
        if (originalDate == "") {
            return ""
        }
        print("時刻は:" + originalDate)
        var moldingDate:String = originalDate
        let index01 = moldingDate.index(moldingDate.startIndex, offsetBy: 4)
        moldingDate.insert("/", at:index01)
        let index02 = moldingDate.index(moldingDate.startIndex, offsetBy: 7)
        moldingDate.insert("/", at:index02)
        return moldingDate
    }
    /*
     * mmddデータを表示用データに成形し返却
     *
     * @param: {originalDate} 日時
     * @methodOf DateManager
     */
        //"20180319100000",
    class func getMoldingDateWithYYYYMMDDhhmm(originalDate:String) -> String {
        if (originalDate == "") {
            return ""
        }
        print("時刻は:" + originalDate)
        var moldingDate:String = originalDate
        let index01 = moldingDate.index(moldingDate.startIndex, offsetBy: 4)
        moldingDate.insert("/", at:index01)
        let index02 = moldingDate.index(moldingDate.startIndex, offsetBy: 7)
        moldingDate.insert("/", at:index02)
        let index03 = moldingDate.index(moldingDate.startIndex, offsetBy: 10)
        moldingDate.insert(" ", at:index03)
        let index04 = moldingDate.index(moldingDate.startIndex, offsetBy: 13)
        moldingDate.insert(":", at:index04)
        let index05 = moldingDate.index(moldingDate.startIndex, offsetBy: 15)
        moldingDate.remove(at:index05)
        let index06 = moldingDate.index(moldingDate.startIndex, offsetBy: 16)
        moldingDate.remove(at:index06)
        return moldingDate
    }
}
