//
//  Hanyu 216ms.swift
//  
//
//  Created by Ryan on 2019/11/11.
//

import Foundation

class Solution {
		func validPalindrome(_ s: String) -> Bool {
		var canPass = true
		
        let characters: [Character] = Array(s)

        var lhs = 0
        var rhs = characters.count - 1
                
        while lhs < rhs {
            let lhsChar = characters[lhs]
            let rhsChar = characters[rhs]
			
			if !(lhsChar.isLetter || lhsChar.isNumber) {
                lhs += 1
            } else if !(rhsChar.isLetter || rhsChar.isNumber) {
                rhs -= 1
            } else {
                if lhsChar == rhsChar {
                    lhs += 1
                    rhs -= 1
				} else if canPass {
					canPass = false
					var tempLhs = lhs
					var tempRhs = rhs
					
					while tempLhs + 1 < tempRhs - 1, lhsChar == characters[tempRhs-1] && rhsChar == characters[tempLhs+1] {
						tempLhs += 1
						tempRhs -= 1
					}
					
					if tempLhs - tempRhs == -1 { //相鄰的意思
						return true
					} else if tempLhs + 1 == tempRhs - 1 { //位移後是同一個 index
						if characters[tempLhs] == characters[tempRhs-1] || characters[tempRhs] == characters[tempLhs+1] {
							return true
						} else {
							return false
						}
					} else {
						if characters[tempLhs] == characters[tempRhs-1] && characters[tempRhs] != characters[tempLhs+1] {
							rhs -= 1
						} else {
							lhs += 1
						}
					}
				} else {
					return false
				}
            }
        }
        
        return true
    }
}
