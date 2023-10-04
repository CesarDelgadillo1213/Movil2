import 'package:flutter/material.dart';

void main() {
  runApp(Pantalla());
}

class Pantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MisPantallas(),
    );
  }
}

class MisPantallas extends StatefulWidget {
  @override
  _MisPantallasState createState() => _MisPantallasState();
}

class _MisPantallasState extends State<MisPantallas> {
  List<CardInfo> cardInfoList = [
    CardInfo(
      name: 'David Borg',
      title: 'Title: Flying wings',
      popularity: 23432,
      like: 23,
      followed: 324,
      ranking: 1,
      image: 'assets/david.png',
    ),
    CardInfo(
      name: 'Lucy',
      title: 'Growing up trouble',
      popularity: 12345,
      like: 67,
      followed: 890,
      ranking: 2,
      image: '',
    ),
    CardInfo(
      name: 'Jerry Cool West',
      title: 'Title: Scultor diary',
      popularity: 9876,
      like: 45,
      followed: 567,
      ranking: 3,
      image: '',
    ),
    CardInfo(
      name: 'Bold',
      title: 'Title: Illustration of little girl',
      popularity: 5432,
      like: 89,
      followed: 123,
      ranking: 4,
      image: '',
    ),
    CardInfo(
      name: 'David Borg',
      title: 'Title: Flying wings',
      popularity: 6789,
      like: 12,
      followed: 432,
      ranking: 5,
      image: '',
    ),
  ];

  List<Color> cardColors = [
    Color.fromARGB(255, 109, 190, 228),
    Color.fromARGB(255, 239, 191, 119),
    Color.fromARGB(255, 223, 128, 121),
    Color.fromARGB(255, 212, 115, 228),
    Color.fromARGB(255, 127, 234, 200),
  ];

  final BorderRadius cardBorderRadius = BorderRadius.circular(20.0);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
          backgroundColor:  Color.fromARGB(255, 212, 115, 228),
          bottom: TabBar(
            indicatorColor: Colors.transparent,
            tabs: [
              Tab(text: 'Designer'),
              Tab(text: 'Category'),
              Tab(text: 'Attention'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: cardInfoList.length,
              itemBuilder: (context, index) {
                CardInfo cardInfo = cardInfoList[index];
                int cardNumber = index + 1;
                Color cardColor = cardColors[index % cardColors.length];
                return Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: cardBorderRadius,
                      ),
                      child: Container(
                        color: cardColor,
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                               backgroundImage: AssetImage(cardInfo.image),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(cardInfo.name, style: TextStyle(fontWeight: FontWeight.bold)),
                                  Text(cardInfo.title),
                                  SizedBox(height: 4.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cardInfo.popularity.toString(),
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Popularity',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 8.0),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cardInfo.like.toString(),
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Like',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 8.0),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cardInfo.followed.toString(),
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Followed',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '...',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  '$cardNumber',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Ranking',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                );
              },
            ),
            Center(child: Text('')),
            Center(child: Text('')),
          ],
        ),
      ),
    );
  }
}

class CardInfo {
  final String name;
  final String title;
  final int popularity;
  final int like;
  final int followed;
  final int ranking;
  final String image;

  CardInfo({
    required this.name,
    required this.title,
    required this.popularity,
    required this.like,
    required this.followed,
    required this.ranking,
    required this.image,
  });
}
