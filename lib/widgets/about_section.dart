// lib/widgets/about_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import 'section_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 100,
      ),
      child: Column(
        children: [
          const SectionHeader(title: 'About Me', subtitle: 'GET TO KNOW ME'),
          const SizedBox(height: 64),
          isMobile
              ? Column(children: _buildContent(isMobile))
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildContent(isMobile),
                ),
        ],
      ),
    );
  }

  List<Widget> _buildContent(bool isMobile) {
    return [
      // Avatar / visual side
      Flexible(
        flex: isMobile ? 0 : 2,
        child: _buildAvatarCard(isMobile),
      ),
      SizedBox(width: isMobile ? 0 : 60, height: isMobile ? 48 : 0),
      // Text side
      Flexible(
        flex: isMobile ? 0 : 3,
        child: _buildTextContent(isMobile),
      ),
    ];
  }

  Widget _buildAvatarCard(bool isMobile) {
    return Column(
      children: [
        // Avatar
        Container(
          width: 280,
          height: 280,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primary, AppColors.secondary],
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.3),
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Grid pattern
              CustomPaint(
                painter: _GridPainter(),
                child: Container(),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '👨‍💻',
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Bharat Wakade',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Text(
                        'Flutter Developer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).animate().fadeIn(duration: 700.ms).scale(begin: const Offset(0.9, 0.9)),
        const SizedBox(height: 32),
        // Quick info cards
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            _InfoChip(icon: '📍', label: 'Nagpur, Maharashtra'),
            _InfoChip(icon: '🎓', label: 'B.Tech Civil Engg.'),
            _InfoChip(icon: '💼', label: 'Open to Work'),
            _InfoChip(icon: '📱', label: 'Android & iOS'),
          ],
        ),
      ],
    );
  }

  Widget _buildTextContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Passionate about crafting\nexperiences that matter.',
          style: TextStyle(
            fontSize: isMobile ? 24 : 32,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            height: 1.3,
          ),
        ).animate().fadeIn(delay: 200.ms, duration: 700.ms),
        const SizedBox(height: 24),
        Text(
          PortfolioData.bio,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 15,
            height: 1.8,
          ),
        ).animate().fadeIn(delay: 400.ms, duration: 700.ms),
        const SizedBox(height: 40),
        // Tech stack
        Text(
          'TECH STACK',
          style: TextStyle(
            color: AppColors.textMuted,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ).animate().fadeIn(delay: 600.ms),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: PortfolioData.techStack.map((tech) {
            return _TechChip(
              name: tech['name'] as String,
              color: Color(tech['color'] as int),
            );
          }).toList(),
        ).animate().fadeIn(delay: 700.ms, duration: 700.ms),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: const TextStyle(fontSize: 14)),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _TechChip extends StatefulWidget {
  final String name;
  final Color color;

  const _TechChip({required this.name, required this.color});

  @override
  State<_TechChip> createState() => _TechChipState();
}

class _TechChipState extends State<_TechChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: _hovered
              ? widget.color.withOpacity(0.15)
              : AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _hovered ? widget.color.withOpacity(0.5) : AppColors.cardBorder,
          ),
        ),
        child: Text(
          widget.name,
          style: TextStyle(
            color: _hovered ? widget.color : AppColors.textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}



class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.06)
      ..strokeWidth = 1;
    const spacing = 24.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) => false;
}
