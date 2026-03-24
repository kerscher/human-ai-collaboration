SHELL = /bin/sh

.PHONY: test doc

test:
	sh ./scripts/test/report.sh

doc:
	sh ./scripts/doc/format.sh