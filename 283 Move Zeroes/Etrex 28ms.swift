class Solution {
    func moveZeroes(inout nums: [Int]) {
        var zeroCount = 0
        for i in 0..<nums.count{
            if(nums[i] == 0){
                zeroCount = zeroCount + 1
            }else if(zeroCount > 0){
                nums[i-zeroCount] = nums[i]
                nums[i] = 0
            }
        }
    }
}