class Solution {
    func majorityElement(nums: [Int]) -> Int {
        var dic:[Int:Int] = [:]
        var needAppearCount = Int(nums.count/2)
        for num in nums{
            if let count = dic[num]{
                dic[num] = count + 1
            }else{
                dic[num] = 1
            }
            if dic[num] > needAppearCount{
                return num
            }
        }
        return 0
    }
}