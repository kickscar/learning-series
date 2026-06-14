import ast

expr = "x = 1 + 2"
tree = ast.parse(expr)

print(ast.dump(tree, indent=2 ))
