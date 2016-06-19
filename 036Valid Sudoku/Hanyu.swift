//
//  36. Valid Sudoku_Hanyu.swift
//  
//
//  Created by Ryan on 2016/6/19.
//
//

import Foundation

class Solution {
    func isValidSudoku(board: [[Character]]) -> Bool {
        
        //檢查同一個 橫排是否重覆
        for matrix:[Character] in board {
            var temp:Array<Character> = []
            for number in matrix {
                if number == "." {
                    continue
                }
                if !temp.contains(number) {
                    temp.append(number)
                }else {
                    return false
                }
                
            }
        }
        
        //檢查同一個 直排是否重覆
        for h:Int in 0...8 {
            var temp:Array<Character> = []
            for v:Int in 0...8 {
                if board[v][h] == "." {
                    continue
                }
                if !temp.contains(board[v][h]) {
                    temp.append(board[v][h])
                    print(temp)
                    
                }else {
                    return false
                }
                
            }
        }
        
        //檢查同一個 matrix 裡面是否重覆
        //        00, 01, 02    03, 04, 05  06, 07, 08
        //        10, 11, 12    13, 14, 15  16, 17, 18
        //        20, 21, 22    23, 24, 25  26, 27, 28
        //
        //        30, 31, 32
        //        40, 41, 42
        //        50, 51, 52
        //
        //        60, 61, 62
        //        70, 71, 72
        //        80, 81, 82
        var temp:Array<Character> = []
        var temp1:Array<Character> = []
        var temp2:Array<Character> = []
        for h in 0...2 {
            for v in 0...2 {
                if board[h][v] == "." {
                    continue
                }
                if !temp.contains(board[h][v]) {
                    temp.append(board[h][v])
                }else {
                    return false
                }
            }
            
            for v in 3...5 {
                if board[h][v] == "." {
                    continue
                }
                if !temp1.contains(board[h][v]) {
                    temp1.append(board[h][v])
                }else {
                    return false
                }
            }
            
            for v in 6...8 {
                if board[h][v] == "." {
                    continue
                }
                if !temp2.contains(board[h][v]) {
                    temp2.append(board[h][v])
                }else {
                    return false
                }
            }
        }
        //-----------------3~5-------------------------------
        var temp4:Array<Character> = []
        var temp5:Array<Character> = []
        var temp6:Array<Character> = []
        
        for h in 3...5 {
            for v in 0...2 {
                if board[h][v] == "." {
                    continue
                }
                if !temp4.contains(board[h][v]) {
                    temp4.append(board[h][v])
                }else {
                    return false
                }
            }
            
            for v in 3...5 {
                if board[h][v] == "." {
                    continue
                }
                if !temp5.contains(board[h][v]) {
                    temp5.append(board[h][v])
                }else {
                    return false
                }
            }
            
            for v in 6...8 {
                if board[h][v] == "." {
                    continue
                }
                if !temp6.contains(board[h][v]) {
                    temp6.append(board[h][v])
                }else {
                    return false
                }
            }
        }
        //-----------------6~8-------------------------------
        var temp7:Array<Character> = []
        var temp8:Array<Character> = []
        var temp9:Array<Character> = []
        
        for h in 6...8 {
            for v in 0...2 {
                if board[h][v] == "." {
                    continue
                }
                if !temp7.contains(board[h][v]) {
                    temp7.append(board[h][v])
                }else {
                    return false
                }
            }
            
            for v in 3...5 {
                if board[h][v] == "." {
                    continue
                }
                if !temp8.contains(board[h][v]) {
                    temp8.append(board[h][v])
                }else {
                    return false
                }
            }
            
            for v in 6...8 {
                if board[h][v] == "." {
                    continue
                }
                if !temp9.contains(board[h][v]) {
                    temp9.append(board[h][v])
                }else {
                    return false
                }
            }
        }
        
        
        return true
    }
}