import 'package:flutter/material.dart';
import '../models/login_models.dart';
import '../themes/colors.dart';

class HomePage extends StatefulWidget {
  final UserModel? user;

  const HomePage({Key? key, this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  bool _isDrawerOpen = false;
  ThemeMode _themeMode = ThemeMode.light;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.85).animate(_controller);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(0.0, 0.0),
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

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: Material(
        child: Stack(
          children: [
            _buildDrawer(),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Transform.translate(
                    offset: Offset(_isDrawerOpen ? 250 : 0, 0),
                    child: _buildMainContent(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        decoration: BoxDecoration(
          gradient: _themeMode == ThemeMode.light ? AppGradients.backgroundGradient:AppGradients.backgroundGradientDark

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text("Home", style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text("Profile", style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text("Settings", style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return GestureDetector(
      onTap: () {
        if (_isDrawerOpen) toggleDrawer();
      },
      
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: toggleDrawer,
            ),
            actions: [
              IconButton(
                icon: Icon(
                  _themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
                ),
                onPressed: toggleTheme,
              ),
            ],
          ),
          body: Column(
            children: [
              const SizedBox(height: 50),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome, ${widget.user?.username ?? 'Guest'}!',
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'User ID: ${widget.user?.id ?? 'N/A'}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      
    );
  }
}
