import Darwin

func minDistance(word1: String, _ word2: String) -> Int {
    if word1.isEmpty { return word2.characters.count }
    if word2.isEmpty { return word1.characters.count }
    var aw1 = Array(word1.characters)
    var aw2 = Array(word2.characters)
    let l1 = aw1.count
    let l2 = aw2.count
    var count = Array(count: l1+1, repeatedValue: Array(count: l2+1, repeatedValue: 0))
    for i in 0...l1 { count[i][0] = i }
    for j in 1...l2 { count[0][j] = j }
    for i in 1...l1 {
        for j in 1...l2 {
            if aw1[i-1] == aw2[j-1] {
                count[i][j] = count[i-1][j-1]
            }else {
                count[i][j] = min(count[i-1][j-1], count[i][j-1], count[i-1][j]) + 1
            }
        }
    }
    return count[l1][l2]
}

var a = "rabpt"

var b = "habbot"


minDistance(a,b)