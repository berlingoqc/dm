GIT_CMD := git describe --abbrev=0 --tags

#VERSION := $(shell ${GIT_CMD})
#ARIA2_VERSION := $(shell cat aria2/VERSION)
#YOUTUBE_DL_RPC_VERSION := $(shell cd youtube-dl-rpc && ${GIT_CMD} )
#DM_BACKEND_VERSION := $(shell cd dm-backend && ${GIT_CMD})
#DM_UI_VERSION := $(shell cd dm-ui && ${GIT_CMD})

WORK_FOLDER := ${HOME}/.dm

clean:
	@cd youtube-dl-rpc && make clean
	@cd dm-backend && make clean
	@rm -rf aria2/aria2* release tmp

release:
	@cd aria2 && ./get_release.sh
	@cd youtube-dl-rpc && make build release
	@cd dm-backend && make build release
	@mkdir -p release && cp aria2/aria2* dm-backend/release/* youtube-dl-rpc/release/* ./release/


clear-env:
	@rm -rf $(WORK_FOLDER)

create-env:
	@mkdir -p $(WORK_FOLDER)/{bin,config,pipeline,script}
	#@mkdir -p tmp/
	#@tar zxf release/*.tar.gz -C tmp/