//
//  Dean_24ms.swift
//  MyLeetCode
//
//  Created by dean on 2016/6/20.
//  Copyright © 2016年 test. All rights reserved.
//

import Foundation

class Solution {
    func addDigits(num: Int) -> Int {
        if num % 9 != 0 {
            return num%9
        } else if num != 0 {
            return 9
        } else {
            return 0
        }
    }
}