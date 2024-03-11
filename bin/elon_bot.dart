import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

// ignore: non_constant_identifier_names
String TOKEN = '5830866035:AAHlnvAxf-vv_Hi-E9iJelX7c8IikVKk4tw';

void main() async {
  try {
    var telegram = await Telegram(TOKEN).getMe();

    var teleDart = TeleDart(TOKEN, Event(telegram.username!));
    // var res = await teleDart.deleteWebhook();
    // print("Delete Webhook: $res");
    teleDart.start();

    teleDart.onMessage().listen((event) {
      teleDart.sendMessage(event.chat.id, event.text!);
    });
  } catch (e) {
    print(e.toString());
  }
}
