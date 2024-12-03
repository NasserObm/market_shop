// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:market_shop/productScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Fonction pour afficher un carrousel avec des images dans chaque tab
  Widget _buildImageCarousel() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 20),
        child: Row(
          children: [
            _buildImageCard(
              "assets/baies.jpeg",
              const Color(0xffd5d5d5),
              const Color(0xff000000),
            ),
            _buildImageCard("assets/baies.jpeg", const Color(0xff1E263B),
                const Color(0xffFFFFFF)),
            _buildImageCard("assets/baies.jpeg", const Color(0xffd5d5d5),
                const Color(0xff000000)),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCard(String imageUrl, Color color, Color writerColor) {
    return SizedBox(
      width: 400,
      height: 200,
      child: Card(
          color: color,
          margin: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Save Big on Daily Essentials",
                    style: TextStyle(
                        fontSize: 20,
                        color: writerColor,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Get 10% off",
                        style: TextStyle(
                            color: writerColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "All things you need",
                        style: TextStyle(
                            color: writerColor,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: const Center(
                    child: Text("This weeks only",
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
                Text(
                  "Good offer now",
                  style: TextStyle(color: writerColor),
                ),
                Icon(Icons.arrow_forward_ios_outlined, color: writerColor),
              ],
            )
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://www.shareicon.net/data/512x512/2016/07/26/802031_user_512x512.png"),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Search here...",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff34A853),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.place,
                          size: 30,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.green,
                labelColor: Colors.green,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(text: "Popular"),
                  Tab(text: "Grocery"),
                  Tab(text: "Vegetables"),
                  Tab(text: "Flash Sales"),
                ],
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 500,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Column(
                        children: [
                          _buildImageCarousel(),
                        ],
                      ),
                      _buildImageCarousel(),
                      _buildImageCarousel(),
                      _buildImageCarousel(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Text("Recommandations",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text("View all", style: TextStyle(color: Colors.green)),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 280,
                      child: Card(
                        color: Colors.white,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/avocat.jpeg",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Center(
                                child: Text(
                                  "Avocado",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                              const SizedBox(height: 0),
                              const Center(
                                child: Text(
                                  "1kg",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "\$6USD",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add_circle,
                                      color: Colors.black,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 280,
                      child: Card(
                        color: Colors.white,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/banana1.jpg",
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Center(
                                child: Text(
                                  "fresh banana",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Center(
                                child: Text(
                                  "1kg",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "\$20.00 USD",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ProductDetailsPage(),
                                        ),
                                      );
                                    },
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ProductDetailsPage(),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.add_circle,
                                        color: Colors.black,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Row(
                children: [
                  Text("Categories",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text("view all", style: TextStyle(color: Colors.green)),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Card(
                      color: Colors.white,
                      elevation: 1,
                      child: Column(
                        children: [
                          Image.network("assets/cat2.jpg",
                              height: 100, width: 100),
                          const Text("Nom de la catégorie")
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      elevation: 1,
                      child: Column(
                        children: [
                          Image.asset("assets/cat1.jpg",
                              height: 100, width: 100),
                          const Text("Nom de la catégorie")
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            height: 80,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.home, color: Colors.green),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark_outline, color: Colors.grey),
                  onPressed: () {},
                ),
                IconButton(
                  icon:
                      const Icon(Icons.notifications_none, color: Colors.grey),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.person_outline, color: Colors.grey),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
