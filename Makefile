SHELL := /bin/sh

TAP := open-southeners/tap
TAP_DIR := $(shell brew --repository)/Library/Taps/open-southeners/homebrew-tap
ROOT := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

FORMULA := $(TAP)/rcomp
CASK := $(TAP)/container-app

RCOMP_VERSION ?= 0.1.0
RCOMP_URL := https://github.com/open-southeners/rcomp/archive/refs/tags/v$(RCOMP_VERSION).tar.gz
URL ?= $(RCOMP_URL)

.PHONY: help tap untap checksum update-rcomp-sha audit audit-online \
	install reinstall test uninstall install-cask reinstall-cask uninstall-cask

help:
	@printf '%s\n' \
		'make tap                Link this checkout as the open-southeners/tap tap' \
		'make untap              Remove the local tap link' \
		'make checksum           Print SHA256 for URL (defaults to the rcomp archive)' \
		'make update-rcomp-sha   Update Formula/rcomp.rb for RCOMP_VERSION' \
		'make audit              Audit the formula and cask' \
		'make audit-online       Run strict online audits' \
		'make install            Install rcomp from this tap' \
		'make reinstall          Reinstall rcomp after formula changes' \
		'make test               Run the installed rcomp formula test' \
		'make uninstall          Uninstall rcomp' \
		'make install-cask       Install ContainerApp from this tap' \
		'make reinstall-cask     Reinstall ContainerApp after cask changes' \
		'make uninstall-cask     Uninstall ContainerApp' \
		'' \
		'Overrides:' \
		'  make checksum URL=https://example.com/archive.tar.gz' \
		'  make update-rcomp-sha RCOMP_VERSION=0.2.0'

tap:
	@set -eu; \
	target="$(TAP_DIR)"; \
	mkdir -p "$$(dirname "$$target")"; \
	if [ -L "$$target" ]; then \
		current=$$(readlink "$$target"); \
		if [ "$$current" != "$(ROOT)" ]; then \
			printf 'Refusing to replace tap link %s -> %s\n' "$$target" "$$current" >&2; \
			exit 1; \
		fi; \
		printf 'Local tap is already linked: %s -> %s\n' "$$target" "$(ROOT)"; \
	elif [ -e "$$target" ]; then \
		printf 'Refusing to replace existing tap directory: %s\n' "$$target" >&2; \
		exit 1; \
	else \
		ln -s "$(ROOT)" "$$target"; \
		printf 'Linked local tap: %s -> %s\n' "$$target" "$(ROOT)"; \
	fi

untap:
	@set -eu; \
	target="$(TAP_DIR)"; \
	if [ -L "$$target" ] && [ "$$(readlink "$$target")" = "$(ROOT)" ]; then \
		rm "$$target"; \
		rmdir "$$(dirname "$$target")" 2>/dev/null || true; \
		printf 'Removed local tap link: %s\n' "$$target"; \
	elif [ -e "$$target" ] || [ -L "$$target" ]; then \
		printf 'Refusing to remove tap not linked to this checkout: %s\n' "$$target" >&2; \
		exit 1; \
	else \
		printf 'Local tap is not linked: %s\n' "$$target"; \
	fi

checksum:
	@set -eu; \
	tmp=$$(mktemp); \
	trap 'rm -f "$$tmp"' 0 1 2 3 15; \
	curl -L --fail --silent --show-error --output "$$tmp" "$(URL)"; \
	shasum -a 256 "$$tmp"

update-rcomp-sha:
	@set -eu; \
	tmp=$$(mktemp); \
	trap 'rm -f "$$tmp"' 0 1 2 3 15; \
	curl -L --fail --silent --show-error --output "$$tmp" "$(RCOMP_URL)"; \
	sha=$$(shasum -a 256 "$$tmp" | awk '{ print $$1 }'); \
	sed -i.bak \
		-e 's|^  url ".*rcomp/archive/refs/tags/v[^"]*\.tar\.gz"|  url "$(RCOMP_URL)"|' \
		-e 's|^  sha256 "[0-9a-f]*"|  sha256 "'"$$sha"'"|' \
		Formula/rcomp.rb; \
	rm -f Formula/rcomp.rb.bak; \
	printf 'Updated rcomp v%s with SHA256 %s\n' "$(RCOMP_VERSION)" "$$sha"

audit: tap
	brew audit --strict --formula $(FORMULA)
	brew audit --strict --cask $(CASK)

audit-online: tap
	brew audit --strict --online --formula $(FORMULA)
	brew audit --strict --online --cask $(CASK)

install: tap
	brew install $(FORMULA)

reinstall: tap
	brew reinstall --build-from-source $(FORMULA)

test: tap
	brew test $(FORMULA)

uninstall:
	brew uninstall rcomp

install-cask: tap
	brew install --cask $(CASK)

reinstall-cask: tap
	brew reinstall --cask $(CASK)

uninstall-cask:
	brew uninstall --cask container-app
