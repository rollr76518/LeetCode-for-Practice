//
//  Solution.swift
//  leetcode344
//
//  Created by 郭佳甯 on 2016/6/20.
//  Copyright © 2016年 郭佳甯. All rights reserved.
//

import UIKit

class Solution {
    func reverseString(s: String) -> String {
        let length = s.characters.count-1
        let ns = NSString(string: s)
        let cstr = UnsafeMutablePointer<CChar>(ns.UTF8String)
        for i in 0...length/2{
            (cstr[i],cstr[length-i]) = (cstr[length-i],cstr[i])
        }
        return String.fromCString(cstr)!
    }
}

