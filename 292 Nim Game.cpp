//
//  main.cpp
//  292 Nim Game
//
//  Created by 诸葛俊伟 on 2/9/16.
//  Copyright © 2016 诸葛俊伟. All rights reserved.
//

#include <iostream>

class Solution
{
public:
    bool canWinNim(int n)
    {
        return (n & 0b11) != 0;
    }
};

int main()
{
    int a = 16;
    int b = 15;
    int c = 1;
    Solution s = *new Solution;
    if(!s.canWinNim(a))
        std::cout<<a<<" cannot win";
    std::cout<<std::endl;
    if(s.canWinNim(b))
        std::cout<<b<<" can win";
    std::cout<<std::endl;
    if(s.canWinNim(c))
        std::cout<<c<<" can win";
    std::cout<<std::endl;
}