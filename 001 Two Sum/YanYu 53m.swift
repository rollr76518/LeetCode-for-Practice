//
//  YanYu 53m.swift
//  
//
//  Created by 賴彥宇 on 2018/10/18.
//

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:]
        for (index, number) in nums.enumerated() {
            let complement = target - number
            if let complementIndex = map[complement] {
                return [complementIndex, index]
            } else {
                map[number] = index
            }
        }
        return [0, 0]
    }
}
