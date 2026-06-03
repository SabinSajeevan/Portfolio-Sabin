import 'package:portfolio_sabin/constants/colors.dart';
import 'package:portfolio_sabin/helpers/helpers.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:s_banner/s_banner.dart';
import 'package:flutter_animate/flutter_animate.dart';
class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection>
    with TickerProviderStateMixin {
  // --- COPY ---
  final String _badge = "Let’s Work Together";

  final String _subtext =
      "Specialized in scalable Flutter architecture, Firebase systems, and production-grade cross-platform applications. Built solutions across fintech, POS, IoT, and enterprise domains using Riverpod, GoRouter, gRPC, and clean architecture principles.";

  // --- LINKS ---
  final String _cvURL =
      "https://drive.google.com/file/d/1Sq0c758mh6aVto8UHI8WTQM7ne-aupv5/view?usp=sharing";
  final String _githubURL = "https://github.com/sabinsajeevan";
  final String _linkedinURL = "https://linkedin.com/in/sabin-sajeevan";

  late AnimationController _welcomeController;

  late AnimationController _cvController;
  late AnimationController _linkedinController;
  late AnimationController _githubController;

  @override
  void initState() {
    super.initState();
    _welcomeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1400));
    _welcomeController.forward();
    _welcomeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 5000), () {
          if (mounted) _welcomeController.forward(from: 0.0);
        });
      }
    });

    _cvController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _linkedinController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _githubController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
  }

  @override
  void dispose() {
    _welcomeController.dispose();
    _cvController.dispose();
    _githubController.dispose();
    _linkedinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = !ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      width: double.infinity,
      margin: blockMargin,
      padding: blockPadding(context),
      child: ResponsiveRowColumn(
        layout: isDesktop
            ? ResponsiveRowColumnType.ROW
            : ResponsiveRowColumnType.COLUMN,
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ── TEXT COLUMN ──────────────────────────────────────────────
          ResponsiveRowColumnItem(
            rowFlex: 3,
            columnOrder: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 2, 25, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Greeting row
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: buildMaterialIconCircle(
                          imagePath: "assets/animation/welcome.json",
                          size: 68,
                          controller: _welcomeController,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Flexible(
                        child: Text(
                          "Hi, everyone! I'm",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),

                  // Main headline
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      "Sabin Sajeevan",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),

                  // Positioning sub-headline
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 8, right: screenWidth * 0.1),
                    child: Text(
                      "Building production-grade Flutter apps with Firebase, Riverpod, AI workflows & scalable architecture.",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: primary,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                          ),
                    ),
                  ),

                  // Availability badge
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: primary, width: 1),
                      ),
                      child: Text(
                        "● $_badge",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: primary,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),

                  // Subtext paragraph
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Text(
                      _subtext,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),

                  // CTA buttons
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      // _PrimaryButton(
                      //   label: "View Resume",
                      //   animationController: _cvController,
                      //   iconAsset: "assets/animation/scan.json",
                      //   onTap: () => openUrl(_cvURL, newWindow: true),
                      // ),
                      _OutlineButton(
                        label: "Resume",
                        animationController: _cvController,
                        imageSize: 25,
                        iconAsset: "assets/animation/resume.json",
                        onTap: () => openUrl(_cvURL, newWindow: true),
                      ),
                      _OutlineButton(
                        label: "GitHub",
                        animationController: _githubController,
                        iconAsset: "assets/animation/git.json",
                        onTap: () => openUrl(_githubURL, newWindow: true),
                      ),
                      _OutlineButton(
                        label: "LinkedIn",
                        animationController: _linkedinController,
                        iconAsset: "assets/animation/linkedin.json",
                        onTap: () => openUrl(_linkedinURL, newWindow: true),
                      ),
                    ],
                  ),
                ].animate(interval: 100.ms).fade(duration: 500.ms).slideY(begin: 0.1, end: 0),
              ),
            ),
          ),

          // ── PHOTO ────────────────────────────────────────────────────
          ResponsiveRowColumnItem(
            rowFlex: 2,
            columnOrder: 1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.antiAlias,
              elevation: 10.0,
              child: Image.asset(
                'assets/images/profile_image.webp',
                width: 320,
                height: 320,
                fit: BoxFit.cover,
                alignment: AlignmentGeometry.directional(0, -0.6),
              ),
            ).animate().fade(duration: 800.ms).scale(begin: const Offset(0.9, 0.9), curve: Curves.easeOutBack),
          ),
        ],
      ),
    );
  }
}

// ── BUTTON WIDGETS ────────────────────────────────────────────────────────────

class _OutlineButton extends StatefulWidget {
  final String label;
  final String? iconAsset;
  final VoidCallback onTap;
  final double? imageSize;
  final AnimationController? animationController;

  const _OutlineButton(
      {required this.label,
      required this.onTap,
      this.animationController,
      this.imageSize,
      this.iconAsset});

  @override
  State<_OutlineButton> createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<_OutlineButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: _hovered ? primary : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            // border: Border.all(
            //   color: _hovered ? primary : primary.withValues(alpha: 0.4),
            //   width: 1,
            // ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.iconAsset != null) ...[
                buildMaterialIconCircle(
                  imagePath: widget.iconAsset,
                  size: 50,
                  imageSize: widget.imageSize ?? 40,
                  controller: widget.animationController,
                ),
                // Image.asset(widget.iconAsset!, width: 16, height: 16),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: TextStyle(
                  color: _hovered ? white : primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
