import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {

  const SearchField({
    Key? key,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          
        ),
        
        child: TextField(
          // controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
            border: InputBorder.none,
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.grey[600]),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            suffixIcon: IconButton(
              icon: Icon(Icons.filter_list, color: Colors.grey[600]),
              onPressed: () {
              },
            ),
          ),
        ),
      ),
    );
  }
}
