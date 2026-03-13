a = {"a": 1, "b": 1}
b = {"b": 2, "c": 3}

merged = a | b
print(merged)

# in-place 병합
merged |= {"d": 4}
print(merged)