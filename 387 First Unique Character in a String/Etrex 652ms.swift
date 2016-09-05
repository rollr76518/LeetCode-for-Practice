
class Solution {
    func firstUniqChar(s: String) -> Int {
        let ns = NSString(string: s)
        let length = ns.length
        let cstr = UnsafePointer<CChar>(ns.UTF8String)
        var charCount = charCountAnalysis(ns)
        for i in 0..<length{
            let char = cstr[i]
            if charCount[char] == 1{
                return i
            }
        }
        return -1
    }
    func charCountAnalysis(ns:NSString)->[CChar:Int]{
        let length = ns.length
        let cstr = UnsafePointer<CChar>(ns.UTF8String)
        var dic = [CChar:Int]()
        for i in 0..<length{
            let char = cstr[i]
            if let count = dic[char]{
                dic[char] = count + 1
            }else{
                dic[char] = 1
            }
        }
        return dic
    }
}