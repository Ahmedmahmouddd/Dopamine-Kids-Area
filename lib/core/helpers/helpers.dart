import 'package:intl/intl.dart';

bool isLanguageArabic() {
  return Intl.getCurrentLocale().startsWith('ar');
}