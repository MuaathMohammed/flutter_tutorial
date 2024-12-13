
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Notifier/ThemeNotifier.dart';
import '../models/login_models.dart';

class HomePage extends StatefulWidget {
  late  UserModel? user;

   HomePage({super.key, this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  bool _isDrawerOpen = false;
  late UserModel _model;

  @override
  void initState() {
    super.initState();
    //_model=widget.user;
    //print(widget.user);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.85).animate(_controller);
    _slideAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(_controller);
  }

  void toggleDrawer() {
    setState(() {
      if (_isDrawerOpen) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return  Stack(
        children: [
          // Drawer
         _buildDrawer(),
          // Main Content
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Transform.translate(
                  offset: Offset(_isDrawerOpen ? 250 : 0, 0),
                  child: _buildPage(themeProvider,_isDrawerOpen),
                ),
              );
            },
          ),


        ],
      )
    ;
  }

   _buildDrawer() {
  return  SlideTransition(
      position: _slideAnimation,
      child: Material(
        child: Container(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: Icon(Icons.home, ),
                title: Text("Home", ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile",),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildPage(themeProvider,_isDrawerOpen) {

   return GestureDetector(
      onTap: () {
        if (_isDrawerOpen) toggleDrawer();
      },
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(_isDrawerOpen ? 20 : 0),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Home"),

            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: toggleDrawer,
            ),
            actions: [
              IconButton(
                icon: Icon(
                  themeProvider.themeMode == ThemeMode.light
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
                onPressed: () {
                  themeProvider.toggleTheme();
                },
              ),

            ],

          ),
          body: Column(
            children: [
              Center(
                child: Text(
                  "Main Content",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome, ${widget.user?.username}!', style: TextStyle(fontSize: 24)),
                    SizedBox(height: 16),
                    Text('User ID: ${widget.user?.id}', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        // Example of changing state or navigating
                        // You can add more functionality here
                        Navigator.pop(context); // Go back to login screen
                      },
                      child: Text('Logout'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
