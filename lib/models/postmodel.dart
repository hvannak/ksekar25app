
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';
import 'package:ksekar25app/models/imagedatamodel.dart';
part 'postmodel.g.dart';

@JsonSerializable(explicitToJson: true)
class Postmodel {
   @JsonKey(name: "_id")
   String? id;
   String lang;
   String user;
   String title;
   String description;
   Imagedatamodel image;
   DateTime date;
  Postmodel(this.id, this.lang, this.user, this.title, this.description,this.image,this.date);
  factory Postmodel.fromJson(Map<String, dynamic> json) => _$PostmodelFromJson(json);
  Map<String, dynamic> toJson() => _$PostmodelToJson(this);
 
}
