
############################################################################
###############Leet code 113 - PATH SUM II #################################
############################################################################


# Python base program to for tree traversals
# A class that represents an individual node in a
# Binary Tree

globalbox =[]
class Node:
    def __init__(self, key):
        self.left = None
        self.right = None
        self.val = key

# A function to do preorder tree traversal
def dfs(node,target,slate):
    global globalbox

    #Base case:Leaf node
    if node.left is None and node.right is None:
        if target==node.val:
            slate.append(node.val)
            #print('solutionFound = True')
            globalbox.append(slate[:])
            slate.pop()
            return

    #Recursive case: Internal nodes
    slate.append(node.val)
    if node.left is not None:
        # Then recur on left child
        dfs(node.left, target-node.val,slate)

    if node.right is not None:
        # Finally recur on right child
        dfs(node.right,target-node.val,slate)
    slate.pop()


def overall(root):
    if root is None:
        return False
    global globalbox
    globalbox =[]
    dfs(root,22,[])
    return globalbox

# Driver code
root = Node(5)
root.left = Node(4)
root.right = Node(8)
root.left.left = Node(11)
root.left.left.left= Node(7)
root.left.left.right= Node(2)
root.right.left = Node(13)
root.right.right = Node(4)
root.right.right.left = Node(5)
root.right.right.right = Node(1)


print(overall(root))
