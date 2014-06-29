space = $(empty) $(empty)
fspace = __

install: $(patsubst %,_/%,$(shell ls -A))

_/Makefile _/.git _/.gitignore:;

# use source files as build targets without causing loop:
_/.subl: $(patsubst %,_/%,$(wildcard .subl/*));
_/.subl/%: ~/Library/Application__Support/Sublime__Text__3/Packages/User/%;
_/%: ~/%;

~/%: ./%
	@mkdir -p "$(@D)"
	@ln -nvsf "$(realpath $<)" "$@"

~/Library/Application__Support/Sublime__Text__3/Packages/User/%: .subl/%
	@mkdir -p "$(subst $(fspace),$(space),$(@D))"
	@ln -nvsf "$(realpath $<)" "$(subst $(fspace),$(space),$@)"

.SECONDARY:
.PHONY: install
