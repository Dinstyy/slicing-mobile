import 'package:flutter/material.dart';
import 'package:burger_app/profile_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int quantityBurgerKingMedium = 3;
  int quantityTehBotol = 1;
  int quantityBurgerKingSmall = 5;
  int quantityPizza = 2;
  int quantityPasta = 4;

  // Track clicked state for each item
  List<bool> _isClicked = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Cart',
          style: TextStyle(
              color: Colors.yellow, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: _buildCircleIcon(
          icon: Icons.arrow_back,
          onTap: () => Navigator.pop(context),
        ),
        actions: [
          _buildCircleIcon(
            icon: Icons.person,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          SizedBox(height: 20),
          _buildCartItem('Burger', 'IDR 60.000', quantityBurgerKingMedium, 'assets/images/nagih.jpeg', 0),
          SizedBox(height: 12),
          _buildCartItem('Pizza', 'IDR 20.000', quantityTehBotol, 'assets/images/nagih.jpeg', 1),
          SizedBox(height: 12),
          _buildCartItem('Ice Cream', 'IDR 100.000', quantityBurgerKingSmall, 'assets/images/nagih.jpeg', 2),
          SizedBox(height: 12),
          _buildCartItem('Sandwich', 'IDR 80.000', quantityPizza, 'assets/images/nagih.jpeg', 3),
          SizedBox(height: 12),
          _buildSummary(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Continue Pay',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleIcon({required IconData icon, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: IconButton(
          icon: Icon(icon, color: Colors.yellow),
          onPressed: onTap,
        ),
      ),
    );
  }

  Widget _buildCartItem(
      String title, String price, int quantity, String imagePath, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isClicked[index] = !_isClicked[index];
        });
      },
      child: Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: _isClicked[index] ? Colors.yellow : Colors.transparent,
              width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(imagePath, width: 60, height: 60),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    SizedBox(height: 4),
                    Text(price, style: TextStyle(color: Colors.grey[400])),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove_circle,
                              color: Colors.grey, size: 20),
                          onPressed: () {
                            setState(() {
                              if (index == 0 && quantityBurgerKingMedium > 0)
                                quantityBurgerKingMedium--;
                              if (index == 1 && quantityTehBotol > 0)
                                quantityTehBotol--;
                              if (index == 2 && quantityBurgerKingSmall > 0)
                                quantityBurgerKingSmall--;
                              if (index == 3 && quantityPizza > 0)
                                quantityPizza--;
                              if (index == 4 && quantityPasta > 0)
                                quantityPasta--;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            '${_getQuantity(index)}',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add_circle,
                              color: Colors.grey, size: 20),
                          onPressed: () {
                            setState(() {
                              if (index == 0) quantityBurgerKingMedium++;
                              if (index == 1) quantityTehBotol++;
                              if (index == 2) quantityBurgerKingSmall++;
                              if (index == 3) quantityPizza++;
                              if (index == 4) quantityPasta++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert, color: Colors.white),
                onSelected: (value) {
                  if (value == 'delete') {
                    // Handle deletion logic
                  }
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 'delete',
                    child: Text('Delete'),
                  ),
                ],
              ),
            ],
          ),
        ),
        elevation: 4,
        shadowColor: Colors.white,
      ),
    );
  }

  int _getQuantity(int index) {
    switch (index) {
      case 0:
        return quantityBurgerKingMedium;
      case 1:
        return quantityTehBotol;
      case 2:
        return quantityBurgerKingSmall;
      case 3:
        return quantityPizza;
      case 4:
        return quantityPasta;
      default:
        return 0;
    }
  }

  Widget _buildSummary(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ringkasan Belanja',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          _buildSummaryRow('PPN 11%', 'Rp 10.000,00'),
          _buildSummaryRow('Total belanja', 'Rp 94.000,00'),
          Divider(thickness: 1, color: Colors.white),
          _buildSummaryRow('Total Pembayaran', 'Rp 104.000,00', isTotal: true),
        ],
      ),
    );
  }
  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isTotal ? Colors.yellow : Colors.white,
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: isTotal ? Colors.yellow : Colors.white,
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}