curl -s http://117.4.243.193:8081/api/system/swagger/v1/swagger.json -o ./lib/api/system_api.json
curl -s http://117.4.243.193:8083/api/common-data/swagger/v1/swagger.json -o ./lib/api/commondata_api.json
curl -s http://117.4.243.193:8085/swagger/v1/swagger.json -o ./lib/api/exam_api.json
curl -s http://117.4.243.193:8084/api/guide/swagger/v1/swagger.json -o ./lib/api/guide_api.json
curl -s http://117.4.243.193:8082/api/learn/swagger/v1/swagger.json -o ./lib/api/learn_api.json
curl -s http://117.4.243.193:8086/swagger/v1/swagger.json -o ./lib/api/realtime_api.json
flutter pub run build_runner build --delete-conflicting-outputs