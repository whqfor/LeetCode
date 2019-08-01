/*
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 示例：
 
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func addTwoNumbers(l1: ListNode?, l2: ListNode?) -> ListNode? {
        
        var carry = 0
        var sum = 0
        var l1 = l1
        var l2 = l2
        var node = ListNode(0)
        let result = node
        
        
        while l1 != nil || l2 != nil || carry != 0 {
            
            if l1 != nil {
                sum += l1!.val
                l1 = l1!.next
            }
            if l2 != nil {
                sum += l2!.val
                l2 = l2!.next
            }
            
            carry = sum / 10
            sum = sum % 10
            
            node.next = ListNode(sum)
            node = node.next!
            
            sum = carry
        }
        
        return result.next
    }
}

/*
 执行用时 : 64 ms , 在所有 Swift 提交中击败了 93.17% 的用户
 内存消耗 : 20.6 MB , 在所有 Swift 提交中击败了 5.14% 的用户
 *
