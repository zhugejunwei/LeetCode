//
//  main.cpp
//
//
//  Created by 诸葛俊伟 on 2/24/16.
//  Copyright © 2016 诸葛俊伟. All rights reserved.
//

/**
 * Definition for an interval.
 * struct Interval {
 *     int start;
 *     int end;
 *     Interval() : start(0), end(0) {}
 *     Interval(int s, int e) : start(s), end(e) {}
 * };
 */
class Solution {
public:
    static bool comp(Interval a, Interval b)
    {
        return a.start < b.start;
    }
    vector<Interval> merge(vector<Interval>& intervals) {
        vector<Interval> interval2;
        sort(intervals.begin(), intervals.end(), comp);
        for(auto i:intervals)
        {
            if(interval2.empty() || interval2.back().end < i.start)
                interval2.push_back(i);
            else
                interval2.back().end = max(interval2.back().end, i.end);
        }
        return interval2;
    }
};
