MD_REPO = MaterialDesign
MD_GIT = git@github.com:Templarian/$(MD_REPO).git
SRC_DIR = $(MD_REPO)/icons/svg
BUILD_DIR = d

SRC_FILES := $(wildcard $(SRC_DIR)/*.svg)
BUILD_FILES := $(patsubst $(SRC_DIR)/%.svg, $(BUILD_DIR)/%.js, $(SRC_FILES))

all: package.json
init: $(BUILD_DIR) $(MD_REPO)
sync:
	cd $(MD_REPO) && git pull
	make -j

$(MD_REPO):
	git clone $(MD_GIT)
	make -j

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

package.json: package.init.json $(BUILD_FILES)
	@cp $< $@
	$(eval MAJORMINOR := $(shell node get-version.js))
	$(eval PATCH := $(shell cd $(MD_REPO) && git rev-list HEAD --count))
	npm --no-git-tag-version version $(MAJORMINOR).$(PATCH)
	npm publish

$(BUILD_DIR)/%.js: $(SRC_DIR)/%.svg
	@echo 'building: $@'
	$(eval $@_DATA := $(shell grep -Po '\sd="\K[^"]+' $<))
	@echo "module.exports = '$($@_DATA)'" > $@

clean:
	rm -rf $(BUILD_DIR) $(MD_REPO) package.json
