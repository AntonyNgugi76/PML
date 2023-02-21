import 'package:craft_dynamic/craft_dynamic.dart';
import 'package:craft_dynamic/dynamic_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeRepository = HomeRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pride Bank'),
      ),
      body: FutureBuilder<List<ModuleItem>>(
        future: _homeRepository.getMainModules(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ModuleItem>> snapshot) {
              Widget child = Center(
                  // child: Lottie.asset(
                  //     "assets/lottie/loading_list.json")
                    );
          if (snapshot.hasData) {
            var moduleItems = snapshot.data;
            if(moduleItems!=null && moduleItems.isNotEmpty){

               child = GridView.builder(
                itemCount: snapshot.data?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                        mainAxisSpacing: 2

                  ), itemBuilder: (BuildContext context, int index) {
                  return ModuleItemWidget(moduleItem: snapshot.data![index]);


              },
              );
            }
        }
          return child;

        },
      ),
    );
  }
}
