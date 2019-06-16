
.PHONY: docker-build-latest-git-tag docker-build-git-tag prepare-git-tree


docker-build: docker-build-latest-git-tag

docker-build-latest-git-tag: prepare-git-tree
	export tag="$$(cd .git && git tag -l --sort=-v:refname | head -n1)"; [ ! -z "$${tag}" ] && ${MAKE} TAG="$$tag" docker-build-git-tag

docker-build-git-tag:
	docker image build -t ${IMAGENAME}:${TAG} --build-arg TAG=${TAG} .
	docker tag ${IMAGENAME}:${TAG} ${IMAGENAME}:latest

prepare-git-tree:
	[ -d ".git" ] || git clone ${GIT_REPOSITORY} .git/
	cd .git && git fetch
