import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/model_.dart';
import '../provider/provider_.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Homeprovider? homeproviderFalse;
  Homeprovider? homeproviderTrue;

  @override
  Widget build(BuildContext context) {
    homeproviderFalse = Provider.of(context, listen: false);
    homeproviderTrue = Provider.of(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text("Random Api",style: TextStyle(fontSize: 25),),
        ),
        body: Center(
          child: FutureBuilder(
            future: homeproviderFalse!.findRandomPerson(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                print("${homeproviderTrue!.index}");
                RandomPerson? randomPerson = snapshot.data;
                List<Result>? resultList = randomPerson!.results;
                return Column(
                  children: [
                    SizedBox(height: 5,),
                    Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(height: 10,),
                        Container(
                          margin: EdgeInsetsDirectional.all(10),
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                                color: Colors.white24, width: 5),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadiusDirectional.circular(100),
                            child: Image.network("${resultList![0].picture!.large}",fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "${resultList[0].name!.title}. ${resultList[0].name!.first} ${resultList[0].name!.last}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Text("=>",style: TextStyle(color: Colors.white,fontSize: 18),),
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      " ${resultList[0].location!.street!.number}, ${resultList[0].location!.street!.name}, ${resultList[0].location!.city}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "${resultList[0].location!.state}, ${resultList[0].location!.country} , - ${resultList[0].location!.postcode}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: 30,),
                                  Text("=>",style: TextStyle(color: Colors.white,fontSize: 18),),
                                  Icon(
                                    Icons.email_outlined,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${resultList[0].email}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Text("=>",style: TextStyle(color: Colors.white,fontSize: 18),),
                                Icon(
                                  Icons.call,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${resultList[0].phone}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                SizedBox(
                                  width:30,
                                ),
                                Text("=>",style: TextStyle(color: Colors.white,fontSize: 18),),
                                Icon(
                                  Icons.tag,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${resultList[0].login!.username}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    InkWell(onTap: () {
                      homeproviderFalse!.changeIndex();
                    },child: Icon(Icons.refresh,color: Colors.white,size: 50)),
                  ],
                );
              }
              return CircularProgressIndicator(color: Colors.white,);
            },
          ),
          
        ),
      ),
    );
  }
}