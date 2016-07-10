import Darwin

// First Method:

func numDecodings(s: String) -> Int {
    if s.isEmpty || s[s.startIndex] == "0" { return 0 }
    if s.characters.count == 1 { return 1 }
    var i = s.endIndex.predecessor()
    var count = 1
    while i > s.startIndex {
        if s[i] == "0" && s[i.predecessor()] != "2" && s[i.predecessor()] != "1" {
            return 0
        }else if s[i] == "0" && i.predecessor() != s.startIndex {
            i = i.predecessor().predecessor()
        }else if s[i] == "0" && i.predecessor() == s.startIndex {
            return count
        }else if s[i.predecessor()] == "1" || (s[i.predecessor()] == "2" && s[i] <= "6") {
            var tag = 2, ex = 1
            i = i.predecessor()
            print("out:\(tag)")
            while i > s.startIndex && (s[i.predecessor()] == "1" || (s[i.predecessor()] == "2" && s[i] <= "6")) {
                tag <<= 1
                tag -= ex
                if tag >= 5 { ex += 1 }
                i = i.predecessor()
                print(":\(tag)")
            }
            count *= tag
        }else {
            i = i.predecessor()
        }
    }
    return count
}


// Second Method: DP

func numDecodings(s: String) -> Int {
    if s.isEmpty || s[s.startIndex] == "0" { return 0 }
    if s.characters.count == 1 { return 1 }
    var count = 1, last = 1
    var i = s.startIndex.successor()
    while i < s.endIndex {
        var cur = 0
        if s[i] > "0" {
            cur += count
        }
        if s[i.predecessor()] == "1" || (s[i.predecessor()] == "2" && s[i] <= "6") {
            cur += last
        }
        last = count
        count = cur
        if last == 0 {
            return 0
        }
        i = i.successor()
    }
    return count
}

