import 'package:file_picker/file_picker.dart'; // Import file_picker package
import 'package:flutter/material.dart';
import 'package:burger_app/profile_screen.dart';
import 'order_screen.dart';

class AddDataScreen extends StatefulWidget {
  @override
  _AddDataScreenState createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  final List<String> categories = ['Makanan', 'Minuman', 'Lainnya'];
  String? selectedCategory = 'Makanan';
  String? selectedImagePath; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
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
              icon: const Icon(Icons.arrow_back, color: Colors.yellow),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => OrderScreen()),
                );
              },
              iconSize: 24,
              padding: EdgeInsets.zero,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
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
                icon: const Icon(Icons.person, color: Colors.yellow),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField("Nama Produk", "Masukan nama produk"),
            SizedBox(height: 16),
            _buildTextField("Harga", "Masukan Harga", keyboardType: TextInputType.number),
            SizedBox(height: 16),
            _buildDropdown("Kategori produk", categories, selectedCategory, (newValue) {
              setState(() {
                selectedCategory = newValue!;
              });
            }),
            SizedBox(height: 16),
            _buildFilePickerField(context, "Image", "Choose file"),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Submit action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                shadowColor: Colors.transparent,
              ),
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, color: Colors.white)),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: TextField(
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.white), // Warna hint menjadi putih
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.black, // Background warna hitam seperti "Choose file"
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? selectedItem, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, color: Colors.white)),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: DropdownButtonFormField<String>(
            value: selectedItem,
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: TextStyle(color: Colors.white)),
              );
            }).toList(),
            onChanged: onChanged,
            style: TextStyle(color: Colors.white),
            dropdownColor: Colors.black, // Background warna dropdown hitam
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.black, // Warna background dropdown hitam
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilePickerField(BuildContext context, String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, color: Colors.white)),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
            if (result != null) {
              setState(() {
                selectedImagePath = result.files.single.path;
              });
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedImagePath != null ? selectedImagePath!.split('/').last : hint,
                  style: TextStyle(color: Colors.white),
                ),
                Icon(Icons.file_upload, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}