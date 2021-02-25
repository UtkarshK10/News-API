import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/helper/data.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/helper/news.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:newsapp/models/nation_model.dart';
import 'package:newsapp/helper/nation_data.dart';
import 'article_view.dart';
import 'category_news.dart';

List<CategoryModel> categories = new List<CategoryModel>();
List<ArticleModel> articles = new List<ArticleModel>();
List<NationModel> nations = new List<NationModel>();

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  String country='us';

  bool _loading =false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nations=getNation();
    categories = getCategories();
    getNews();
  }

  getNews() async
  {
    News newsClass= News();
    print(country);
    await newsClass.getNews(country);
    articles=newsClass.news;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('World'),
            Text(
              'News',
              style: TextStyle(color: Colors.lightBlueAccent),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: _loading?
          Center(
            child: Container(
              child: CircularProgressIndicator(),
            ),
          )
          : SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
              children: <Widget>[
                Container(
                  height: 70.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount:nations.length ,
                      itemBuilder: (context,index)
                      {
                        return NationTile(
                          nationCode: nations[index].nationCode,
                          nationName: nations[index].nationName,
                          nationImageUrl: nations[index].nationImageUrl,
                        );
                      }
                  ),
                ),
                Container(
                  height: 70.0,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryTile(
                          imageUrl: categories[index].imageUrl,
                          categoryName: categories[index].categoryName,
                        );
                      }),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16.0),
                 child: ListView.builder(
                   shrinkWrap: true,
                     physics: ClampingScrollPhysics(),
                     itemCount: articles.length,
                     itemBuilder: (context,index){
                       return BlogTile(
                         imageUrl: articles[index].urlToImage,
                         title: articles[index].title,
                         description: articles[index].description,
                         url: articles[index].url,
                       );
                     }),
                ),
              ],
        ),
      ),
          ),

    );
  }
}



class NationTile extends StatefulWidget {
  final nationName,nationCode,nationImageUrl;
  NationTile({this.nationName,this.nationCode,this.nationImageUrl});

  @override
  _NationTileState createState() => _NationTileState();
}

class _NationTileState extends State<NationTile> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

          News newsClass= News();
           newsClass.getNews(widget.nationCode);
          articles=newsClass.news;



      },
      child: Container(
        margin: EdgeInsets.only(right: 16.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: CachedNetworkImage(
                imageUrl: widget.nationImageUrl,
                width: 120.0,
                height: 60.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(6.0)
              ),
              width: 120,
              height: 60.0,
              child: Text(
                widget.nationName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}









class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(
          builder: (context)
              {
                return CategoryNews(category: categoryName.toLowerCase());
              }
        ));

      },
      child: Container(
        margin: EdgeInsets.only(right: 16.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: CachedNetworkImage(
                  imageUrl:
                    imageUrl,
                    width: 120.0,
                    height: 60.0,
                    fit: BoxFit.cover,
                )),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.black54,
              ),
              width: 120,
              height: 60.0,
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl,title,description,url;
  BlogTile({this.imageUrl,this.title,this.description,@required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(
          builder: (context)
              {
                return ArticleView(
                  blogUrl: url,
                );
              }
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        child: Column(
         children: <Widget>[
           ClipRRect(
             borderRadius: BorderRadius.circular(6.0),
               child: Image.network(imageUrl)),
           SizedBox(height: 8.0,),
           Text(title,style: TextStyle(
             fontSize: 18.0,
             color: Colors.black87,
             fontWeight: FontWeight.w800,
           ),),
           SizedBox(height: 8.0,),
           Text(description,style: TextStyle(
             color: Colors.black54
           ),),
         ],
        ),
      ),
    );
  }
}




