.PHONY: all bin dotfiles test

all: bin dotfiles

bin:
	cwd=$$(realpath $$(dirname -- "$0")); \
	for file in "$${cwd}"/bin/*; do \
		sudo ln -sf $${file} /usr/local/bin/$$(basename $${file}); \
	done;

dotfiles:
	cwd=$$(realpath $$(dirname -- "$0")); \
	for file in "$${cwd}"/dotfiles/*; do \
		ln -sfn $${file} $${HOME}/.$$(basename $${file}); \
	done;

test:
	cwd=$$(realpath $$(dirname -- "$0")); \
	docker run --rm \
		--name dotfiles_shellcheck \
		-v "$${cwd}":/scripts \
		-w /scripts \
		--entrypoint /bin/sh \
		koalaman/shellcheck test.sh
