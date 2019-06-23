VERSION := $(shell git describe --abbrev=0 --tags)




clean:
	@cd youtube-dl-rpc && make clean
	@cd dm-backend && make clean
	@rm -rf aria2/aria2* release

release:
	@cd aria2 && ./get_release.sh
	@cd youtube-dl-rpc && make build release
	@cd dm-backend && make build release
	@mkdir -p release && cp aria2/aria2* dm-backend/release/* youtube-dl-rpc/release/* ./release/