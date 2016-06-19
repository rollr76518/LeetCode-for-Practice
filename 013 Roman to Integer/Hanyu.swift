//
//  13. Roman to Integer_Hanyu.swift
//  
//
//  Created by Ryan on 2016/6/19.
//
//

import Foundation

class Solution {
    func romanToInt(s: String) -> Int {
        var number = 0
        var indexCount = 0
        for c in s.characters {
            indexCount = indexCount + 1
            if c == "I" {
                //如果是 I 就加1，如果遇到 V 在後面就加4，遇到 X 在後面就加9
                if indexCount < s.characters.count {
                    let index = s.startIndex.advancedBy(indexCount)
                    if s[index] == "V" {
                        number = number + 4
                        continue
                    }else if s[index] == "X" {
                        number = number + 9
                        continue
                    }
                }
                number = number + 1
                
            }else if c == "V" {
                //如果是 V 就加5，遇到 I 在前就不加
                let tempCount = indexCount - 2
                if tempCount >= 0 {
                    let index = s.startIndex.advancedBy(tempCount)
                    if s[index] == "I" {
                        continue
                    }
                }
                number = number + 5
                
            }else if c == "X" {
                //如果是 X 就加10
                //遇到 I 在前就不加
                let tempCount = indexCount - 2
                if tempCount >= 0 {
                    let index = s.startIndex.advancedBy(tempCount)
                    if s[index] == "I" {
                        continue
                    }
                }
                //遇到 L 在後，就加40，遇到 C 在後，就加 90
                if indexCount < s.characters.count {
                    let index = s.startIndex.advancedBy(indexCount)
                    if s[index] == "L" {
                        number = number + 40
                        continue
                    }else if s[index] == "C" {
                        number = number + 90
                        continue
                    }
                }
                number = number + 10
            }else if c == "L" {
                //如果是 L 就加50，遇到 X 在前就不加
                let tempCount = indexCount - 2
                if tempCount >= 0 {
                    let index = s.startIndex.advancedBy(tempCount)
                    if s[index] == "X" {
                        continue
                    }
                }
                number = number + 50
            }else if c == "C" {
                //如果是 C 就加100
                //如果遇到 X 在前就不加
                let tempCount = indexCount - 2
                if tempCount >= 0 {
                    let index = s.startIndex.advancedBy(tempCount)
                    if s[index] == "X" {
                        continue
                    }
                }
                //如果遇到 D 在後面就加400，遇到 M 在後面就加900
                if indexCount < s.characters.count {
                    let index = s.startIndex.advancedBy(indexCount)
                    if s[index] == "D" {
                        number = number + 400
                        continue
                    }else if s[index] == "M" {
                        number = number + 900
                        continue
                    }
                }
                
                number = number + 100
            }else if c == "D" {
                //如果是 D 就加500，遇到 C 在前就不加
                let tempCount = indexCount - 2
                if tempCount >= 0 {
                    let index = s.startIndex.advancedBy(tempCount)
                    if s[index] == "C" {
                        continue
                    }
                }
                number = number + 500
            }else if c == "M" {
                //如果是 M 就加 1000
                //如果遇到 C 就前就不加
                let tempCount = indexCount - 2
                if tempCount >= 0 {
                    let index = s.startIndex.advancedBy(tempCount)
                    if s[index] == "C" {
                        continue
                    }
                }
                number = number + 1000
            }
            
        }
        return number
    }
}