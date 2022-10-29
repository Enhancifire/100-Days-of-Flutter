import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterfire/items.dart';

const COLLECTION_NAME = 'basket_items';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  List<Item> basketItems = [];

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection(COLLECTION_NAME)
        .snapshots()
        .listen((records) {
      mapRecords(records);
    });
    fetchRecords();
  }

  void fetchRecords() async {
    QuerySnapshot<Map<String, dynamic>> records =
        await FirebaseFirestore.instance.collection(COLLECTION_NAME).get();
    mapRecords(records);
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    setState(() {
      basketItems = records.docs
          .map((item) =>
              Item(id: item.id, name: item['name'], quantity: item['quantity']))
          .toList();
    });
  }

  addItem(String name, int quantity) {
    var item = Item(id: 'id', name: name, quantity: quantity);
    FirebaseFirestore.instance.collection(COLLECTION_NAME).add(item.toJson());
  }

  deleteItem(String id) {
    FirebaseFirestore.instance.collection(COLLECTION_NAME).doc(id).delete();

  }

  showItemDialogue() {
    var nameController = TextEditingController();
    var quantityController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    'Item Details',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: nameController,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                      onPressed: () {
                        var name = nameController.text.trim();
                        int quant = int.parse(quantityController.text.trim());
                        addItem(name, quant);
                        Navigator.pop(context);
                      },
                      child:const Text('Add Item'))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basket"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: showItemDialogue, icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: basketItems.length,
        itemBuilder: (context, index) {
          return Slidable(
              endActionPane:
                  ActionPane(motion: const ScrollMotion(), children: [
                SlidableAction(
                  onPressed: (c) {
		  deleteItem(basketItems[index].id);
		  },
                  icon: Icons.delete,
                  label: 'Delete',
                  spacing: 8,
                ),
              ]),
              child: ListTile(
                title: Text('${basketItems[index].name}'),
                subtitle: Text('${basketItems[index].quantity}'),
                onTap: () {},
              ));
        },
      ),
    );
  }
}
