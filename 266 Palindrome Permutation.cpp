//
//  main.cpp
//  
//
//  Created by 诸葛俊伟 on 2/9/16.
//  Copyright © 2016 诸葛俊伟. All rights reserved.
//

#include <iostream>
#include <string>
#include <bitset>

class Solution {
public:
    bool canPermutePalindrome(std::string s) {
        std::bitset<26> bs;
        for (auto ch:s)
            bs[ch - 'a'].flip();
        if (bs.count() <= 1)
            return 1;
        return 0;
    }
    
};

int main ()
{
    std::string str1 = "this";
    std::string str2 = "cocoa";
    Solution *s = new Solution;
    if(s -> canPermutePalindrome(str1))
        std::cout<< str1 << " is pp\n";
    if(s -> canPermutePalindrome(str2))
        std::cout<< str2 << " is pp\n";
    
}