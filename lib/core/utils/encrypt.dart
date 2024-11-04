import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';

class EncryptionHelper {
  static String encryptData(String data, String key) {
    final keyBytes = Key.fromUtf8(key);
    final iv = IV.fromLength(16);  // Random IV generation

    final encrypter = Encrypter(AES(keyBytes, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(data, iv: iv);

    // Return the IV and encrypted data as a single base64 string
    return base64Encode(iv.bytes + encrypted.bytes);
  }

  static String decryptData(String encryptedData, String key) {
    final keyBytes = Key.fromUtf8(key);

    // Decode the base64-encoded string
    final decodedData = base64Decode(encryptedData);

    // Extract the IV from the first 16 bytes

    final iv = IV(Uint8List.fromList(decodedData.sublist(0, 16)));

    // Extract the encrypted message
    final encryptedBytes = decodedData.sublist(16);

    final encrypter = Encrypter(AES(keyBytes, mode: AESMode.cbc));
    final decrypted = encrypter.decrypt(Encrypted(encryptedBytes), iv: iv);

    return decrypted;
  }
}