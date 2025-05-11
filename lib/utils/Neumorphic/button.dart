import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class MyNeumorphicButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const MyNeumorphicButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: onPressed,
      style: NeumorphicStyle(
        color: Colors.white,
        depth: 5,
        intensity: 0.8,
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
