// Forward declaration of guess API.
// @param num, your guess
// @return -1 if my number is lower, 1 if my number is higher, otherwise return 0
int guess(int num);

class Solution {
public:
    int guessNumber(int n) {
        int myNum = (1+n) >> 1;
        int step = myNum;
        int t = 0;
        do {
            t = guess(myNum);
            step = step >> 1 ? step >> 1 : 1;
            myNum += step*t;
        }while (t != 0);
        
        return myNum;
    }
};