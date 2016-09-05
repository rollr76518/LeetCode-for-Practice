class Solution {
    func isAnagram(s: String, _ t: String) -> Bool {
        let dics = charCountAnalysis(NSString(string:s))
        let dict = charCountAnalysis(NSString(string:t))
        return dics == dict
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
