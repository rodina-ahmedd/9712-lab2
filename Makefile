setup:
	mkdir -p quarantine

run: setup
	bash antivirusd.sh test_dir quarantine 10

restore: setup
	bash restore.sh test_dir quarantine
