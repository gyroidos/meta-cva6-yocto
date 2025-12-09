MACHINE ?=cv32a6-agilex7
SOURCE     := ../../build/tmp-glibc/deploy/images/$(MACHINE)

SDDEVICE_PART1 = $(shell lsblk $(SDDEVICE) -no PATH | head -2 | tail -1)
SDDEVICE_PART2 = $(shell lsblk $(SDDEVICE) -no PATH | head -3 | tail -1)
SDDEVICE_PART3 = $(shell lsblk $(SDDEVICE) -no PATH | head -4 | tail -1)
SDDEVICE_PART4 = $(shell lsblk $(SDDEVICE) -no PATH | head -5 | tail -1)

format-sd:$(SDDEVICE)
	sudo sfdisk $(SDDEVICE) --force < agilex7-yocto-partition.txt
	sudo fatlabel /dev/sdb1 "HPS"
	
flash-sd:$(SDDEVICE)
	sudo cp -r u-boot.itb /media/*/HPS/
	sudo dd if=$(SOURCE)/fw_payload.bin of=$(SDDEVICE_PART2) status=progress oflag=sync bs=1M
	sudo dd if=$(SOURCE)/fitImage       of=$(SDDEVICE_PART3) status=progress oflag=sync bs=1M
	sudo dd if=$(SOURCE)/core-image-minimal-$(MACHINE).ext4        of=$(SDDEVICE_PART4) status=progress oflag=sync bs=1M

