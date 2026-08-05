TYPST := typst
MAIN   := 地狱之下.typ
OUT    := dist/地狱之下.pdf
PRINT_OUT := dist/地狱之下_打印版.pdf
# --root .. 让项目根回到仓库根,以便访问 ../图片 等根目录资源
FLAGS  := --root .. --font-path fonts

.PHONY: all print clean

all: $(OUT)

$(OUT): $(MAIN)
	@mkdir -p dist
	$(TYPST) compile $(FLAGS) $(MAIN) $(OUT)

# 打印版:通过 --input print=true 传入打印模式,生成省墨单栏 PDF
# Print version: passes --input print=true for ink-saving single-column output
print: $(MAIN)
	@mkdir -p dist
	$(TYPST) compile $(FLAGS) --input print=true $(MAIN) $(PRINT_OUT)

clean:
	rm -rf dist