import sys

def add(a, b):
	return a + b

def main():
    if len(sys.argv) >= 3:
        x, y = int(sys.argv[1]), int(sys.argv[2])
        print(add(x, y))

if __name__ == "__main__":
    print("Usage: python -m calc <arg1> <arg2>")
