//
//  Dean_60ms.swift
//  MyLeetCode
//
//  Created by dean on 2016/6/20.
//  Copyright © 2016年 test. All rights reserved.
//

import Foundation

class Solution {
    var procStr = ""
    var isShowNum = false
    var isNegative = false
    var isDecideSign = false
    
    func myAtoi(str: String) -> Int {
        
        for char in str.characters {
            
            if let num = Int("\(char)") {
                procStr += "\(char)"
                self.isShowNum = true
            } else {
                if !self.isShowNum {
                    let charStr = "\(char)"
                    if (charStr == "+" || charStr == "-") && !self.isDecideSign {
                        self.isNegative = (charStr == "-")
                        self.isDecideSign = true
                    } else if (charStr == " " && !self.isDecideSign) {
                        
                    } else {
                        break
                    }
                } else {
                    break
                }
            }
        }
        
        // check large than 64bit
        if self.procStr.characters.count == 10 {
            if self.isNegative {
                if self.procStr > "2147483648" {
                    self.procStr = "2147483648"
                }
            } else {
                if self.procStr > "2147483647" {
                    self.procStr = "2147483647"
                }
            }
        } else if self.procStr.characters.count > 10 {
            if self.isNegative {
                self.procStr = "2147483648"
            } else {
                self.procStr = "2147483647"
            }
        }
        
        // process sign
        if self.isNegative {
            self.procStr = "-\(self.procStr)"
        }
        
        // check larde than 32bit
        if let num = Int("\(self.procStr)") {
            if num > 2147483647 {
                return 2147483647
            } else if num < -2147483648 {
                return -2147483648
            }
            return num
        }
        
        return 0
    }
}