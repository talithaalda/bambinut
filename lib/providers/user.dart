import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:bambinut/providers/classUser.dart';
import 'package:collection/collection.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Users with ChangeNotifier {
  bool get isAuth {
    return token != null;
  }

  List<UserClass> _users = [];

  var _idToken, _userId;
  DateTime _expireTime = DateTime.now();

  var _tempIdToken, _tempUserId;
  DateTime _tempExpireTime = DateTime.now();

  UserClass selectById(String id) {
    print(_users.length);
    return _users.firstWhere((element) => element.uid == id);
  }

  String userID() {
    return uid;
  }

  Future<void> addUser(String email, String password, String name) {
    DateTime datetimeNow = DateTime.now();

    Uri url = Uri.parse(
        "https://bambinut-df6a3-default-rtdb.firebaseio.com/User.json?auth=$token");
    return http
        .post(
      url,
      body: json.encode(
        {
          "uid": uid,
          "email": email,
          "name": name,
          "babyName": null,
          "datebirth": null,
          "profileUrl": null,
          "createdAt": datetimeNow.toString(),
        },
      ),
    )
        .then(
      (response) {
        print("THEN FUNCTION");
        _users.add(
          UserClass(
            id: json.decode(response.body)["name"].toString(),
            uid: uid,
            email: email,
            name: name,
            babyName: null,
            dateBirth: null,
            profileUrl: null,
          ),
        );

        notifyListeners();
      },
    );
  }

  Future<void> editUser(String id, String uid, String babyName,
      String dateBirth, String profileUrl) {
    DateTime datetimeNow = DateTime.now();

    Uri url = Uri.parse(
        "https://bambinut-df6a3-default-rtdb.firebaseio.com/User/$id.json?auth=$token");
    return http
        .patch(
      url,
      body: json.encode(
        {
          "uid": uid,
          "babyName": babyName,
          "datebirth": dateBirth,
          "profileUrl": profileUrl,
          "createdAt": datetimeNow.toString(),
        },
      ),
    )
        .then(
      (response) {
        UserClass selectUser =
            _users.firstWhere((element) => element.uid == uid);
        selectUser.babyName = babyName;
        selectUser.dateBirth = dateBirth;
        selectUser.profileUrl = profileUrl;
        notifyListeners();
      },
    );
  }

  Future<void> tempData() async {
    _idToken = _tempIdToken;
    _userId = _tempUserId;
    _expireTime = _tempExpireTime;
    notifyListeners();
  }

  get token {
    if (_idToken != null &&
        _expireTime != null &&
        DateTime.now().isBefore(_expireTime)) {
      return _idToken;
    } else {
      return null;
    }
  }

  get UserId {
    return uid;
  }

  get uid {
    if (_idToken != null &&
        _expireTime != null &&
        DateTime.now().isBefore(_expireTime)) {
      return _userId;
    }

    return null;
  }

  Future<void> signup(String name, String email, String password) async {
    Uri url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBjZzw9hs3rk04HHP_-SyVDH4o6KAepLVk');
    try {
      var response = await http.post(
        url,
        body: jsonEncode(
          {
            "name": name,
            "email": email,
            "password": password,
            "returnSecureToken": true,
          },
        ),
      );
      var responseBody = jsonDecode(response.body);

      if (responseBody['error'] != null) {
        throw responseBody['error']['message'];
      }

      _tempUserId = responseBody["localId"];
      _tempIdToken = responseBody["idToken"];
      _tempExpireTime = DateTime.now().add(
        Duration(
          seconds: int.parse(responseBody["expiresIn"]),
        ),
      );
      notifyListeners();
      tempData();
      addUser(email, password, name);
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    Uri url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBjZzw9hs3rk04HHP_-SyVDH4o6KAepLVk');
    try {
      var response = await http.post(
        url,
        body: jsonEncode(
          {
            "email": email,
            "password": password,
            "returnSecureToken": true,
          },
        ),
      );
      var responseBody = jsonDecode(response.body);

      if (responseBody['error'] != null) {
        throw responseBody['error']['message'];
      }
      // setDataUser(responseBody['email'], responseBody['idToken']);

      _tempUserId = responseBody["localId"];
      _tempIdToken = responseBody["idToken"];
      _tempExpireTime = DateTime.now().add(
        Duration(
          seconds: int.parse(responseBody["expiresIn"]),
        ),
      );
      notifyListeners();
      tempData();
    } catch (error) {
      throw error;
    }
  }

  Future<void> initialData() async {
    Uri url = Uri.parse(
        'https://bambinut-df6a3-default-rtdb.firebaseio.com/User.json?auth=$token');

    try {
      var response = await http.get(url);

      print(response.statusCode);

      if (response.statusCode >= 300 && response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        var data = json.decode(response.body) as Map<String, dynamic>;
        if (data != null) {
          data.forEach(
            (key, value) {
              if (value["uid"] == UserId) {
                DateTime dateTimeParse =
                    DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]);
                UserClass prod = UserClass(
                    id: key,
                    uid: uid,
                    name: value["name"],
                    email: value["email"],
                    babyName: value["babyName"],
                    profileUrl: value["profileUrl"],
                    dateBirth: value["dateBirth"]);
                _users.add(prod);
                print("SUCCESS ADDING USERS");
                notifyListeners();
              }
            },
          );
        }
      }
    } catch (err) {
      throw (err);
    }
  }

  void logout() {
    _idToken = null;
    _userId = null;
    _expireTime = null;
    notifyListeners();
  }
}
