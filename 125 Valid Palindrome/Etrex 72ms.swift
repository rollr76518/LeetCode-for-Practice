class Solution {
    static var dic:[CChar:CChar] = {
        let uppercase = NSString(string:"ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let lowercase = NSString(string:"abcdefghijklmnopqrstuvwxyz")
        let uppercaseCstr = UnsafePointer<CChar>(uppercase.UTF8String)
        let lowercaseCstr = UnsafePointer<CChar>(lowercase.UTF8String)
        var d:[CChar:CChar] = [:]
        for i in 0..<26 {
            d[uppercaseCstr[i]] = lowercaseCstr[i]
            d[lowercaseCstr[i]] = lowercaseCstr[i]
        }
        let numbers = NSString(string:"1234567890")
        let numbersCstr = UnsafePointer<CChar>(numbers.UTF8String)
        for i in 0..<10{
            d[numbersCstr[i]] = numbersCstr[i]
        }
        return d
    }()
    func isPalindrome(s: String) -> Bool {
        let ns = NSString(string:s)
        let length = ns.length
        let cstr = UnsafePointer<CChar>(ns.UTF8String)
        var leftIndex = 0
        var leftChar:Int8? = Solution.dic[cstr[leftIndex]]
        var rightIndex = length - 1
        var rightChar:Int8? = Solution.dic[cstr[rightIndex]]
        while(leftIndex <= rightIndex){
            while leftChar == nil && leftIndex < length{
                leftIndex += 1
                leftChar = Solution.dic[cstr[leftIndex]]
            }
            while rightChar == nil && rightIndex >= 0{
                rightIndex -= 1
                rightChar = Solution.dic[cstr[rightIndex]]
            }
            if leftChar == rightChar{
                leftIndex += 1
                leftChar = Solution.dic[cstr[leftIndex]]
                rightIndex -= 1
                rightChar = Solution.dic[cstr[rightIndex]]
            }else{
                return false
            }
        }
        return true
    }
}
