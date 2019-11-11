//
//  Hanyu 28ms.swift
//  
//
//  Created by Ryan on 2019/11/11.
//

import Foundation

class Solution {
	func isPalindrome(_ s: String) -> Bool {
		let characters: [Character] = Array(s.lowercased())
		
		var lhs = 0
		var rhs = s.count - 1
				
		while lhs <= rhs {
			let lhsC = characters[lhs]
			let rhsC = characters[rhs]
			if !(lhsC.isLetter || lhsC.isNumber) {
				lhs = lhs + 1
			} else if !(rhsC.isLetter || rhsC.isNumber) {
				rhs = rhs - 1
			} else {
				if lhsC == rhsC {
					lhs = lhs + 1
					rhs = rhs - 1
				} else {
					return false
				}
			}
		}
		
		return true
	}
}
