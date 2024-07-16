import 'package:deliveryappfood/cart_model.dart';
import 'package:deliveryappfood/cart_page.dart';
import 'package:deliveryappfood/grocery_item_title.dart';
import 'package:deliveryappfood/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   String? name;
  getthedatafromsharedpref() async {
    name= await SharedpreferenceHelper().getUserName();
    setState(() {});
  }

  getontheload() async {
    await getthedatafromsharedpref();
    setState(() {});
  }
  @override
  void initState() {
    getontheload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
              children: [
                const Text(
                  "Hello, ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  (name!),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                )
              ],
            ),
            const Text(
              "Welcome back",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle:
                      const TextStyle(fontSize: 15, color: Colors.black26),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black87,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset("images/mmmm.jpg"),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended for you",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Expanded(child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                    itemBuilder: (context, index) {
                      return GroceryItemTitle(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        itemDescription: value.shopItems[index][3],
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index);
                        },
                      );
                    },
                  );
                },
              )),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const CartPage();
            },
          ));
        },
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
    );
  }
}
