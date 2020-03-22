
/*
{
  image_hue: 0xb3947d,
  hint: 作者/牛顿顿顿,
  url: https: //daily.zhihu.com/story/9721278,
  image: https: //pic2.zhimg.com/v2-cf632722ef85178785609849e8e2bf61.jpg,
  title: 如何看待网上五花八门的「寻人服务」？,
  ga_prefix: 030811,
  type: 0,
  id: 9721278
}
*/

class TopStoriesModel {

  final String image_hue;
  final String hint;
  final String url;
  final String image;
  final String title;
  final String ga_prefix;
  final int type;
  final int id;

  TopStoriesModel(
    this.image_hue,
    this.hint,
    this.url,
    this.image,
    this.title,
    this.ga_prefix,
    this.type,
    this.id
  );

  TopStoriesModel.fromJsonToModel(Map json)
  : this.image_hue = json['image_hue'],
  this.hint = json['hint'],
  this.url = json['url'],
  this.image = json['image'],
  this.title = json['title'],
  this.ga_prefix = json['ga_prefix'],
  this.type = json['type'],
  this.id = json['id'];
}