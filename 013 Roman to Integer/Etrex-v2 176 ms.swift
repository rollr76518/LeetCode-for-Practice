//
//  Solution2.swift
//  leetcode013
//
//  Created by 郭佳甯 on 2016/6/19.
//  Copyright © 2016年 郭佳甯. All rights reserved.
//

import UIKit

class Solution2 {
    static let romanValue = [
        "":0,
        "I":1,
        "II":2,
        "III":3,
        "IV":4,
        "V":5,
        "VI":6,
        "VII":7,
        "VIII":8,
        "IX":9,
        "X":10,
        "XX":20,
        "XXX":30,
        "XL":40,
        "L":50,
        "LX":60,
        "LXX":70,
        "LXXX":80,
        "XC":90,
        "C":100,
        "CC":200,
        "CCC":300,
        "CD":400,
        "D":500,
        "DC":600,
        "DCC":700,
        "DCCC":800,
        "CM":900,
        "M":1000,
        "MM":2000,
        "MMM":3000
    ]
    
    static let romanPriority:[Character:Int] = [
        "M":3,
        "C":2,
        "D":2,
        "X":1,
        "L":1,
        "I":0,
        "V":0
    ]
    
    func romanToInt(s: String) -> Int {
        var currentPriority = 3
        var temp = ""
        var result = 0
        for char in s.characters{
            let priority = Solution2.romanPriority[char]!
            if currentPriority > priority{
                currentPriority = priority
                result += Solution2.romanValue[temp]!
                temp = ""
            }
            temp = "\(temp)\(char)"
        }
        result += Solution2.romanValue[temp]!
        return result
    }
}
