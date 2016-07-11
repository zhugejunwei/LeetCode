import Darwin

func reverseString(s: String) -> String {
    if s.isEmpty {
        return ""
    }
    var myS: String = String(s[s.endIndex.predecessor()])
    var i = s.endIndex.predecessor()
    while i > s.startIndex {
        let cur = s[i.predecessor()]
        myS.append(cur)
        i = i.predecessor()
    }
    return myS
}

