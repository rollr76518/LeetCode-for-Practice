class Solution {
    func intersection(nums1: [Int], _ nums2: [Int]) -> [Int] {
        return [Int](Set(nums1).intersect(nums2))
    }
}