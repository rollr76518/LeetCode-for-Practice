class Solution {
    func canConstruct(ransomNote: String, _ magazine: String) -> Bool {
        let ransomNoteCharCount = charCountAnalysis(NSString(string:ransomNote))
        let magazineCharCount = charCountAnalysis(NSString(string:magazine))
        for (char, count) in ransomNoteCharCount{
            let magazineCount = magazineCharCount[char] ?? 0
            if(count > magazineCount){
                return false
            }
        }
        return true
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
