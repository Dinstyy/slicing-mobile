import 'package:flutter/material.dart';
import 'cart_screen.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String title;
  final String price;

  const DetailScreen({
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: _buildCircularIcon(Icons.arrow_back, () => Navigator.pop(context)),
        ),
        title: Text(
          'Details',
          style: TextStyle(color: Colors.yellow),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: _buildCircularIcon(Icons.shopping_cart, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/berger.png', // Sesuaikan dengan gambar yang kamu punya
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 24),
                  const SizedBox(width: 4),
                  Text("4.8", style: TextStyle(fontSize: 18, color: Colors.white)),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${widget.price}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                  Row(
                    children: [
                      _buildCircularIcon(Icons.remove, () {
                        if (quantity > 0) {
                          setState(() {
                            quantity--;
                          });
                        }
                      }),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "$quantity",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      _buildCircularIcon(Icons.add, () {
                        setState(() {
                          quantity++;
                        });
                      }),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Ingredients',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IngredientCard(label: 'Cheese', image: 'assets/images/cheese.jpeg'),
                  IngredientCard(label: 'Onion', image: 'assets/images/onion.jpeg'),
                  IngredientCard(label: 'Meat', image: 'assets/images/meat.jpeg'),
                  IngredientCard(label: 'Vegetable', image: 'assets/images/vegetable.jpeg'),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                'A cheeseburger is a hamburger topped with cheese. The cheese is usually added to the cooking hamburger patty. You can customize it with extra ingredients for a richer taste.',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add to cart logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add to cart",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularIcon(IconData icon, VoidCallback onPressed) {
    return Container(
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
        icon: Icon(icon, color: Colors.yellow),
        onPressed: onPressed,
        iconSize: 24,
        padding: EdgeInsets.zero,
      ),
    );
  }
}

class IngredientCard extends StatelessWidget {
  final String label;
  final String image;

  const IngredientCard({
    required this.label,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.white)),
      ],
    );
  }
}