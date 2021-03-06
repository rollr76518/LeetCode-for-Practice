//
//  Dean_112ms.swift
//  MyLeetCode
//
//  Created by dean on 2016/6/20.
//  Copyright © 2016年 test. All rights reserved.
//

import Foundation

class Solution {
    func containsDuplicate(nums: [Int]) -> Bool {
        var numSet: Set<Int> = []
        for num in nums {
            if numSet.contains(num) {
                return true
            } else {
                numSet.insert(num)
            }
        }
        return false
    }
}