//
//  283. Move Zeroes_Hanyu.swift
//  
//
//  Created by Ryan on 2016/6/19.
//
//

import Foundation

func moveZeroes(inout nums: [Int]) {
    for number in nums{
        if number == 0 {
            if let index = nums.indexOf(number){
                nums.removeAtIndex(index)
                nums.append(0)
            }
        }
    }
}