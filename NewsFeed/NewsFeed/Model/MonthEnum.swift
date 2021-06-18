//
//  MonthEnum.swift
//  NewsFeed
//
//  Created by Yash Jivani on 18/06/21.
//

import Foundation

enum MonthEnum : String, CustomStringConvertible{
    case Jan = "01"
    case Feb = "02"
    case March = "03"
    case April = "04"
    case May = "05"
    case June = "06"
    case July = "07"
    case Aug = "08"
    case Sep = "09"
    case Oct = "10"
    case Nov = "11"
    case Dec = "12"
    
    var description : String {
        switch self {
        // Use Internationalization, as appropriate.
        case .Jan: return "Jan"
        case .Feb: return "Feb"
        case .March: return "Mar"
        case .April: return "Apr"
        case .May: return "May"
        case .June: return "Jun"
        case .July: return "Jly"
        case .Aug: return "Aug"
        case .Sep: return "Sep"
        case .Oct: return "Oct"
        case .Nov: return "Nov"
        case .Dec: return "Dec"
        }
      }
}
