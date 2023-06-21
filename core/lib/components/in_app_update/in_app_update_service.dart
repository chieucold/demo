import 'package:core/components/core_component.dart';
import 'package:in_app_update/in_app_update.dart';

class InAppUpdateService {
  /// updateAvailability - Cập nhật Tính khả dụng
  /// immediateAllowed - Được phép ngay lập tức
  /// flexibleAllowed - Được phép linh hoạt
  /// availableVersionCode - Mã phiên bản có sẵn
  /// installStatus - Cài đặt Trạng thái
  /// packageName - Tên gói hàng
  /// clientVersionStalenessDays - Phiên bản khách hàng Ngày tháng chờ đợi
  /// updatePriority - Cập nhật mức độ ưu tiên
  Future<void> checkForUpdate() async {
    await InAppUpdate.checkForUpdate().then((info) {
      print(info);
      if (info.updateAvailability == 1) {
        showMessage('Phiên bản mới đã có sẵn');
      }
    }).catchError(() {});
  }
}
