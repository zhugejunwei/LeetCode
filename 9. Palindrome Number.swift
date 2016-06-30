import UIKit


class Solution {
    func isPalindrome(x: Int) -> Bool {
        if (x < 0 || (x != 0 && x % 10 == 0)) {
            return false
        }else if (x > 0 && x < 10) {
            return true
        }else {
            var half = 0
            var myX = x
            while (myX > half) {
                half = half * 10 + myX % 10
                myX /= 10
            }
            if (myX == half || half / 10 == myX){
                return true
            }
        }
        return false
    }
}
