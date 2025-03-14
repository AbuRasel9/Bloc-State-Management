import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_state_management/model/post_model.dart';
import 'package:http/http.dart';
class PostRepository {


  Future<List<PostModel>>fetchPostList()async{
    try{
      Response response=await get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
      if(response.statusCode==200){
        final body=jsonDecode(response.body);
        return List<PostModel>.from(body.map((e)=>PostModel.fromJson(e)));
      }else{
        throw Exception("Error  throwing");
      }
    }on SocketException{
      throw Exception("Error give");
    }on TimeoutException {
      throw Exception("Time out Exception");
    }

    catch(e){
      throw Exception("error throwing $e");

    }

  }
}