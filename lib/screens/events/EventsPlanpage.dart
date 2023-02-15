import 'package:flutter/material.dart';

class EventsPlanPage extends StatefulWidget {
  @override
  _EventsPlanPageState createState() => _EventsPlanPageState();
}

class _EventsPlanPageState extends State<EventsPlanPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _lineAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _lineAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _lineAnimation,
        builder: (context, child) {
          return Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: CustomPaint(
                  painter: LinePainter(_lineAnimation.value),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2 - 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildEventCard(
                            context,
                            'https://picsum.photos/300/200',
                            'Event 1',
                          ),
                          _buildEventCard(
                            context,
                            'https://picsum.photos/300/200',
                            'Event 2',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 2 - 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildEventCard(
                            context,
                            'https://picsum.photos/300/200',
                            'Event 3',
                          ),
                          _buildEventCard(
                            context,
                            'https://picsum.photos/300/200',
                            'Event 4',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildEventCard(BuildContext context, String imageUrl, String title) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 32,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150,
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final double animationValue;

  LinePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    var startPoint = Offset(0, size.height * (1 - animationValue));
    var endPoint = Offset(size.width, size.height * (1 - animationValue));
    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) =>
      animationValue != oldDelegate.animationValue;
}
