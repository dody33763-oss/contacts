import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const RouteApp());
}

class RouteApp extends StatelessWidget {
  const RouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF004182),
        primaryColor: const Color(0xFF004182),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _animationController.forward();

    // Navigate to HomeScreen after 3 seconds
    _timer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF004182),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF004182),
              Color(0xFF002E5D),
            ],
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Image.asset(
                'assets/images/route_logo.png',
                width: 260,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback vector painter if asset fails to load
                  return const CustomRouteLogo(width: 260, height: 100);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom vector painter for Route Logo as a fallback
class CustomRouteLogo extends StatelessWidget {
  final double width;
  final double height;

  const CustomRouteLogo({
    super.key,
    this.width = 240,
    this.height = 90,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _RouteLogoPainter(),
    );
  }
}

class _RouteLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;

    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 64,
      fontWeight: FontWeight.w300,
      letterSpacing: 2.0,
    );

    const textSpan = TextSpan(text: 'Route', style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    final dx = (size.width - textPainter.width) / 2;
    final dy = (size.height - textPainter.height) / 2;
    textPainter.paint(canvas, Offset(dx, dy));

    // Signature flourish under and to the left of 'R'
    final flourishPath = Path()
      ..moveTo(dx - 30, dy + textPainter.height * 0.7)
      ..cubicTo(
        dx - 15, dy + textPainter.height * 0.85,
        dx + 10, dy + textPainter.height * 0.75,
        dx + 25, dy + textPainter.height * 0.7,
      );

    canvas.drawPath(flourishPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
