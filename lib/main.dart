import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:interview_task/view/add_asset/addAssetController.dart';
import 'package:interview_task/view/homeview/homeScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());
  Hive.initFlutter();
  var box=await Hive.openBox('assetBox');

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Addassetcontroller(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homeview(),
      ),
    );
  }
}
