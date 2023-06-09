import 'package:flutter/material.dart';
import 'package:untitled/ui/inspection_application.dart';
import 'package:untitled/ui/inspection_dashboard.dart';
import 'package:untitled/utils/base_state.dart';
import '../utils/app_styles.dart';
import '../utils/app_utils.dart';


class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends BaseState<HomePageScreen> {
  late String _title = translate('inspection_application');
  List<Widget> bodyWidgets = [
    const InspectionApplication(),
    const InspectionDashboard(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(_title),backgroundColor: const Color(0xFF0D47A1),),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu_rounded,
              color: AppStyles.white,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),

        backgroundColor: AppStyles.primary500Color,
        elevation: 0,

        title: Text(
          _title ,
          style:  const TextStyle(color: AppStyles.white),
        ),
        titleSpacing: 0,
        actions: [

          PopupMenuButton(
            // add icon, by default "3 dot" icon
            icon: Icon(Icons.book),
              itemBuilder: (context){
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text("My Account"),
                  ),

                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text("Settings"),
                  ),

                  const PopupMenuItem<int>(
                    value: 2,
                    child: Text("Logout"),
                  ),
                ];
              },
              onSelected:(value){
                if(value == 0){
                  print("My account menu is selected.");
                }else if(value == 1){
                  print("Settings menu is selected.");
                }else if(value == 2){
                  print("Logout menu is selected.");
                }
              }
          ),


        ],
      ),
      drawer: Drawer(

        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             const DrawerHeader(
              decoration: BoxDecoration(
                color: AppStyles.primary500Color,
              ),
              child: null,
            ),
            ListTile(
              title:  Text(translate('inspection_application')),
              onTap: () {
                AppUtils.dashboardIndexStream.add(0);
                setState(() {
                  _title =  translate('inspection_application');
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title:  Text(translate('inspection_dashboard')),
              onTap: () {
                AppUtils.dashboardIndexStream.add(1);
                setState(() {
                  _title = translate('inspection_dashboard');
                });
                Navigator.pop(context);
              },
            ),
            // ListTile(
            //   title:  Text(translate('logout')),
            //   onTap: () {
            //     AppUtils.dashboardIndexStream.add(2);
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        ),
      ),
      body: StreamBuilder<int>(
          stream: AppUtils.dashboardIndexStream,
          builder: (context, snapshot) {
            return bodyWidgets[snapshot.data ?? 0];
          }),

    );
  }
}
