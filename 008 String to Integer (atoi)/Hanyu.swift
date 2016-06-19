//
//  8. String to Integer (atoi)_Hanyu.swift
//  
//
//  Created by Ryan on 2016/6/19.
//
//

import Foundation

class Solution {
    
    func myAtoi(str: String) -> Int {
        let newStr = deleteSpace(str)
        if newStr == ""{
            return 0
        }else if isNumber(newStr) {
            return checkSign(newStr)
        }else {
            return 0
        }
    }
    
    func isNumber(str:String) -> Bool {
        var isNumber:Bool = false
        //        let regex = try! NSRegularExpression(pattern: "^[+-]?[0-9]+(.[0-9])?$", options: [.CaseInsensitive])
        let regex = try! NSRegularExpression(pattern: "^[+-]?[0-9]+(.*)$", options: [.CaseInsensitive])
        
        isNumber = regex.firstMatchInString(str, options: NSMatchingOptions.Anchored, range: NSMakeRange(0, str.characters.count)) != nil
        
        return isNumber
    }
    
    func checkSign(str:String) ->Int {
        var plusOrMinus: Bool = true
        var newString: String = str
        if newString.characters.first == "+" {
            plusOrMinus = true
            newString  = NSString(string: str).stringByReplacingCharactersInRange(NSMakeRange(0, 1), withString: "")
        }else if newString.characters.first == "-" {
            plusOrMinus = false
            newString = NSString(string: str).stringByReplacingCharactersInRange(NSMakeRange(0, 1), withString: "")
        }
        newString = deleteZero(newString)
        let myInt = toInt(newString, plusOrMinus: plusOrMinus)
        
        if plusOrMinus == false && myInt != Int.min{
            return -myInt
        }else {
            return myInt
        }
    }
    
    func toInt(str:String, plusOrMinus:Bool) -> Int {
        var myInt : Int = 0
        for character in str.characters {
            if isNumber(String(character)) {
                let myCharacter = String(character)
                if myInt > 2147483647/10 || (myInt == 2147483647/10 && Int(myCharacter) > 7){
                    if plusOrMinus == false {
                        myInt = 2147483648
                        return myInt
                    }else {
                        myInt = 2147483647
                        return myInt
                    }
                }
                myInt = myInt * 10 + Int(myCharacter)!
            }else {
                break
            }
        }
        myInt = checkInInt(myInt)
        return myInt
    }
    
    func checkInInt(myInt:Int) -> Int {
        if myInt < Int.min {
            print(Int.min)
            return Int.min
        }else if myInt > Int.max {
            print(Int.max)
            return Int.max
        }else {
            return myInt
        }
    }
    
    func deleteZero(str:String) -> String {
        if str.characters.first == "0"{
            let myStr = NSString(string: str).stringByReplacingCharactersInRange(NSMakeRange(0, 1), withString: "")
            return deleteZero(myStr)
        }else {
            return str
        }
    }
    
    func deleteSpace(str:String) -> String {
        if str.characters.first == " "{
            let myStr = NSString(string: str).stringByReplacingCharactersInRange(NSMakeRange(0, 1), withString: "")
            return deleteSpace(myStr)
        }else {
            return str
        }
        
    }
}