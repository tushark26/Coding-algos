
############################################################################
###########Leet code 250 - COUNT UNIVALUES SUB TREES #######################
############################################################################

global globalcount
class Node:
    def __init__(self, key):
        self.left = None
        self.right = None
        self.val = key



# A function to do preorder tree traversal
def dfs(node):
    global globalcount
    #Base case
    if node.left is None and node.right is None:
        globalcount+=1
        return True

    #Recursive case
    amiunival = True
    if node.left is not None:
        BL = dfs(node.left)
        if BL is False or (node.val!=node.left.val):
            amiunival = False
    if node.right is not None:
        BR = dfs(node.right)
        if BR is False or (node.val!=node.right.val):
            amiunival = False
        if amiunival:
            globalcount+=1
    return amiunival



def overall(root):
    if root is None:
        return 0
    global globalcount
    globalcount =0
    dfs(root)
    return globalcount


# Driver code
root = Node(5)
root.left = Node(1)
root.right = Node(5)
root.left.left = Node(5)
root.left.right = Node(5)
root.right.right = Node(5)

print(overall(root))
