import 'package:flutter/material.dart';
import 'package:instantgram/views/components/constants/strings.dart';
import 'package:instantgram/views/components/dialogs/alert_dialog_model.dart';

@immutable
class LogoutDialog extends AlertDialogModel<bool> {
  const LogoutDialog()
      : super(
            buttons: const {Strings.logOut: true, Strings.cancel: false},
            title: Strings.logOut,
            message: Strings.areYouSureYouWantToLogOutOfTheApp);
}
