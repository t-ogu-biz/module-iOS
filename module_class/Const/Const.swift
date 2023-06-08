//
//  Const.swift
//  PersonnelManagementApp
//
//  Created by 小口 哲史 on 2018/02/07.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

import UIKit
//アラートタイプ
enum AlertType {
    case ERROR_COMMON
    case ERROR_LOGINVIEW_LOGINCHECK_NILL
}
//入力カテゴリー
enum InputCategory {
    case NONE
    case BUSINESS_SCHEDULE
    case LODGE_SCHEDULE
    case PERSONNEL_INFORMATION
}
//入力画面タイプ
enum IputDisplayType {
    case NONE
    case KEYBORD
    case PICKER
    case LIST
    case ACCORDION
}
//入力フォーマットタイプ
enum InputFormatTypeData {
    case NONE
    //1列
    case PICKER_TYPE_01
    //２列
    case PICKER_TYPE_02
    //改行不可
    case KEYBORD_TYPE_01
    //改行可
    case KEYBORD_TYPE_02
    //通常業務管理者部局入力
    case ACCORDION_PERSONNEL_NORMAL_BUSINESS_MANAGER_DEPARTMENT
    //通常業務管理者氏名
    case ACCORDION_PERSONNEL_NORMAL_BUSINESS_MANAGER
}
//入力項目
enum InputItem {
    case NONE
    case BUSINESS_SCHEDULE_LINE
    case BUSINESS_SCHEDULE_TIME_STRAT
    case BUSINESS_SCHEDULE_TIME_END
    case BUSINESS_SCHEDULE_LOCATION
    case BUSINESS_SCHEDULE_CONTENT
    case BUSINESS_SCHEDULE_MEMO
    case LODGE_SCHEDULE_NECESSITY
    case LODGE_SCHEDULE_SMOKING
    case LODGE_SCHEDULE_LODGENAME
    case LODGE_SCHEDULE_ADRESS
    case LODGE_SCHEDULE_PERSONNEL_MEMO
    //生涯メールアドレス
    case PERSONNEL_INFO_LIFE_MAIL_ADRESS
    case PERSONNEL_INFO_LIFE_MAIL_ADRESS_RELEASE
    //携帯電話(業務用)
    case PERSONNEL_INFO_BUSINESS_MOBILE_PHONE_NUMBER
    case PERSONNEL_INFO_BUSINESS_MOBILE_PHONE_NUMBER_RELEASE
    //携帯メールアドレス(業務用)
    case PERSONNEL_INFO_BUSINESS_MOBILE_PHONE_ADRESS
    case PERSONNEL_INFO_BUSINESS_MOBILE_PHONE_ADRESS_RELEASE
    case PERSONNEL_INFO_BUSINESS_MOBILE_PHONE_SYSTEM
    //携帯電話(私用)
    case PERSONNEL_INFO_PRIVATE_MOBILE_PHONE_NUMBER
    case PERSONNEL_INFO_PRIVATE_MOBILE_PHONE_NUMBER_RELEASE
     //携帯メールアドレス(私用)
    case PERSONNEL_INFO_PRIVATE_MOBILE_PHONE_ADRESS
    case PERSONNEL_INFO_PRIVATE_MOBILE_PHONE_ADRESS_RELEASE
    case PERSONNEL_INFO_PRIVATE_MOBILE_PHONE_SYSTEM
    //連絡メール1
    case PERSONNEL_INFO_CONTACT1_MOBILE_PHONE_ADRESS
    case PERSONNEL_INFO_CONTACT1_MOBILE_PHONE_ADRESS_RELEASE
    case PERSONNEL_INFO_CONTACT1_MOBILE_PHONE_SYSTEM
    //連絡メール2
    case PERSONNEL_INFO_CONTACT2_MOBILE_PHONE_ADRESS
    case PERSONNEL_INFO_CONTACT2_MOBILE_PHONE_ADRESS_RELEASE
    case PERSONNEL_INFO_CONTACT2_MOBILE_PHONE_SYSTEM
    //性別
    case PERSONNEL_INFO_GENDER
    //住所
    case PERSONNEL_INFO_ADRESS
    case PERSONNEL_INFO_ADRESS_RELEASE
    //本部5キロ圏内
    case PERSONNEL_INFO_WITHIN_5KM
    //担当可能業務1
    case PERSONNEL_INFO_POSSIBLLE1
    //担当可能業務2
    case PERSONNEL_INFO_POSSIBLLE2
    //担当可能業務3
    case PERSONNEL_INFO_POSSIBLLE3
    //入局年次
    case PERSONNEL_INFO_ENTRANCE
    //報道経験
    case PERSONNEL_INFO_REPORT_EXPERIENCE
    //通常業務管理者部局
    case PERSONNEL_INFO_MANAGER_DEPARTMENT
    //通常業務管理者氏名
    case PERSONNEL_INFO_MANAGER_NAME
    //メモ
    case PERSONNEL_INFO_MEMO
}
//マスター
let LOCAL_MASTER_HEADQUARTERS_WIYHIN:Array = ["圏外", "圏内"]
let LOCAL_MASTER_RELASE:Array = ["非公開", "公開", "管理者のみ公開"]
let LOCAL_MASTER_SYSTEM_MAIL_RECEPTION:Array = ["このメールアドレスにシステムからメールを受け取らない", "このメールアドレスにシステムからメールを受け取る"]
let LOCAL_MASTER_SYSTEM_MAIL_RECEPTION_INPUT:Array = ["システムからメールを受け取らない", "システムからメールを受け取る"]
class Const: NSObject {}










