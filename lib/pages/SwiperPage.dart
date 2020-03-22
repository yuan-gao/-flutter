
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../model/TopStoriesModel.dart';
class SwiperPage extends StatefulWidget {
  List <TopStoriesModel> topStories;
  var callBack;
  SwiperPage({Key key,@required this.topStories,this.callBack}):super(key:key);

  @override
  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  
  int _index = 0;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _onIndexChanged(index){
      setState(() {
        _index = index;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            // height: 150,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: <Widget>[
                      Image.network(
                        widget.topStories[index].image,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 40,
                        left: 10,
                        right: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.topStories[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                                )
                            ),
                            Text(
                              widget.topStories[index].hint,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w300
                              ),
                            ),
                          ],
                        )
                      )
                    ],
                  );
                },
                itemCount: widget.topStories.length,
                pagination: SwiperPagination(
                  alignment: Alignment.bottomRight,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: Colors.blue,
                  )
                ),
                loop: true,
                duration: 2000,
                index: _index,
                onIndexChanged: _onIndexChanged,
                autoplay: true,
                onTap: (index) => widget.callBack(widget.topStories[index]),
                // control: new SwiperControl(),
              ),
            ),
          )
        ],
      );
  }
}