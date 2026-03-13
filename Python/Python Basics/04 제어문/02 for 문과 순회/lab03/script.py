# range 기본 사용
for i in range(0, 6, 2):
	print(i, end=" ")
	
print()
print("-" * 10)

names = ["a", "b", "c"]
for idx, name in enumerate(names):
	print(idx, name)

print("-" * 10)

# 시작 index 지정
for idx, name in enumerate(names, start=10):
	print(idx, name)