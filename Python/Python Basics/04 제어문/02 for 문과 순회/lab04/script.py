d = {"x":1, "y":2}

# key만 순회
for k in d:
	print(k, end=" ")

print()
print("-" * 10)

# 명시적 keys()
for k in d.keys():
	print(k)

print("-" * 10)

# values 순회
for v in d.values():
	print(v)

print("-" * 10)

# key, value 동시 순회
for k, v in d.items():
	print(k, v)