
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class ArticleDetail extends StatefulWidget {
  ArticleDetail({Key key,@required this.url}) : super(key: key);
  String url;
  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}


class _ArticleDetailState extends State<ArticleDetail> {
  bool isLoading = true;
  Widget spinkit =  SpinKitThreeBounce(
    color: Colors.black87,
    size: 30.0,
  );

  Widget demo = SingleChildScrollView(
      child: Container(
        color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32.0),
            Row(//1
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitRotatingCircle(color: Colors.white),
                const SpinKitRotatingPlain(color: Colors.white),
                const SpinKitChasingDots(color: Colors.white),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(//2
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitPumpingHeart(color: Colors.white),
                const SpinKitPulse(color: Colors.white),
                const SpinKitDoubleBounce(color: Colors.white),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(//3
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitWave(color: Colors.white, type: SpinKitWaveType.start),
                const SpinKitWave(color: Colors.white, type: SpinKitWaveType.center),
                const SpinKitWave(color: Colors.white, type: SpinKitWaveType.end),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(//4
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitThreeBounce(color: Colors.white),
                const SpinKitWanderingCubes(color: Colors.white),
                const SpinKitWanderingCubes(color: Colors.white, shape: BoxShape.circle),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitCircle(color: Colors.white),
                const SpinKitFadingFour(color: Colors.white),
                const SpinKitFadingFour(color: Colors.white, shape: BoxShape.rectangle),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitFadingCube(color: Colors.white),
                const SpinKitCubeGrid(size: 51.0, color: Colors.white),
                const SpinKitFoldingCube(color: Colors.white),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitRing(color: Colors.white),
                const SpinKitDualRing(color: Colors.white),
                const SpinKitRipple(color: Colors.white),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitFadingGrid(color: Colors.white),
                const SpinKitFadingGrid(color: Colors.white, shape: BoxShape.rectangle),
                const SpinKitSquareCircle(color: Colors.white),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitSpinningCircle(color: Colors.white),
                const SpinKitSpinningCircle(color: Colors.white, shape: BoxShape.rectangle),
                const SpinKitFadingCircle(color: Colors.white),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitHourGlass(color: Colors.white),
                const SpinKitPouringHourglass(color: Colors.white),
              ],
            ),
            const SizedBox(height: 64.0),
          ],
        ),
      ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('详情'),
      // ),
      body:Stack(
        children: <Widget>[
          WebView(
            userAgent: 'ZhihuHybrid',
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            navigationDelegate: (NavigationRequest request) {
                // if (request.url.startsWith('https://www.youtube.com/')) {
                //   print('blocking navigation to $request}');
                //   return NavigationDecision.prevent;
                // }
                print('allowing navigation to ${request.url}');
                return NavigationDecision.navigate;
            },
            onPageFinished: (url){
                setState(() {
                  isLoading = false;
                });
            },
          ),
          Positioned(child: isLoading?spinkit:Container())
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios,color: Colors.black87), 
                  onPressed: ()=>Navigator.pop(context)
                ),
                IconButton(icon: Icon(Icons.comment,color: Colors.black87), onPressed: ()=>{}),
                IconButton(icon: Icon(Icons.thumb_up,color: Colors.black87), onPressed: ()=>{}),
                IconButton(icon: Icon(Icons.star_border,color: Colors.black87), onPressed: ()=>{}),
                IconButton(icon: Icon(Icons.file_upload,color: Colors.black87), onPressed: ()=>{}),
              ],
            )
      ),
    );
  }
}