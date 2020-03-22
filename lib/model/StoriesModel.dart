
/*
{
    image_hue: 0x302922,
    title: 看《西部世界》第三季之前必须要知道哪些信息？,
    url: https: //daily.zhihu.com/story/9721651,
    hint: 黑城堡妮妮·25分钟阅读,
    ga_prefix: 031511,
    images: [
      https: //pic4.zhimg.com/v2-c71f0ccb007409242a56580914c8ecfb.jpg
    ],
    type: 0,
    id: 9721651
  }
*/

import 'dart:convert';

class StoriesModel {

  final String imageHue;
  final String hint;
  final String url;
  final List images;
  final String title;
  final String gaPrefix;
  final int type;
  final int id;
  final String dateString;

  StoriesModel(
    this.imageHue,
    this.hint,
    this.url,
    this.images,
    this.title,
    this.gaPrefix,
    this.type,
    this.id,
    this.dateString,
  );

  StoriesModel.fromJsonToModel(Map json)
  : this.imageHue = json['image_hue'],
  this.hint = json['hint'],
  this.url = json['url'],
  this.images = json['images'].toList(),
  this.title = json['title'],
  this.gaPrefix = json['ga_prefix'],
  this.type = json['type'],
  this.id = json['id'],
  this.dateString = json['dateString'];
}