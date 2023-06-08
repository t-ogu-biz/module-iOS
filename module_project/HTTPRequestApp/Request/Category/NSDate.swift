//
//  NSDate.swift
//  Request
//
//  Created by 小口 哲史 on 2017/12/21.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import Foundation

let PARSE_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss"

extension Date {
    public func getNowEpocTimeForString() -> String {
        return "\(UInt64(floor((CFAbsoluteTimeGetCurrent() + kCFAbsoluteTimeIntervalSince1970))))"
    }
    
    public func getNowEpocTimeMinusValue() -> String {
        return "-\(UInt64(floor((CFAbsoluteTimeGetCurrent() + kCFAbsoluteTimeIntervalSince1970))))"
    }
    
    public func stringToDate(dateStr: String) -> Date {
        let dateStr = dateStr + (" JST")
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar.current
        dateFormatter.dateFormat = PARSE_DATE_FORMAT + (" z")
        let tmpDate: Date? = dateFormatter.date(from: dateStr)
        return tmpDate!
    }
    
    public func dateToString(date: Date, withFormat format: String) -> String {
        let df = DateFormatter()
        df.timeZone = NSTimeZone.default
        df.dateFormat = format
        let dfStr: String = df.string(from: date)
        return dfStr
    }
    
    public func commonDateString(withServer date: Date) -> String {
        return self.dateToString(date: date, withFormat: PARSE_DATE_FORMAT)
    }
    
    public func commonDateString(forRequest date: Date) -> String {
        return self.dateToString(date: date, withFormat: "yyyy-MM-dd 00:00:00")
    }
    
    public func dateToString(withCustomFormat date: Date) -> String {
        return self.dateToStringWithCustomFormat(date: date, showTime: false)
    }
    
    public func dateToStringWithCustomFormat(forCoverage date: Date) -> String {
        return self.dateToString(date: date, withFormat: "yyyy/MM/dd HH:mm")
    }
    
    public func dateToStringWithCustomFormat(date: Date, showTime: Bool) -> String {
        if self.isToday(date: date) {
            return self.dateToString(date: date, withFormat: "HH:mm")
        }
        else if showTime {
            return self.dateToString(date: date, withFormat: "MM/dd HH:mm")
        }
        else {
            return self.dateToString(date: date, withFormat: "MM/dd")
        }
    }
    
    public func isToday(date: Date) -> Bool {
        let jaLocale = Locale(identifier:  "ja_JP")
        let localDate = date.description(with: jaLocale)
        let localToday = Date().description(with: jaLocale)
        
        let date_formatter: DateFormatter = DateFormatter()
        let daycount: Int = NSInteger(date_formatter.date(from: localDate)!.timeIntervalSince1970) / 86400
        let todaycount: Int = NSInteger(date_formatter.date(from: localToday)!.timeIntervalSince1970) / 86400
        if daycount == todaycount {
            return true
        }
        return false
    }
}
