//
//  Solution2.swift
//  leetcode036
//
//  Created by 郭佳甯 on 2016/5/28.
//  Copyright © 2016年 郭佳甯. All rights reserved.
//

import UIKit

class SudokuRule{
    static let box:[(Int,Int)] = {
        var b:[(Int,Int)] = []
        for x in 0..<3{
            for y in 0..<3{
                b.append((x,y))
            }
        }
        return b
    }()

    class func boxTranslation(box:[(Int,Int)],x:Int,y:Int)->[(Int,Int)]{
        return box.map{ return ($0.0+x, $0.1+y) }
    }

    static let checkRules:[[(Int,Int)]] = {
        var rules:[[(Int,Int)]] = []
        
        //rows and columns
        for i in 0..<9{
            var rowRule:[(Int,Int)] = []
            var columnRule:[(Int,Int)] = []
            for j in 0..<9{
                rowRule.append((i,j))
                columnRule.append((j,i))
            }
            rules.append(rowRule)
            rules.append(columnRule)
        }
        
        //boxs
        for x in 0..<3{
            for y in 0..<3{
                rules.append(SudokuRule.boxTranslation(box, x: x*3, y: y*3))
            }
        }
        
        return rules
    }()
    
    
}

class Solution3{
    func isValidSudoku(board: [[Character]]) -> Bool {
        for rule in SudokuRule.checkRules{
            if checkDuplicate(board, rule:rule) == false{
                return false
            }
        }
        return true
    }
    
    func checkDuplicate(board:[[Character]], rule:[(Int,Int)])->Bool{
        var dic = [Character:Bool]()
        for (x,y) in rule{
            let c = board[x][y]
            if c == "." {
                continue
            }
            if dic[c] ?? false {
                return false
            }else{
                dic[c] = true
            }
        }
        return true
    }
}
