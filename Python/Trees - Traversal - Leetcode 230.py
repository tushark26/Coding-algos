# -*- coding: utf-8 -*-
"""
Created on Wed Sep 30 12:31:14 2020

@author: tushar
"""

def kth_smallest_element(root, k):

    # Count to iterate over elements
    # till we get the kth smallest number
    count = 0

    ksmall = -9999999999 # store the Kth smallest
    curr = root # to store the current node

    while curr != None:

        # Like Morris traversal if current does
        # not have left child rather than
        # printing as we did in inorder, we
        # will just increment the count as the
        # number will be in an increasing order
        if curr.left_ptr == None:
            count += 1

            # if count is equal to K then we
            # found the kth smallest, so store
            # it in ksmall
            if count == k:
                ksmall = curr.val

            # go to current's right child
            curr = curr.right_ptr
        else:

            # we create links to Inorder Successor
            # and count using these links
            pre = curr.left_ptr
            while (pre.right_ptr != None and
                   pre.right_ptr != curr):
                pre = pre.right_ptr

            # building links
            if pre.right_ptr == None:

                # link made to Inorder Successor
                pre.right_ptr = curr
                curr = curr.left_ptr

            # While breaking the links in so made
            # temporary threaded tree we will check
            # for the K smallest condition
            else:

                # Revert the changes made in if part
                # (break link from the Inorder Successor)
                pre.right_ptr = None

                count += 1

                # If count is equal to K then we
                # found the kth smallest and so
                # store it in ksmall
                if count == k:
                    ksmall = curr.val

                curr = curr.right_ptr
    return ksmall # return the found value