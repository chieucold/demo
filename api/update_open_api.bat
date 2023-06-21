curl.exe --output ./lib/api/system_api.json --url http://117.4.243.193:8081/api/system/swagger/v1/swagger.json
curl.exe --output ./lib/api/commondata_api.json --url http://117.4.243.193:8083/api/common-data/swagger/v1/swagger.json
curl.exe --output ./lib/api/exam_api.json --url http://117.4.243.193:8085/swagger/v1/swagger.json
curl.exe --output ./lib/api/guide_api.json --url http://117.4.243.193:8084/api/guide/swagger/v1/swagger.json
curl.exe --output ./lib/api/learn_api.json --url http://117.4.243.193:8082/api/learn/swagger/v1/swagger.json
curl.exe --output ./lib/api/realtime_api.json --url http://117.4.243.193:8086/swagger/v1/swagger.json
flutter pub run build_runner build --delete-conflicting-outputs