test:
	docker run -it --rm \
		-v $(shell pwd):/app \
		-w /app \
		--cap-add SYS_ADMIN \
		puppeteer:dev \
		node --unhandled-rejections=strict t.js

build:
	docker build -t puppeteer:dev \
		--build-arg ALPINE_MIRROR=mirrors.tuna.tsinghua.edu.cn \
		.
