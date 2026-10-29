import 'package:flutter/widgets.dart';

/// Breakpoints: mobile < 600, tablet 600 to 1024, desktop > 1024.
enum ScreenSize {
  mobile,
  tablet,
  desktop;

  static ScreenSize of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < 600) return mobile;
    if (width <= 1024) return tablet;
    return desktop;
  }
}

extension LayoutContext on BuildContext {
  ScreenSize get screenSize => ScreenSize.of(this);

  bool get isMobile => screenSize == ScreenSize.mobile;

  bool get isDesktop => screenSize == ScreenSize.desktop;

  /// Horizontal page gutter.
  double get gutter => switch (screenSize) {
    ScreenSize.mobile => 16,
    ScreenSize.tablet => 24,
    ScreenSize.desktop => 32,
  };

  /// Vertical space between page sections.
  double get sectionSpacing => isMobile ? 64 : 104;
}

/// Centers [child] in the content column with page gutters.
class ContentWidth extends StatelessWidget {
  const ContentWidth({super.key, required this.child, this.maxWidth = 1200});

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final gutter = context.gutter;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth + gutter * 2),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: gutter),
          child: child,
        ),
      ),
    );
  }
}
