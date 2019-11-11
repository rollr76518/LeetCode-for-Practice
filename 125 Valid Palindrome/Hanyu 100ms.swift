//
//  Hanyu 100ms.swift
//  
//
//  Created by Ryan on 2019/11/11.
//

import Foundation

class Solution {
	func isPalindrome(_ s: String) -> Bool {
		let characters = Array(s.lowercased())
		
		var lhs = 0
		var rhs = s.count - 1
		
		let characterSet = CharacterSet.alphanumerics
		
		while lhs <= rhs {
			let lhsC = String(characters[lhs])
			let rhsC = String(characters[rhs])
			if lhsC.rangeOfCharacter(from: characterSet) == nil {
				lhs = lhs + 1
			} else if rhsC.rangeOfCharacter(from: characterSet) == nil {
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
