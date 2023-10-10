import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: ApplePayHomePage(),
    );
  }
}

class ApplePayHomePage extends StatefulWidget {
  const ApplePayHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ApplePayHomePageState createState() => _ApplePayHomePageState();
}

class _ApplePayHomePageState extends State<ApplePayHomePage> {
  int _currentIndex = 1;

  final List<Widget> _pages = [
    CupertinoTabView(
      builder: (context) => const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Cards'),
        ),
        child: Center(
          child: Text('Your cards go here.'),
        ),
      ),
    ),
    CupertinoTabView(
      builder: (context) => const CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0, // Adjust this value as needed
            floating: false, // Set to true for a floating app bar
            pinned: true, // Set to true to make the app bar pinned
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Payment'),
              background: Center(
                child: PaymentPage(),
              ),
            ),
          ),
          SliverFillRemaining(
            child: PaymentPage(),
          ),
        ],
      ),
    ),
    CupertinoTabView(
      builder: (context) => const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Settings'),
        ),
        child: Center(
          child: Text('Settings go here.'),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.creditcard),
            label: 'Cards',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.money_dollar),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return _pages[index];
      },
    );
  }
}

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Payment Options',
            style: TextStyle(fontSize: 24.0),
          ),
          const SizedBox(height: 20.0),
          CupertinoButton.filled(
            child: const Text('Make Payment'),
            onPressed: () {
              // Implement payment logic here
            },
          ),
        ],
      ),
    );
  }
}
