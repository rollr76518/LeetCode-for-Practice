//
//  Solution.swift
//  leetcode217
//
//  Created by 郭佳甯 on 2016/6/19.
//  Copyright © 2016年 郭佳甯. All rights reserved.
//

import UIKit

class Solution {
    func containsDuplicate(nums: [Int]) -> Bool {
        var dic = [Int:Bool]()
        
        for num in nums{
            if dic[num] ?? false {
                return true
            }else{
                dic[num] = true
            }
        }
        return false
    }
}

