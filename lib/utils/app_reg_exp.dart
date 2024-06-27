import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppRegExp {
  static RegExp emailRegExp = RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$');
  static RegExp passwordRegExp = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
  );

  static MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
      mask: '+998 (##) ### ## ##',
      filter: {'#': RegExp(r'[\+0-9]')},
      type: MaskAutoCompletionType.lazy);
  static final moneyFormatter = MaskTextInputFormatter(
      mask: "### ### ### ###sum",
      filter: {
        "#": RegExp(r'^\$?(\d{1,3}(,\d{3})*(\.\d{1,2})?|\d+(\.\d{1,2})?)$')
      },
      type: MaskAutoCompletionType.lazy);
}
