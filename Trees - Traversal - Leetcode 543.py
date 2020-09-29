
############################################################################
#############Leet code 543 - DIAMETER OF BINARY TREE########################
############################################################################


global globalDia
class Node:
    def __init__(self, key):
        self.left = None
        self.right = None
        self.val = key

# A function to do preorder tree traversal
def dfs(node):
    myDia,lh,rh = 0,0,0
    global globalDia

    #Base case
    if node.left is None and node.right is None:
        return 0

    #Recursive case
    if node.left is not None:
        # Then recur on left child
        lh = dfs(node.left)
        myDia += lh+1

    if node.right is not None:
        # Finally recur on right child
        rh = dfs(node.right)
        myDia += rh+1
    globalDia = max(globalDia,myDia)
    return max(lh,rh)+1


def overall(root):
    global globalDia
    if root is None:
        return 0
    globalDia =0
    dfs(root)
    return globalDia


# Driver code
root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left.left = Node(4)
root.left.right = Node(5)
print(overall(root))

