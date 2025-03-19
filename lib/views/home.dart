import 'package:flutter/material.dart';
import 'package:startup/views/home_post.dart';
import 'package:startup/views/live_search.dart';
import 'package:startup/views/re_catholique.dart';
import 'package:startup/views/shorts.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final List<String> _tabs = ['Tout', 'Conventionnée Catholique', 'Privée', 'Conventionnée Ismalique', 'Public'];

  // Define your custom colors here
  final Color _selectedTextColor = Colors.black;
  final Color _unselectedTextColor = Color(0xFF9E9E9E);
  final Color _indicatorColor = Color(0xFF3F51B5);


  // Define the content for each tab
  final List<Widget> _tabContents = [
    HomePost(),
    ReCatholique(),
    Center(child: Text("Content for Tab 3", style: TextStyle(fontSize: 18))),
    Center(child: Text("Content for Tab 4", style: TextStyle(fontSize: 18))),
    Center(child: Text("Content for Tab 5", style: TextStyle(fontSize: 18))),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      appBar: AppBar(

        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset('assets/logo.png', width: 50, height: 50),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) =>  const LiveSearch()),
                    (route) => false);
          }, icon:  Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF8FAFB)
            ),
            child: const Icon(Icons.search, size: 15),
          ),)
        ],

      ),


     body:   Column(
       children:  [
         const Padding(
           padding: EdgeInsets.only(right: 260),
           child: Text('Shorts', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
         ),
         const SizedBox(height: 5,),
         const Shorts(),

        const SizedBox(height: 10,),

         SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: Container(
             color: const Color(0xFFF8FAFB),
             padding: const EdgeInsets.all(14.0),
             child: Row(
               children: List.generate(_tabs.length, (index) {
                 return Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10), // Add spacing
                   child: GestureDetector(
                     onTap: () {
                       setState(() {
                         _selectedIndex = index;
                       });
                     },
                     child: Column(
                       children: [
                         Text(
                           _tabs[index],
                           style: TextStyle(
                             fontSize: 12,
                             fontWeight: _selectedIndex == index ? FontWeight.w500 : FontWeight.w300,
                             color: _selectedIndex == index ? _selectedTextColor : _unselectedTextColor,
                           ),
                         ),
                         const SizedBox(height: 4),
                         Container(
                           height: 8,
                           width: 8,
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             color: _selectedIndex == index ? _indicatorColor : Colors.transparent,
                           ),
                         ),
                       ],
                     ),
                   ),
                 );
               }),
             ),
           ),
         ),
         Expanded(
           child: _tabContents[_selectedIndex],
         ),

       ],
     ),
    );
  }
}
