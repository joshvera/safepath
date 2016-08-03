build: FORCE
	stack build

install: FORCE
	stack install

pedantic: FORCE
	stack clean
	stack build \
    --fast \
    --jobs=8 \
    --ghc-options="\
        -fforce-recomp \
        -O0 \
        -Wall \
				-Werror \
        -fwarn-unused-imports \
        -fwarn-incomplete-patterns \
        -fwarn-unused-do-bind \
				-fno-warn-duplicate-exports \
				-fno-warn-type-defaults \
        -fno-warn-name-shadowing \
        -fno-warn-overlapping-patterns \
        -fno-warn-orphans"

test: FORCE
	stack clean
	stack test \
		--ghc-options="\
			-Wall \
			-Werror \
			-fforce-recomp \
			-fno-warn-duplicate-exports \
			-fno-warn-name-shadowing \
			-fno-warn-orphans" \
		--test-arguments="\
			--seed=42"

doc:
	stack haddock

coverage:
	stack clean
	stack test \
		--coverage \
		--test-arguments="--qc-max-success=10 --qc-max-size=10"

bench:
	stack bench

love:
	@echo "not war"

FORCE:


