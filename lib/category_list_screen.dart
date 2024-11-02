import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'cart_screen.dart';

class CategoryListScreen extends StatefulWidget {
  final String category;

  CategoryListScreen({required this.category});

  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
List<Map<String, String>> items = [
  // Makanan items
  {"image": "assets/images/berger.png", "title": "Burger King Medium", "price": "Rp. 50.000,00", "category": "Makanan"},
  {"image": "assets/images/berger.png", "title": "Pepperoni Pizza", "price": "Rp. 75.000,00", "category": "Makanan"},
  {"image": "assets/images/berger.png", "title": "Club Sandwich", "price": "Rp. 30.000,00", "category": "Makanan"},
  {"image": "assets/images/berger.png", "title": "Pasta Alfredo", "price": "Rp. 60.000,00", "category": "Makanan"},
  {"image": "assets/images/berger.png", "title": "Caesar Salad", "price": "Rp. 35.000,00", "category": "Makanan"},
  {"image": "assets/images/berger.png", "title": "Chicken Taco", "price": "Rp. 40.000,00", "category": "Makanan"},

  // Minuman items
  {"image": "assets/images/ngeteh.png", "title": "Teh Botol", "price": "Rp. 4.000,00", "category": "Minuman"},
  {"image": "assets/images/ngeteh.png", "title": "Cappuccino", "price": "Rp. 25.000,00", "category": "Minuman"},
  {"image": "assets/images/ngeteh.png", "title": "Orange Juice", "price": "Rp. 15.000,00", "category": "Minuman"},
  {"image": "assets/images/ngeteh.png", "title": "Soda Can", "price": "Rp. 10.000,00", "category": "Minuman"},
  {"image": "assets/images/ngeteh.png", "title": "Mineral Water", "price": "Rp. 5.000,00", "category": "Minuman"},
  {"image": "assets/images/ngeteh.png", "title": "Chocolate Milkshake", "price": "Rp. 30.000,00", "category": "Minuman"},
];

  List<Map<String, String>> filteredItems = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    _filterItems(); // Initialize filtered items
  }

  void _filterItems() {
    setState(() {
      filteredItems = items.where((item) {
        return item["category"] == widget.category &&
            item["title"]!.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: _buildCircularIcon(Icons.arrow_back, () => Navigator.pop(context)),
        ),
        title: Text(
          widget.category,
          style: TextStyle(color: Colors.yellow),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: _buildCircularIcon(
              Icons.shopping_cart,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                    _filterItems();
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[800],
                  prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return BurgerCard(
                    image: item["image"]!,
                    title: item["title"]!,
                    price: item["price"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularIcon(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.yellow),
        onPressed: onPressed,
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
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 2),
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
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                price,
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 12,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(Icons.add_circle, color: Colors.yellow),
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