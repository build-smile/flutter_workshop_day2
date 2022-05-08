import 'package:flutter/material.dart';
import 'package:flutter_workshop/models/stock.dart';
import 'package:flutter_workshop/networks/inventoryAPI.dart';
import 'package:flutter_workshop/networks/userAPI.dart';

class StockList extends StatefulWidget {
  const StockList({Key? key}) : super(key: key);

  @override
  State<StockList> createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  InventoryAPI inventoryAPI = InventoryAPI();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: inventoryAPI.getAll(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Stock?>? stocks = snapshot.data;
            return ListView.builder(
                itemCount: stocks!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('${stocks[index]!.description}'),
                    subtitle: Text('stock :${stocks[index]!.stock}'),
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addform');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
