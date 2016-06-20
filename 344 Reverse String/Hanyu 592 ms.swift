//
//  Hanyu.swift
//  
//
//  Created by Hanyu on 2016/6/19.
//
//

import Foundation

class Solution {
    func reverseString(s: String) -> String {
        var reString: String = ""
        for i in s.characters {
            reString = "\(i)" + reString
        }
        return reString
    }
}