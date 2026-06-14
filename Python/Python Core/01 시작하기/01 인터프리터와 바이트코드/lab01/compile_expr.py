import dis

expr = "x = 1 + 2"
code = compile(expr, "<snippet>", "exec")

print(code.co_varnames)
print(code.co_stacksize)
print(code.co_code)
