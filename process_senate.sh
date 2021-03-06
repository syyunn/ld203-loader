echo "Downloading senate disclosure files."
mkdir -p downloads/senate
./bin/ld203loader download senate --downloadDir=./downloads/senate

echo "Extracting downloaded disclosures."
mkdir -p extracted/senate
./bin/ld203loader extract --inputDir=./downloads/senate/ --outputDir=./extracted/senate/

echo "Converting XML to JSON"
mkdir -p parsed/senate
./bin/ld203loader batchConvert senate --inputDir=./extracted/senate --outputDir=./parsed/senate/

echo "Merging contributions into single NDJSON"
rm dist/all_senate_contributions_combined.json
./bin/ld203loader mergeFiles senate contributions --inputDir=./parsed/senate --outputFile=./dist/all_senate_contributions_combined.json

echo "Merging metadata into single NDJSON"
rm dist/all_senate_meta_combined.json
./bin/ld203loader mergeFiles senate meta --inputDir=./parsed/senate --outputFile=./dist/all_senate_meta_combined.json

echo "Converting all_contributions_combined.json into all_contributions.csv"
./node_modules/.bin/ndjson-to-csv dist/all_senate_contributions_combined.json > dist/all_senate_contributions.csv

echo "Converting all_meta_combined.json into all_meta.csv"
./node_modules/.bin/ndjson-to-csv dist/all_senate_meta_combined.json > dist/all_senate_meta.csv

echo "All done, generated the following files:"
du -sh dist/*
