import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';

import 'app_colors.dart';

class CustomInfoTooltip extends StatefulWidget {
  final String message;
  final IconData icon;
  final double size;

  const CustomInfoTooltip({
    super.key,
    required this.message,
    this.icon = Icons.info_outline,
    this.size = 18,
  });

  @override
  State<CustomInfoTooltip> createState() => _CustomInfoTooltipState();
}

class _CustomInfoTooltipState extends State<CustomInfoTooltip> {
  final SuperTooltipController _controller = SuperTooltipController();

  Future<void> _toggle() async {
    if (_controller.isVisible) {
      await _controller.hideTooltip();
    } else {
      await _controller.showTooltip();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SuperTooltip(
      controller: _controller,
      popupDirection: TooltipDirection.up,
      showBarrier: true,
      barrierColor: Colors.transparent,
      backgroundColor: AppColors.background,
      borderRadius: 12,
      arrowLength: 10,
      arrowBaseWidth: 18,
      arrowTipDistance: 10,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 1,
      ),

      boxShadows: [
        BoxShadow(
          color: AppColors.boxShadowPink,
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],

      content: Padding(
        padding: const EdgeInsets.all(12),

        child: Text(
          softWrap: true,
          widget.message,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),

      child: GestureDetector(
        onTap: _toggle,
        child: Icon(widget.icon, size: widget.size, color: AppColors.secText),
      ),
    );
  }
}
