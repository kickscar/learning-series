data = [1,2,3]

# iterator 생성
it = iter(data)

print(next(it))
print(next(it))
print(next(it))

print("-" * 10)

# StopIteration 확인
it = iter(data)
while True:
	try:
		value = next(it)
		print(value)
	except StopIteration:
		print("반복 종료")
		break