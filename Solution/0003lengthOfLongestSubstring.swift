/*
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 
 示例 1:
 
 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:
 
 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:
 
 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
           请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

// 解法1
//class Solution {
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//
//        var currentLen = 0
//        var maxLen = 0
//        var window = [Character]()
//        var index = 0
//
//        for char in s {
//            currentLen += 1
//            while window.contains(char) {
//                window.removeFirst()
//                index += 1
//                currentLen -= 1
//            }
//
//            maxLen = max(maxLen, currentLen)
//            window.append(char)
//        }
//        return maxLen
//    }
//}
/**
 执行用时 : 812 ms , 在所有 Swift 提交中击败了 9.35% 的用户
 内存消耗 : 21.1 MB , 在所有 Swift 提交中击败了 5.06% 的用户
 */


// 解法2
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var cache:[Character: Int] = [:]
        
        var i = 0
        var j = 0
        var ans = 0
        let length = s.count
        
        for char in s {
            if let chcheVal = cache[char] {
                i = max(i, chcheVal)
            }
            j += 1
            ans = max(ans, j - i)
            cache[char] = j
            if length - ans < i {
                break
            }
        }
        return ans
    }
}

/**
 执行用时 : 44 ms , 在所有 Swift 提交中击败了 94.29% 的用户
 内存消耗 : 20.8 MB , 在所有 Swift 提交中击败了 5.06% 的用户
 */
