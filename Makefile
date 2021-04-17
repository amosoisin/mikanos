EDK2_PATH=../edk2
OUTPUT_PATH=output
BUILD_PATH=../osbook
DISK_IMG=$(OUTPUT_PATH)/disk.img
TARGET_PATH=$(EDK2_PATH)/Build/MikanLoaderX64/DEBUG_CLANG38/X64
TARGET=$(TARGET_PATH)/Loader.efi


.PHONY: build
build:
	cd $(EDK2_PATH)
	build

.PHONY: archive
archive: $(TARGET)
	./mkarchive.sh $(TARGET)

.PHONY: run
run: $(DISK_IMG)
	qemu-system-x86_64 \
		-drive if=pflash,file=$(BUILD_PATH)/devenv/OVMF_CODE.fd \
		-drive if=pflash,file=$(BUILD_PATH)/devenv/OVMF_VARS.fd \
		-hda $(DISK_IMG)

clean:
	rm -rf mnt
	rm output/*
