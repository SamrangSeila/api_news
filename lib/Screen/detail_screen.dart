import 'package:api_news/Home/modelClass.dart';
import 'package:flutter/material.dart';
class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  // }
  Widget build(BuildContext context) {
        final data = ModalRoute.of(context)!.settings.arguments;
    print(data);
    Articles article = data as Articles;
    print('Title is ${article.title}');
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(article.title!),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
         Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(article.title!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            Text(
               convertDateTimeDisplay(article.publishedAt!),style: TextStyle(fontSize: 15),
            )
           
          ],
         ),
          Image.network(article.urlToImage!),
          Text(article.description!),
          Text(article.content!),
          Text("Author: ${article.author ?? ""}" ,style: const TextStyle(fontWeight: FontWeight.bold),),
        ]),
      ),
    );
  }
  ///////convert data time to string
  String convertDateTimeDisplay(String date){
    DateTime datetime =DateTime.parse(date);
    return "${datetime.day}/${datetime.month}/${datetime.year}";
  }
}