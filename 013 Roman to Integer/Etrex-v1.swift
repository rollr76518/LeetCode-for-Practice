//
//  Solution.swift
//  leetcode013
//
//  Created by 郭佳甯 on 2016/6/19.
//  Copyright © 2016年 郭佳甯. All rights reserved.
//

import UIKit

class Solution {
    static let romanDigitTable = [
        ["","I","II","III","IV","V","VI","VII","VIII","IX"],
        ["","X","XX","XXX","XL","L","LX","LXX","LXXX","XC"],
        ["","C","CC","CCC","CD","D","DC","DCC","DCCC","CM"],
        ["","M","MM","MMM"]
    ]
    
    static func IntToRoman(i:Int)->String{
        //"123"
        let inputStr = "\(i)"
        //[1,2,3]
        let inputDigits = inputStr.characters.map{ Int(String($0))! }
        //["C","XX","III"]
        let outputDigits = inputDigits.enumerate().map{ (index, Digits) in
            return romanDigitTable[inputDigits.count - 1 - index][Digits]
        }
        //"CXXIII"
        return outputDigits.reduce("") { "\($0)\($1)" }
    }

    
// 176 ms
//    static var romanToIntTable : [String:Int] = {
//        var dic:[String:Int] = [:]
//        for i in 1...3999{
//            dic[Solution.IntToRoman(i)] = i
//        }
//        return dic
//    }()
    
    func romanToInt(s: String) -> Int {
        return Solution.romanToIntTable[s] ?? 0
    }

    
// 108 ms
//    static var romanToIntTable : [String:Int] = {
//        var RtoITable:[String:Int] = [:]
//        var itoRTable:[Int:String] = [:]
//        
//        //個位數
//        for i in 0...9{
//            let roman = romanDigitTable[0][i]
//            RtoITable[roman] = i
//            itoRTable[i] = roman
//            print("\(i) : \(roman)")
//        }
//        
//        //十位數
//        for part1 in 1...9{
//            let part1Roman = romanDigitTable[1][part1]
//            for part2 in 0...9{
//                let part2Roman = itoRTable[part2]!
//                let roman = "\(part1Roman)\(part2Roman)"
//                let i = part1 * 10 + part2
//                RtoITable[roman] = i
//                itoRTable[i] = roman
//                print("\(i) : \(roman)")
//            }
//        }
//        
//        //百位數
//        for part1 in 1...9{
//            let part1Roman = romanDigitTable[2][part1]
//            for part2 in 0...99{
//                let part2Roman = itoRTable[part2]!
//                let roman = "\(part1Roman)\(part2Roman)"
//                let i = part1 * 100 + part2
//                RtoITable[roman] = i
//                itoRTable[i] = roman
//                print("\(i) : \(roman)")
//            }
//        }
//        
//        //千位數
//        for part1 in 1...3{
//            let part1Roman = romanDigitTable[3][part1]
//            for part2 in 0...999{
//                let part2Roman = itoRTable[part2]!
//                let roman = "\(part1Roman)\(part2Roman)"
//                let i = part1 * 1000 + part2
//                RtoITable[roman] = i
//                itoRTable[i] = roman
//                print("\(i) : \(roman)")
//            }
//        }
//        
//        return RtoITable
//    }()
    
    static var romanToIntTable : [String:Int] = {
        var RtoITable:[String:Int] = ["":0]
        var itoRTable:[Int:String] = [0:""]
        var part1=0
        var part2=0
        var part1Roman=""
        var part2Roman=""
        
        for i in 1...3999{
            if i < 10{
                part1 = i
                part2 = 0
                part1Roman = romanDigitTable[0][part1]
            }else if i < 100{
                part1 = i/10
                part2 = i%10
                part1Roman = romanDigitTable[1][part1]
            }else if i < 1000{
                part1 = i/100
                part2 = i%100
                part1Roman = romanDigitTable[2][part1]
            }else{
                part1 = i/1000
                part2 = i%1000
                part1Roman = romanDigitTable[3][part1]
            }
            part2Roman = itoRTable[part2]!
            let roman = "\(part1Roman)\(part2Roman)"
            RtoITable[roman] = i
            itoRTable[i] = roman
            //print("\(i) : \(roman)")
        }
        return RtoITable
    }()
    
}



