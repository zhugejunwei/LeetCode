class Solution {
public:
    int addDigits(int num) {
        int j = 0;
        if(num<10) return num;
        while(num > 0)
        {
            int i = num%10;
            num = num/10;
            j += i;
            if(j>9 && num == 0)
            {
                num = j;
                j = 0;
            }
        }
        return j;
    }
};