class Solution {
    func getSum(a: Int, _ b: Int) -> Int {
        var and = a & b
        if (and != 0){
            return getSum(a^b , and << 1)
        }
        return a^b
    }
}