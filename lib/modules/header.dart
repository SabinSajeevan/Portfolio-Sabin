import 'package:flutter/material.dart';
import 'package:portfolio_sabin/constants/colors.dart';
import 'package:portfolio_sabin/helpers/helpers.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection>
    with TickerProviderStateMixin {
  // --- COPY ---
  final String _badge = "Available for Senior & Lead Flutter roles";

  final String _headline =
      "Senior Flutter Developer\n6 Years · 10+ Production Apps Shipped";

  final String _subtext =
      "I specialise in cross-platform Flutter development across fintech, "
      "microfinance, real estate, and IoT. My flagship personal project is "
      "TableTag — a Flutter POS & QR menu system built with Riverpod codegen, "
      "GoRouter, and Firebase. Open to Senior and Lead Flutter roles, remote or hybrid.";

  // --- LINKS ---
  final String _cvURL =
      "https://drive.google.com/file/d/1DRG9q-i84mJOMa0HEkBUmq4FiC4uGMQp/view?usp=sharing";
  final String _githubURL = "https://github.com/sabinsajeevan";
  final String _linkedinURL = "https://linkedin.com/in/sabin-sajeevan";

  late AnimationController _welcomeController;

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
  }

  @override
  void dispose() {
    _welcomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = !ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

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
              padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
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
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Senior Flutter Developer  ·  6+ Years  ·  25+ Apps Shipped",
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
                        color: primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: primary.withOpacity(0.35), width: 1),
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
                      _PrimaryButton(
                        label: "View Resume",
                        onTap: () => openUrl(_cvURL, newWindow: true),
                      ),
                      _OutlineButton(
                        label: "GitHub",
                        iconAsset: "assets/images/profile_image.jpg",
                        onTap: () => openUrl(_githubURL, newWindow: true),
                      ),
                      _OutlineButton(
                        label: "LinkedIn",
                        iconAsset: "assets/images/profile_image.jpg",
                        onTap: () => openUrl(_linkedinURL, newWindow: true),
                      ),
                    ],
                  ),
                ],
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
                'assets/images/profile_image.jpg',
                width: 320,
                height: 320,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── BUTTON WIDGETS ────────────────────────────────────────────────────────────

class _PrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _PrimaryButton({required this.label, required this.onTap});

  @override
  State<_PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<_PrimaryButton> {
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
          decoration: BoxDecoration(
            color: _hovered ? primary.withOpacity(0.85) : primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class _OutlineButton extends StatefulWidget {
  final String label;
  final String? iconAsset;
  final VoidCallback onTap;

  const _OutlineButton({
    required this.label,
    required this.onTap,
    this.iconAsset,
  });

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
            color: _hovered ? primary.withOpacity(0.07) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hovered ? primary : primary.withOpacity(0.4),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.iconAsset != null) ...[
                Image.asset(widget.iconAsset!, width: 16, height: 16),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: TextStyle(
                  color: primary,
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
