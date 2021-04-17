EDK2_PATH=$(HOME)/edk2
OUTPUT_PATH=output
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
	./run_image.sh $(DISK_IMG)

clean:
	rm -rf mnt
	rm output/*
