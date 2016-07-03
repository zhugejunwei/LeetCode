import Darwin

// Solution 1: O(n*sizeof(integer))

//func countBits(num: Int) -> [Int] {
//    var record = [Int]()
//    var myNum = num
//    var count = 0
//    for i in 0...num {
//        count = 0
//        myNum = i
//        while myNum > 0 {
//            let tail = myNum % 2
//            myNum = myNum / 2
//            if tail == 1 {
//                count += 1
//            }
//        }
//        record.append(count)
//    }
//    return record
//}


// Solution 2: O(n)

func countBits(num: Int) -> [Int] {
    if num == 0 {
        return [0]
    }
    var count = [0,1]
    var i = 2
    while i <= num {
        let n1 = i >> 1
        let n2 = i % 2
        count.append(count[n1] + count[n2])
        i += 1
    }
    return count
}

countBits(2)