import ast

source = """
def add(a, b):
  r =  a + b
  return r
"""

# tokenize & parse
ast_node = ast.parse(source)

# compile
code = compile(ast_node, "<snippet>", "exec")

print(code.co_consts[0].co_varnames)

# vm 실행
namespace = {}
exec(code, namespace)
add = namespace['add']

print(add(10, 20))
print(add.__code__.co_varnames)
print(add.__code__.co_stacksize)
print(add.__code__.co_code)

# 다음 과정과 완전 동일
def add02(a, b):
  r =  a + b
  return r

print(add02(10, 20))
print(add02.__code__.co_varnames)
print(add02.__code__.co_stacksize)
print(add02.__code__.co_code)

