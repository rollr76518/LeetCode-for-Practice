//
//  258. Add Digits_Hanyu.swift
//  
//
//  Created by Hanyu on 2016/6/19.
//
//

import Foundation

class Solution {
    func addDigits(num: Int) -> Int {
        let ones:Int = Solution().toOnes(num)
        return ones
    }
    
    func toOnes(num:Int) -> Int {
        var rightNumber:Int = 0
        
        if num >= 10 {
            let string = String(num)
            var tempNumber = 0
            for c in string.characters {
                tempNumber += Int(String(c))!
            }
            rightNumber = tempNumber
        }else {
            rightNumber = num
        }
        
        if rightNumber >= 10 {
            rightNumber = Solution().toOnes(rightNumber)
        }
        
        return rightNumber
    }
}