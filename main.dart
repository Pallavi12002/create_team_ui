import 'package:flutter/material.dart';

void main() {
  runApp(const CreateTeamApp());
}

class CreateTeamApp extends StatelessWidget {
  const CreateTeamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateTeamScreen(),
    );
  }
}

class CreateTeamScreen extends StatefulWidget {
  const CreateTeamScreen({super.key});

  @override
  _CreateTeamScreenState createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {
  List<bool> isAdded = List<bool>.generate(11, (index) => index == 0);
  final List<String> stockNames = [
    'APPLE', 'ZOMATO', 'TATAMOTARS', 'RELIANCE', 'IOC', 'USHAMART', 'SWIGGY', 'NCC', 'APPLE', 'APPLE', 'APPLE'
  ];
  final List<String> prices = [
    '443', '61', '443', '70.70', '443', '443', '443', '443', '443', '443', '443'
  ];
  final List<String> changes = [
    '+1.80', '+1.80', '+1.80', '-0.25', '+1.80', '+1.80', '+1.80', '+1.80', '+1.80', '+1.80', '+1.80'
  ];
  final List<String> percentages = [
    '(4.32%)', '(4.32%)', '(4.32%)', '(-0.35%)', '(4.32%)', '(4.32%)', '(4.32%)', '(4.32%)', '(4.32%)', '(4.32%)', '(4.32%)'
  ];
  final List<Color> changeColors = [
    Colors.green, Colors.green, Colors.green, Colors.red, Colors.green, Colors.green, Colors.green, Colors.green, Colors.green, Colors.green, Colors.green
  ];

  int get teamCount => isAdded.where((item) => item).length;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF7775F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF7775F8),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Create Team'),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/wallet.png'),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.01,
            ),
            child: Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.05,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5)),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search & add',
                  prefixIcon: Image.asset('assets/images/search.png'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.05,
              top: screenHeight * 0.01,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Team ',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    TextSpan(
                      text: '${teamCount.toString().padLeft(2, '0')} ',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const TextSpan(
                      text: '/ 11',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Expanded(
            child: Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.75,
              padding: EdgeInsets.all(screenWidth * 0.035),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                itemCount: stockNames.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.06,
                    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(5)),
                      border: Border.all(color: Colors.grey[300]!, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                          child: Text(
                            stockNames[index],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              prices[index],
                              style: const TextStyle(color: Colors.green), // Current price in green
                            ),
                            Row(
                              children: [
                                Text(
                                  changes[index],
                                  style: TextStyle(color: Colors.black), // Price change color (black)
                                ),
                                SizedBox(width: screenWidth * 0.01),
                                Text(
                                  percentages[index],
                                  style: TextStyle(color: Colors.black), // Percentage change color (black)
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Image.asset(
                            isAdded[index]
                                ? 'assets/images/subtraction.png'
                                : 'assets/images/addition.png',
                          ),
                          onPressed: () {
                            setState(() {
                              isAdded[index] = !isAdded[index];
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
