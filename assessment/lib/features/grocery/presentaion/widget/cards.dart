import 'package:assessment/features/grocery/domain/entities/grocery.dart';
import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  final GroceryEntity grocery; 

  Cards({required this.grocery, super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 160,
      width: 140,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
           BoxShadow(
            color:  Color(0XFF0D0A2C),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), 
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
            ClipRRect(
              
              borderRadius: BorderRadius.circular(20), // Ensure the image has the same radius as the container
              child: SizedBox(
                height: 90,
                width: 130,
                child: Image.network(
                  widget.grocery.imageUrl, // Use the image URL passed from the widget
                  fit: BoxFit.cover, // Ensure the image covers the container
                ),
              ),
            ),
              Positioned(
                top: 10,
                left: 10,
                child: Image.asset('assets/images/ButtonIcon.png', height: 20),  
              ),
            ],
          ),

          const SizedBox(height: 5),
          Text(widget.grocery.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Colors.yellow, size: 15),
              const SizedBox(width: 5),
              Text('${widget.grocery.rating}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 5),
          Text('\$${widget.grocery.price}', style: const TextStyle(color: Color(0xFFFF6347),fontSize: 16, fontWeight: FontWeight.bold),),
        ],
      ),

      );
  }
}