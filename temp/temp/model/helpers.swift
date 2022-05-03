//
//  helper.swift
//  temp
//
//  Created by administrator-zou on 2022/4/25.
//

import Foundation

func get_string_from_date(date:Date) ->String{
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter.string(from: date)
}

func vaild_email(_ email:String) -> Bool{
    return true
}
