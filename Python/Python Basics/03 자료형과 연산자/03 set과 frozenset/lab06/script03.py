fs = frozenset({1, 2, 3})

d = {fs:"ok"}
print(d[frozenset([1, 2, 3])])