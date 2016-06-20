//
//  217. Contains Duplicate_Hanyu.swift
//  
//
//  Created by Ryan on 2016/6/19.
//
//

import Foundation

class Solution {
    func containsDuplicate(nums: [Int]) -> Bool {
        let numsSet = Set(nums)
        
        if nums.count == numsSet.count {
            return false
        }else {
            return true
        }
    }
}