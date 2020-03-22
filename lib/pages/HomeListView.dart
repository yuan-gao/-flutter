import 'dart:async';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:zhihu_daily_flutter/model/StoriesModel.dart';
import 'package:zhihu_daily_flutter/pages/ArticleDetail.dart';
import 'package:zhihu_daily_flutter/pages/SwiperPage.dart';
import '../network/HttpRequest.dart';
import '../model/TopStoriesModel.dart';

class HomeListView extends StatefulWidget {
  @override
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {

  List <StoriesModel> dataArray = [];
  List <TopStoriesModel> topStories = [];
  ScrollController _scrollController = new ScrollController();
  int page = 0;
  

  void onRespose(stories,_topStories){
    // debugPrint('stories ---------------->'+stories.toString());
    // debugPrint('topStories ---------------->'+_topStories.toString());
    stories = stories.map<StoriesModel>(
      (item) => StoriesModel.fromJsonToModel(item)
    ).toList();
    setState(() {
      if(page == 0){
        dataArray = stories;
        topStories = _topStories.map<TopStoriesModel>(
          (item) => TopStoriesModel.fromJsonToModel(item)
        ).toList();
      }else {
        dataArray.addAll(stories);
      }
    });
  }

  String getDateString(){
    var now = DateTime.now();
    var span = Duration(days: page);
    var date = now.subtract(span);
    return formatDate(date, ['yyyy','mm','dd']);
  }

  Future <void>  onRefresh () async {
    setState(() {
      page = 0;
    });
    requestLatest();
  }
  
  void loadMoreData (){
    setState(() {
      page++;
    });
    requtstData();
  }

  void requestLatest () { 
    HttpRequest.request('/4/stories/latest?client=0',
        method: HttpRequest.GET,
        parameters: null,
        onSuccess: (res) => {
          this.onRespose(res['stories'],res['top_stories']),
          loadMoreData()
        },
        onError: (err) => {
        }
    );
  }

  void requtstData (){
    var url = '/4/stories/before/'+getDateString()+'?client=0';
    HttpRequest.request(url,
        method: HttpRequest.GET,
        parameters: null,
        onSuccess: (res) => {
          this.onRespose(res['stories'],null)
        },
        onError: (err) => {
        }
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onRefresh();
    _scrollController.addListener((){
      var offset = _scrollController.position.pixels -
          _scrollController.position.maxScrollExtent;
      if ( offset > 0.0 && offset <=20) {
          loadMoreData();
      }
    });
  }

  Widget _itemBuilder(BuildContext context,int index){
    if (index == 0) {
      return SwiperPage(
        topStories: topStories,
        callBack: (TopStoriesModel model) => {
            print(model.url),
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleDetail(url: model.url)))
          }
        );
    }else {
      return  GestureDetector(
          child: Container(
          // color: Colors.lightBlueAccent,
              margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(dataArray[index-1].title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),
                        Text(dataArray[index-1].hint,style: TextStyle(color: Colors.black45,))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(08, 8, 08, 8),
                    width: 80,
                    height: 80,
                    child:Image(image: NetworkImage(dataArray[index-1].images[0]),fit: BoxFit.cover,)
                    )
                ],
              ),
          ),
          behavior: HitTestBehavior.translucent,
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=>ArticleDetail(url: dataArray[index-1].url.toString(),)
                )
            );
          },
      );
    }  
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: dataArray.length+1,
        itemBuilder: _itemBuilder,
        controller: _scrollController,
    ),
     onRefresh: onRefresh
     );
  }
}


