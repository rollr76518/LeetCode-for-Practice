class Solution {
    static let wordNumber:[Character:Int]=[
        "A":1,
        "B":2,
        "C":3,
        "D":4,
        "E":5,
        "F":6,
        "G":7,
        "H":8,
        "I":9,
        "J":10,
        "K":11,
        "L":12,
        "M":13,
        "N":14,
        "O":15,
        "P":16,
        "Q":17,
        "R":18,
        "S":19,
        "T":20,
        "U":21,
        "V":22,
        "W":23,
        "X":24,
        "Y":25,
        "Z":26]
    func titleToNumber(s: String) -> Int {
        let wordNumbers =  Array(s.characters).map{Solution.wordNumber[$0] ?? 0}
        var sum = 0
        for (index, value) in wordNumbers.reverse().enumerate(){
            sum += value * power(26,index)
        }
        return sum
    }
    
    func power(a:Int, _ b:Int)->Int{
        var s = 1
        var bb = b
        while (bb > 0) {
            s *= a
            bb -= 1
        }
        return s
    }
}