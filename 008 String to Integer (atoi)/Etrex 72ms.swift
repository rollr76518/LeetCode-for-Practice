//
//  Solution.swift
//  leetcode008
//
//  Created by etrex kuo on 2016/6/20.
//  Copyright © 2016年 etrex. All rights reserved.
//

import UIKit

class Solution {
    func myAtoi(str:String)->Int{
        var s = str
        var startIndex = 0
        var sign:Character?
        
        //去除空白
        for c in s.characters{
            if c == " " || c == "0"{
                startIndex++
            }else{
                //取得符號
                if c == "+" || c == "-"{
                    startIndex++
                    sign = c
                }
                break
            }
        }
        s.removeRange(Range<String.Index>(start:s.startIndex, end:s.startIndex.advancedBy(startIndex)))
        
        //移除非數字
        let nonNumberSet = NSCharacterSet(charactersInString: "0123456789").invertedSet
        let range = s.rangeOfCharacterFromSet(nonNumberSet)
        if let range = range{
            s.removeRange(Range<String.Index>(start:range.startIndex, end:s.endIndex))
        }
        
        //移除開頭的0
        startIndex = 0
        for c in s.characters{
            if c == "0"{
                startIndex++
            }else{
                break
            }
        }
        s.removeRange(Range<String.Index>(start:s.startIndex, end:s.startIndex.advancedBy(startIndex)))
        
        if s.characters.count > 10{
            if sign == "-"{
                return -2147483648
            }else{
                return 2147483647
            }
        }
        
        if let sign = sign{
            s = String(sign) + s
        }
        let result = Int(s) ?? 0
        return max(min(result, 2147483647), -2147483648)
    }
}