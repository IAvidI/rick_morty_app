// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(min) => "Login must contain more than ${min} symbols";

  static String m1(min) => "Password must contain more than ${min} symbols";

  static String m2(total) => "Total persons: ${total}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alive": MessageLookupByLibrary.simpleMessage("Alive"),
        "auth": MessageLookupByLibrary.simpleMessage("Authorization"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "counterValue": MessageLookupByLibrary.simpleMessage("Counter value"),
        "create": MessageLookupByLibrary.simpleMessage("Create"),
        "dead": MessageLookupByLibrary.simpleMessage("Dead"),
        "dontHaveAnAccountHint":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account yet"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "female": MessageLookupByLibrary.simpleMessage("Female"),
        "findPerson": MessageLookupByLibrary.simpleMessage("Find a person"),
        "inputErrorCheckLogin":
            MessageLookupByLibrary.simpleMessage("Check login"),
        "inputErrorCheckPassword":
            MessageLookupByLibrary.simpleMessage("Check password"),
        "inputErrorLoginIsShort": MessageLookupByLibrary.simpleMessage(
            "Login must contain more than 3 symbols"),
        "inputErrorLoginIsShorterThan": m0,
        "inputErrorPasswordIsShort": MessageLookupByLibrary.simpleMessage(
            "Password must contain more than 8 symbols"),
        "inputErrorPasswordIsShorterThan": m1,
        "inputLoginAndPassword":
            MessageLookupByLibrary.simpleMessage("Input login and password"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "male": MessageLookupByLibrary.simpleMessage("Male"),
        "man": MessageLookupByLibrary.simpleMessage("Man"),
        "noData": MessageLookupByLibrary.simpleMessage("No data"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "persons": MessageLookupByLibrary.simpleMessage("Persons"),
        "personsListIsEmpty":
            MessageLookupByLibrary.simpleMessage("No persons found"),
        "personsTotal": m2,
        "russian": MessageLookupByLibrary.simpleMessage("Russian"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign in"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Something went wrong :-("),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
        "wrongLoginOrPassword":
            MessageLookupByLibrary.simpleMessage("Wrong login or password")
      };
}
