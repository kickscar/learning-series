from pathlib import Path
import sys
import runpy

# lab17 디렉토리를 path에 추가
sys.path.insert(0, Path(__file__).resolve().parent)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python run_main.py <package_name> [args...]")
        sys.exit(1)

    # 실행 모듈(run_main.py) 이름을 제외한 인자들을 sys.argv에 저장
    sys.argv = sys.argv[1:];

    # 첫 번째 인자로 패키지 이름을 저장
    package_name = sys.argv[0];

    try:
        runpy.run_module(package_name, run_name="__main__")
    except ModuleNotFoundError:
        print(f"Package {package_name} not found")
        sys.exit(1)