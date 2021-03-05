.PHONY: all build clean

all:
	echo Uage: make build | clean | ls
build:
	./image-build.sh
#	./container-build.sh

ls:
	docker images

clean:
	./image-clean.sh
	./container-clean.sh
