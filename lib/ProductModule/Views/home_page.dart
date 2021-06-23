import 'package:api_intregration_getx/ProductModule/Controller/controller.dart';
import 'package:api_intregration_getx/ProductModule/Views/details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final p = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: Container(
          child: GetBuilder<Controller>(
        init: Controller(),
        builder: (context) {
          return ListView.builder(
              itemCount: p.getProducts.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Get.to(DetailsPage()),
                  child: Card(
                    elevation: 0.5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Container(
                          height: 150,
                          width: 150,
                          child: Image.network(
                            p.getProducts[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(p.getProducts[index].title.toString()),
                        subtitle: Text(p.getProducts[index].price),
                      ),
                    ),
                  ),
                );
              });
        },
        initState: (_) {
          p.fetchProduct();
        },
      )),
    );
  }
}
