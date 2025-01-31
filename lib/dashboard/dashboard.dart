
import 'package:edu_app01/constants.dart';
import 'package:flutter/material.dart';

final List<String> newsHead = [
  "Breaking News: Flutter 3.0 Released!",
  "New iPhone Model Announced",
  "Stock Market Hits New Highs",
  "Scientists Discover New Planet",
  "Global Warming: What Can We Do?",
  "Tech Giants Partner on New AI Initiative",
  "Major Earthquake Strikes Japan",
  "World Leaders Meet to Discuss Climate Change",
  "Electric Cars: The Future of Transportation",
  "Local Sports Team Wins Championship"
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List to track whether each headline has been liked (true means liked)
  List<bool> liked = List.generate(10, (index) => false);
  final List<String> subjects = [
    "Mathematics",
    "Science",
    "History",
    "English Literature",
    "Computer Science",
    "Geography"
  ];
  List<Color> colors = [
    Colors.orangeAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.blueGrey,
    Colors.yellowAccent,
    Colors.amberAccent,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.6),
                        radius: 40,
                        child: const Icon(
                          Icons.person,
                          size: 36,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name"),
                          Text("Designation"),
                        ],
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.notifications),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Subjects",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 160,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: SizedBox(
                        width: 200,
                        child: Card(
                          elevation: 5,
                          color: colors[index],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.school,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    subjects[index],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "News",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  CustomTextButton(
                    title: "All",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomTextButton(
                    title: "Todays",
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: newsHead.length,
                  itemBuilder: (context, index) => ListTile(
                    title: SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: Card(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  AssetConstants.imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      newsHead[index],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          // Toggle the like state
                                          setState(() {
                                            liked[index] = !liked[index];
                                          });
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          color: liked[index]
                                              ? Colors.red
                                              : Colors.grey,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          // Toggle the like state
                                          setState(() {
                                            liked[index] = !liked[index];
                                          });
                                        },
                                        icon: Icon(
                                          Icons.bookmark,
                                          color: liked[index]
                                              ? Colors.red
                                              : Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String title;
  const CustomTextButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.withOpacity(0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title),
      ),
    );
  }
}
