SOFT_DIR := berkeley-softfloat-3/build/Linux-x86_64-GCC
TEST_DIR := berkeley-testfloat-3/build/Linux-x86_64-GCC
PWD := $(shell pwd)
export SOFTFLOAT_INCLUDE_DIR := $(PWD)/berkeley-softfloat-3/source/include/
export SOFTFLOAT_H := $(PWD)/berkeley-softfloat-3/source/include/
export SOFTFLOAT_LIB := $(PWD)/$(SOFT_DIR)

BUILD_DIR := build

$(TEST_DIR)/testfloat: $(SOFT_DIR)/softfloat.a
	$(MAKE) -C $(TEST_DIR)
	mkdir -p $(BUILD_DIR)
	cp $(TEST_DIR)/testfloat_gen $(TEST_DIR)/testfloat_ver $(BUILD_DIR)

$(SOFT_DIR)/softfloat.a:
	$(MAKE) -C $(SOFT_DIR)

.PHONY: clean
clean:
	$(MAKE) -C $(TEST_DIR) clean
	$(MAKE) -C $(SOFT_DIR) clean