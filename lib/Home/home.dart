import 'dart:convert';

import 'package:api_news/Home/modelClass.dart';
import 'package:api_news/Screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  // newModel  newmodel = newModel();
  // Map<String,dynamic> data ={};
  final url='https://newsapi.org/v2/everything?q=tesla&from=2023-04-08&sortBy=publishedAt&apiKey=41c325968e96448d91dba93ab1adc367';
  Future<newModel> fetchNew() async {
    final response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    print('json = ${json}');
    //  print('Respoone should be :${response.body}');
    // var ListData = jsonDecode(response.body);
    if(response.statusCode==200)
    {
      return newModel.fromJson(json);
    }
    else{
      throw Exception("Failed to load data from api");
    }
  }
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
        title: Text('API NEWS'),
      ),
      body: FutureBuilder(
        future:     fetchNew(),
        builder: (context,AsyncSnapshot<newModel> snapshot){
          if(snapshot.connectionState== ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasError){
            return Center(
              child: Text('Errror Loading data from api'),
            );
          }
        print(snapshot.data);
        if(snapshot.hasData){
          return  ListView.builder(
      itemCount: snapshot.data!.articles?.length,
      itemBuilder: ( context,  index) {
      //  if(newmodel.articles![index].title!= null){
        return GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, '/detail',
            arguments: snapshot.data!.articles![index],
            );
          },
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Container(
              child: Column(children: [
                Text(snapshot.data!.articles![index].title ?? "",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17), ),
                Text(snapshot.data!.articles![index].description ?? ""),
                Text(snapshot.data!.articles![index].content ?? ""),
                snapshot.data!.articles![index].urlToImage == null 
                ?  CircularProgressIndicator():
                Image.network(snapshot.data!.articles![index].urlToImage! )
              ]),
            ),
          ),
        );
      //  }
      //  else{
      //   return Container(
      //    child:  CircularProgressIndicator(),
      //   );
      //  }
         },
      );
          
      }
      else if(snapshot.hasError){
        return const Center(
          child: Text('Error Code'),
        );
      }
      else{
        return  const Center(
          child: CircularProgressIndicator(),
        );
      }
      }),

    );
  }
}
