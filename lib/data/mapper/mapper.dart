// Mapper'ın amacı Response objelerini nun-nullable modele getirecek
import 'package:mvvm_learn/app/extension.dart';
import 'package:mvvm_learn/data/responses/responses.dart';
import '../../domain/model.dart';

const empty = '';
const zero = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id?.orEmpty() ?? empty,
      this?.name?.orEmpty() ?? empty,
      this?.numOfNotifications?.orZero() ?? zero,
    );
  }
}
