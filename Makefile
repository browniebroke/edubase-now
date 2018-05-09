URL := http://ea-edubase-api-prod.azurewebsites.net/edubase/edubasealldata$(shell date +%Y%m%d).csv

DOWNLOAD_DIR := ./downloads
LOCAL_CSV := $(DOWNLOAD_DIR)/edubase.csv
DB_FILE := edubase.db

$(LOCAL_CSV):
	@mkdir -p $(DOWNLOAD_DIR)
	curl $(URL) -o $(LOCAL_CSV)

$(DB_FILE): $(LOCAL_CSV)
	csvs-to-sqlite -t edubase $(LOCAL_CSV) $(DB_FILE)

clean:  ## Clean any previously downloaded data
	rm -f $(DOWNLOAD_DIR)/*.csv

download: $(LOCAL_CSV)  ## Download the csv file from Edubase

build: $(DB_FILE)  ## Pre-build the required assets

serve: $(DB_FILE)  ## Serve the dataset in your browser
	datasette serve $(DB_FILE)

help: ## Display this help message
	@grep '^[a-zA-Z]' $(MAKEFILE_LIST) | \
		sort | \
		awk -F ':.*?## ' 'NF==2 {printf "  %-26s%s\n", $$1, $$2}'
