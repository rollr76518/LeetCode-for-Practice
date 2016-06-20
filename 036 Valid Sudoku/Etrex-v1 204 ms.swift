//
//  Solution.swift
//  leetcode036
//
//  Created by 郭佳甯 on 2016/5/28.
//  Copyright © 2016年 郭佳甯. All rights reserved.
//

import UIKit

class Solution {
    func isValidSudoku(board: [[Character]]) -> Bool {
        for rule in getCheckRules(board){
            if checkDuplicate(rule) == false{
                return false
            }
        }
        return true
    }
    
    func getCheckRules(board:[[Character]])->[[Character]]{
        var rules:[[Character]] = []
        
        //rows
        for row in board{
            rules.append(row)
        }
        
        //columns
        for y in 0..<9{
            var column:[Character] = []
            for x in 0..<9{
                column.append(board[x][y])
            }
            rules.append(column)
        }
        
        //box
        for x in 0..<3{
            for y in 0..<3{
                rules.append(getBox(x*3,startY:y*3,board: board))
            }
        }
        
        return rules
    }
    
    func getBox(startX:Int,startY:Int,board:[[Character]])->[Character]{
        var box:[Character] = []
        for x in startX..<(startX+3){
            for y in startY..<(startY+3){
                box.append(board[x][y])
            }
        }
        return box
    }
    
    func checkDuplicate(rule:[Character])->Bool{
        var dic = [Character:Bool]()
        for c in rule{
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


