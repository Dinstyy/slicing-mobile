import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'order_screen.dart';
import 'profile_screen.dart';
import 'detail_screen.dart';
import 'category_list_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _searchQuery = "";

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CartScreen()),
      ).then((_) => setState(() => _selectedIndex = 0)); 
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OrderScreen()),
      ).then((_) => setState(() => _selectedIndex = 0)); 
    }
  }

  final List<Map<String, String>> products = [
    {
      "image": "assets/images/burger.png",
      "title": "Burger King Medium",
      "price": "Rp. 50.000,00",
    },
    {
      "image": "assets/images/ngeteh.png",
      "title": "Teh Botol",
      "price": "Rp. 4.000,00",
    },
    {
      "image": "assets/images/ayam.png",
      "title": "Fried Chicken",
      "price": "Rp. 20.000,00",
    },
    {
      "image": "assets/images/pija.png",
      "title": "Pizza Slice",
      "price": "Rp. 30.000,00",
    },
    {
      "image": "assets/images/senwid.png",
      "title": "Sandwich",
      "price": "Rp. 15.000,00",
    },
    {
      "image": "assets/images/echim.png",
      "title": "Ice Cream",
      "price": "Rp. 10.000,00",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.menu, color: Colors.yellow),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                iconSize: 24,
                padding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.person, color: Colors.yellow),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
                iconSize: 24,
                padding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.grey[900],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                color: Colors.grey[800],
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(color: Colors.grey[700], thickness: 1),
              ListTile(
                leading: Icon(Icons.home, color: Colors.yellow[700], size: 24),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
              ),
              Divider(color: Colors.grey[700], thickness: 0.5),
              ListTile(
                leading: Icon(Icons.shopping_cart, color: Colors.yellow[700], size: 24),
                title: Text(
                  'Cart',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  ).then((_) => setState(() => _selectedIndex = 0));
                },
              ),
              Divider(color: Colors.grey[700], thickness: 0.5),
              ListTile(
                leading: Icon(Icons.receipt_long, color: Colors.yellow[700], size: 24),
                title: Text(
                  'Orders',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderScreen()),
                  ).then((_) => setState(() => _selectedIndex = 0));
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryButton(
                  label: "All",
                  isSelected: true,
                  imagePath: "assets/images/burger.png",
                ),
                CategoryButton(
                  label: "Makanan",
                  imagePath: "assets/images/senwid.png",
                ),
                CategoryButton(
                  label: "Minuman",
                  imagePath: "assets/images/ngeteh.png",
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "All Food",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white70),
                      prefixIcon: Icon(Icons.search, color: Colors.white70),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: products
                    .where((product) => product["title"]!
                        .toLowerCase()
                        .contains(_searchQuery.toLowerCase()))
                    .length,
                itemBuilder: (context, index) {
                  final filteredProducts = products
                      .where((product) => product["title"]!
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase()))
                      .toList();
                  final product = filteredProducts[index];
                  return BurgerCard(
                    image: product["image"]!,
                    title: product["title"]!,
                    price: product["price"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.yellow[700],
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Icon(Icons.home),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Icon(Icons.shopping_cart),
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Icon(Icons.receipt_long),
            ),
            label: "Orders",
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final String imagePath;

  const CategoryButton({
    required this.label,
    this.isSelected = false,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryListScreen(category: label),
          ),
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[800] : Colors.black,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.yellow, width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BurgerCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  const BurgerCard({
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              image: image,
              title: title,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black, // Set the card background to black
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.3), // Light, subtle white shadow
              spreadRadius: 1,  // Thin spread
              blurRadius: 5,    // Small blur for subtle effect
              offset: Offset(0, 2),  // Slight vertical offset for realism
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white, // Change text color to white
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                price,
                style: TextStyle(
                  color: Colors.yellow, // Adjust text color for price if desired
                  fontSize: 12,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(Icons.add_circle, color: Colors.yellow), // Set icon color to yellow
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}