import dis

src = "x = 1 + 2"
code = compile(src, "<snippet>", "exec")
dis.dis(code)