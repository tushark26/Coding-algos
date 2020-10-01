# -*- coding: utf-8 -*-
"""
Created on Tue Sep 29 20:32:40 2020

@author: tusha
"""

class TreeNode():
    def __init__(self, val=None, left_ptr=None, right_ptr=None):
        self.val = val
        self.left_ptr = left_ptr
        self.right_ptr = right_ptr

def concatenate(leftList, rightList):

    # If either of the list is empty then return the other list
    if (leftList == None):
        return rightList
    if (rightList == None):
        return leftList

    # Store the last Node of left List
    leftLast = leftList.left_ptr

    # Store the last Node of right List
    rightLast = rightList.left_ptr

    # Connect the last node of Left List
    # with the first Node of the right List
    leftLast.right_ptr = rightList
    rightList.left_ptr = leftLast

    # Left of first node points to
    # the last node in the list
    leftList.left_ptr = rightLast

    # Right of last node refers to
    # the first node of the List
    rightLast.right_ptr = leftList

    return leftList



def BTtoLL(root):
    if (root == None):
        return None

    # Recursively convert left and
    # right subtrees
    left = BTtoLL(root.left_ptr)
    right = BTtoLL(root.right_ptr)

    # Make a circular linked list of single
    # node (or root). To do so, make the
    # right and left pointers of this node
    # point to itself
    root.left_ptr = root.right_ptr = root

    # Step 1 (concatenate the left list with the list with single node, i.e., current node)
    # Step 2 (concatenate the returned list with the right List)
    return concatenate(concatenate(left,root), right)



# Display Circular Link List
def displayCList(head):
    print("Circular Linked List is :")
    itr = head
    first = 1
    while (head != itr or first):
        print(itr.val, end = " ")
        itr = itr.right_ptr
        first = 0
    print()


if __name__ == '__main__':
    root = TreeNode(10)
    root.left_ptr = TreeNode(12)
    root.right_ptr = TreeNode(15)
    root.left_ptr.left_ptr = TreeNode(25)
    root.left_ptr.right_ptr = TreeNode(30)
    root.right_ptr.left_ptr = TreeNode(36)

    head = BTtoLL(root)
    displayCList(head)

