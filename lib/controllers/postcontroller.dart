import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ksekar25app/helpers/apiHelpers.dart';
import 'package:ksekar25app/helpers/mygeneralfunc.dart';
import 'package:ksekar25app/models/postmodel.dart';

class PostController extends ChangeNotifier {
  List<Postmodel> _postList = [];
  bool _waiting = true;
  int _totalDoc = 0;
  String _message = '';
  UnmodifiableListView<Postmodel> get postList =>
      UnmodifiableListView(_postList);
  bool get waiting => _waiting;
  int get totalDoc => _totalDoc;
  String? get message => _message;

  void getPostByPage(
      BuildContext context, Map<String, dynamic> instance) async {
    try {
      _waiting = true;
      if(instance['pageOpt']['page'] == 1){
        _postList = [];
      }
      var response = await ApiHelpers.fetchPost(
          '/posts/pageclient', instance);
      if (response.statusCode == 200) {
        var list = jsonDecode(response.body)['objList'] as List;
        _totalDoc = jsonDecode(response.body)['totalDoc'] as int;
        _postList.addAll(list.map((i) => Postmodel.fromJson(i)).toList());
        print(_postList.length);
        notifyListeners();
        _waiting = false;
      } else {
        final snackBar = SnackBar(content: Text(response.body));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print(response.statusCode.toString());
        throw (response.statusCode.toString());
      }
    } on SocketException catch (e) {
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      throw (e);
    } on Exception catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  
}
