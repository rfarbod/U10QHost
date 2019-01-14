//
//  StringExtensions.swift
//  Trivia
//
//  Created by TEST on 10/14/18.
//  Copyright © 2018 TEST. All rights reserved.
//

import Foundation

// regex swift check
extension String {
    func usernameMatches(_ regex: String) -> Bool {
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: self)
    }
}

extension Int {
    
    /**
     Converts the int digits to persian characters
     
     - returns: String of number with persian characters
     */
    var persianDigits: String {
        let number = NSNumber(value: self as Int)
        let formatter = NumberFormatter()
        let locale = Locale(identifier: "fa")
        formatter.locale = locale
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter.string(from: number)!
    }
}

extension String {
    
    var persianDigits: String {
        var newStr = self
        newStr = newStr.replacingOccurrences(of: "0", with: "۰")
        newStr = newStr.replacingOccurrences(of: "1", with: "۱")
        newStr = newStr.replacingOccurrences(of: "2", with: "۲")
        newStr = newStr.replacingOccurrences(of: "3", with: "۳")
        newStr = newStr.replacingOccurrences(of: "4", with: "۴")
        newStr = newStr.replacingOccurrences(of: "5", with: "۵")
        newStr = newStr.replacingOccurrences(of: "6", with: "۶")
        newStr = newStr.replacingOccurrences(of: "7", with: "۷")
        newStr = newStr.replacingOccurrences(of: "8", with: "۸")
        newStr = newStr.replacingOccurrences(of: "9", with: "۹")
        
        // arabic digits
        newStr = newStr.replacingOccurrences(of: "٠", with: "۰")
        newStr = newStr.replacingOccurrences(of: "١", with: "۱")
        newStr = newStr.replacingOccurrences(of: "٢", with: "۲")
        newStr = newStr.replacingOccurrences(of: "٣", with: "۳")
        newStr = newStr.replacingOccurrences(of: "٤", with: "۴")
        newStr = newStr.replacingOccurrences(of: "٥", with: "۵")
        newStr = newStr.replacingOccurrences(of: "٦", with: "۶")
        newStr = newStr.replacingOccurrences(of: "٧", with: "۷")
        newStr = newStr.replacingOccurrences(of: "٨", with: "۸")
        newStr = newStr.replacingOccurrences(of: "٩", with: "۹")
        
        return newStr
    }
    
    var persianChars: String {
        var newStr = persianDigits
        newStr = newStr.replacingOccurrences(of: "ي", with: "ی")
        newStr = newStr.replacingOccurrences(of: "ة", with: "ه")
        newStr = newStr.replacingOccurrences(of: "ك", with: "ک")
        return newStr
    }
    
    var englishDigits: String {
        var newStr = self
        
        // persian digits
        newStr = newStr.replacingOccurrences(of: "۰", with: "0")
        newStr = newStr.replacingOccurrences(of: "۱", with: "1")
        newStr = newStr.replacingOccurrences(of: "۲", with: "2")
        newStr = newStr.replacingOccurrences(of: "۳", with: "3")
        newStr = newStr.replacingOccurrences(of: "۴", with: "4")
        newStr = newStr.replacingOccurrences(of: "۵", with: "5")
        newStr = newStr.replacingOccurrences(of: "۶", with: "6")
        newStr = newStr.replacingOccurrences(of: "۷", with: "7")
        newStr = newStr.replacingOccurrences(of: "۸", with: "8")
        newStr = newStr.replacingOccurrences(of: "۹", with: "9")
        
        // arabic digits
        newStr = newStr.replacingOccurrences(of: "٠", with: "0")
        newStr = newStr.replacingOccurrences(of: "١", with: "1")
        newStr = newStr.replacingOccurrences(of: "٢", with: "2")
        newStr = newStr.replacingOccurrences(of: "٣", with: "3")
        newStr = newStr.replacingOccurrences(of: "٤", with: "4")
        newStr = newStr.replacingOccurrences(of: "٥", with: "5")
        newStr = newStr.replacingOccurrences(of: "٦", with: "6")
        newStr = newStr.replacingOccurrences(of: "٧", with: "7")
        newStr = newStr.replacingOccurrences(of: "٨", with: "8")
        newStr = newStr.replacingOccurrences(of: "٩", with: "9")
        
        return newStr
    }
}
