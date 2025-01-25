import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store/models/cart_model.dart';
import 'package:sneaker_store/models/shoe_model.dart';

import '../components/shoe_tile.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {

  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    showDialog(context: context, builder: (context) =>
        AlertDialog(title: Text('Successfully Added!'), content: Text('Check your cart'),)

    );}


  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) =>  Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Search', style: TextStyle(color: Colors.grey),
                ),
                Icon(Icons.search, color: Colors.grey,)
              ],
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Text("Everyone files... Some fly longer than others", style:
            TextStyle(color: Colors.grey[600]),),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 25.0), child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text('Hot Picks 🔥',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,

              ),
              ),
              Text('See all', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),)
            ],
          ),
          ),
          SizedBox(height: 10,),

          Expanded(child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {

           Shoe shoe = value.getShoeList()[index];
            return ShoeTile(

              shoe: shoe,
              onTap: ()=> addShoeToCart(shoe),
            );
          },)
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
            child: Divider(color: Colors.white,),
          )
        ],

      ),
    );
  }
}
