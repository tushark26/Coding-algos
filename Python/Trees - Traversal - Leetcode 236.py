# -*- coding: utf-8 -*-
"""
Created on Tue Sep 29 13:44:10 2020

@author: tusha
"""


class Node(object):
    def __init__(self, data, left=None, right=None):
        self.data = data
        self.left = left
        self.right = right



def lca(node, a, b):
    #Edge case
    if node is None:
        return

    if node.data == a or node.data == b:
        return root

    # Look for keys in left and right subtrees
    left_lca = lca(node.left, a, b)
    right_lca = lca(node.right, a, b)

    # If both of the above calls return Non-NULL, then one key
    # is present in one subtree and other is present in another,
    # Which means this node is the LCA
    if left_lca and right_lca:
        return node

    # Otherwise check if left subtree or right subtree is LCA
    return left_lca if left_lca is not None else right_lca



root = Node(1,2,3)
root.left = Node(2,4,5)
root.right = Node(3,6,7)
root.left.left = Node(4)
root.left.right = Node(5,8,9)
root.right.left= Node(6)
root.right.right = Node(7)
root.left.right.left = Node(8)
root.left.right.right = Node(9)

print(lca(root,2,3).data)

