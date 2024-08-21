// import 'package:flutter/material.dart';
//
// import '../bottomnavpages/bottomnav.dart';
//
// class SearchBar3 extends StatefulWidget {
//   @override
//   _SearchBar3State createState() => _SearchBar3State();
// }
//
// class _SearchBar3State extends State<SearchBar3> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   final List<String> _hintTexts = [
//     'Search bar',
//     'Search food',
//     'Search gym',
//   ];
//   int _currentIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1),
//     );
//
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     );
//
//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         setState(() {
//           _currentIndex = (_currentIndex + 1) % _hintTexts.length;
//         });
//         _controller.reset();
//         _controller.forward();
//       }
//     });
//
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => BottomNavPage(initialIndex: 1)),
//         );
//       },
//       child: AbsorbPointer(
//         child: Stack(
//           alignment: Alignment.centerLeft,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 hintText: '', // Keep this empty
//                 prefixIcon: Icon(Icons.search),
//                 suffixIcon: Icon(Icons.mic),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 48, // Adjust this value to align with the search icon
//               child: AnimatedBuilder(
//                 animation: _animation,
//                 builder: (context, child) {
//                   return ClipRect(
//                     child: SizedBox(
//                       height: 24, // Adjust this height as needed
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Transform.translate(
//                             offset: Offset(0, -24 * _animation.value),
//                             child: Opacity(
//                               opacity: 1 - _animation.value,
//                               child: Text(
//                                 _hintTexts[_currentIndex],
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Transform.translate(
//                             offset: Offset(0, -24 * _animation.value),
//                             child: Opacity(
//                               opacity: _animation.value,
//                               child: Text(
//                                 _hintTexts[(_currentIndex + 1) % _hintTexts.length],
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'dart:async';

import '../bottomnavpages/bottomnav.dart';

class SearchBar3 extends StatefulWidget {
  @override
  _SearchBar3State createState() => _SearchBar3State();
}

class _SearchBar3State extends State<SearchBar3> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  int _currentIndex = 0;
  // final List<String> _hintTexts = [
  //   'Search bar',
  //   'Search food',
  //   'Search gym',
  // ];
  final List<String> _hintTexts = [
    'Search for restaurants, cafes, and more...',
    'Find the best places to eat...',
    'Search for gyms, spas, and fitness centers...',
    'Discover top-rated bars and nightlife...',
    'Search for hotels and accommodations...',
    'Find local businesses near you...',
    'Search for salons, barbers, and beauty services...',
    'Explore parks and outdoor activities...',
    'Search for shopping and retail stores...',
    'Find the best coffee shops in town...',
  ];

  Timer? _timer;

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _startAnimation();
  }

  void _startAnimation() {
    _controller.forward().then((_) {
      _timer = Timer(Duration(seconds: 5), () {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _hintTexts.length;
        });
        _controller.reset();
        _startAnimation();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNavPage(initialIndex: 1)),
        );
      },
      child: AbsorbPointer(
        child: Stack(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: '', // Keep this empty
                prefixIcon: Icon(Icons.search),
                // suffixIcon: Icon(Icons.mic),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Positioned(
              left: 48, // Adjust this value to align with the search icon
              top: 0,
              bottom: 0,
              right: 48, // Add right position to constrain width
              child: Center(
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return ClipRect(
                      child: Container(
                        height: 18,
                        child: Stack(
                          children: [
                            Positioned(
                              top: -20 * _animation.value,
                              left: 0,
                              right: 0,
                              child: Opacity(
                                opacity: 1 - _animation.value,
                                child: Text(
                                  _hintTexts[_currentIndex],
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.5,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20 - 20 * _animation.value,
                              left: 0,
                              right: 0,
                              child: Opacity(
                                opacity: _animation.value,
                                child: Text(
                                  _hintTexts[(_currentIndex + 1) % _hintTexts.length],
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}