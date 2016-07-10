import Darwin

func isMatch(s: String, _ p: String) -> Bool {
    if p.isEmpty {
        return s.isEmpty
    }
    var ms = Array(s.characters)
    var mp = Array(p.characters)
    if ms.isEmpty && !mp.isEmpty {
        while mp.contains("*") {
            let index = mp.indexOf("*")!
            mp.removeAtIndex(index)
            mp.removeAtIndex(index-1)
        }
        return mp.isEmpty
    }
    let ls = ms.count
    let lp = mp.count
    var bool = Array(count: ls + 1, repeatedValue: Array(count: lp + 1, repeatedValue: false))
    bool[0][0] = true
    if lp >= 2 {
        for j in 2...lp {
            bool[0][j] = mp[j-1] == "*" && bool[0][j-2]
        }
        for i in 1...ls {
            for j in 1...lp {
                if mp[j-1] != "*" {
                    bool[i][j] = bool[i-1][j-1] && (ms[i-1] == mp[j-1] || mp[j-1] == ".")
                }else {
                    bool[i][j] = bool[i][j-1] || bool[i][j-2] || (bool[i-1][j] && (ms[i-1] == mp[j-2] || mp[j-2] == "."))
                }
            }
        }
    }else {
        if (mp[0] == "*" || mp[0] == "." || mp[0] == ms[0]) && ms.count == 1 { return true }
        else { return false }
    }
    return bool[ls][lp]
}

var a = ""
var b = ".*a*"

isMatch(a,b)





