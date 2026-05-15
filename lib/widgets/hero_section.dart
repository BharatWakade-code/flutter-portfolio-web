// lib/widgets/hero_section.dart
import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onContactTap;
  final VoidCallback onProjectsTap;

  const HeroSection({
    super.key,
    required this.onContactTap,
    required this.onProjectsTap,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  int _roleIndex = 0;
  String _displayText = '';
  bool _isDeleting = false;
  int _charIndex = 0;
  late Timer _timer;
  late AnimationController _particleController;

  @override
  void initState() {
    super.initState();
    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
    _startTypewriter();
  }

  void _startTypewriter() {
    _timer = Timer.periodic(const Duration(milliseconds: 80), (timer) {
      final currentRole = PortfolioData.roles[_roleIndex];
      setState(() {
        if (!_isDeleting) {
          if (_charIndex < currentRole.length) {
            _displayText = currentRole.substring(0, _charIndex + 1);
            _charIndex++;
          } else {
            // Pause before deleting
            timer.cancel();
            Future.delayed(const Duration(milliseconds: 1500), () {
              _isDeleting = true;
              _startTypewriter();
            });
          }
        } else {
          if (_charIndex > 0) {
            _displayText = currentRole.substring(0, _charIndex - 1);
            _charIndex--;
          } else {
            _isDeleting = false;
            _roleIndex = (_roleIndex + 1) % PortfolioData.roles.length;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: [
          // Animated background gradient
          _buildBackground(size),
          // Particle effect
          AnimatedBuilder(
            animation: _particleController,
            builder: (_, __) => CustomPaint(
              painter: ParticlePainter(_particleController.value),
              size: size,
            ),
          ),
          // Content
          Positioned.fill(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 80, bottom: 60),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: isMobile
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: isMobile ? 20 : 40),
                    // Badge
                    _buildBadge(isMobile),
                    const SizedBox(height: 24),
                    // Name
                    _buildName(isMobile),
                    const SizedBox(height: 12),
                    // Typewriter role
                    _buildTypewriter(isMobile),
                    const SizedBox(height: 20),
                    // Description
                    _buildDescription(isMobile),
                    const SizedBox(height: 36),
                    // CTA Buttons
                    _buildButtons(isMobile),
                    const SizedBox(height: 48),
                    // Stats
                    _buildStats(isMobile),
                  ],
                ),
              ),
            ),
          ),
          // Scroll indicator
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: _buildScrollIndicator(),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground(Size size) {
    return Positioned.fill(
      child: Stack(
        children: [
          // Radial gradient top left
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.12),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Radial gradient bottom right
          Positioned(
            bottom: -100,
            right: -100,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.secondary.withOpacity(0.12),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(bool isMobile) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(100),
        color: AppColors.primary.withOpacity(0.08),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColors.success,
              shape: BoxShape.circle,
            ),
          )
              .animate(onPlay: (c) => c.repeat())
              .fadeIn(duration: 800.ms)
              .then()
              .fadeOut(duration: 800.ms),
          const SizedBox(width: 8),
          Text(
            'Available for freelance & full-time',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(delay: 200.ms, duration: 600.ms)
        .slideY(begin: 0.3, end: 0);
  }

  Widget _buildName(bool isMobile) {
    return Text(
      PortfolioData.name,
      textAlign: isMobile ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontSize: isMobile ? 48 : 80,
        fontWeight: FontWeight.w700,
        height: 1.0,
        foreground: Paint()
          ..shader = const LinearGradient(
            colors: [AppColors.textPrimary, Color(0xFFB0B0C8)],
          ).createShader(const Rect.fromLTWH(0, 0, 500, 100)),
      ),
    )
        .animate()
        .fadeIn(delay: 400.ms, duration: 700.ms)
        .slideY(begin: 0.3, end: 0);
  }

  Widget _buildTypewriter(bool isMobile) {
    return Row(
      mainAxisAlignment:
          isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Text(
          'I\'m a ',
          style: TextStyle(
            fontSize: isMobile ? 20 : 28,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w400,
          ),
        ),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
          ).createShader(bounds),
          child: Text(
            _displayText,
            style: TextStyle(
              fontSize: isMobile ? 20 : 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        // Cursor blink
        _buildCursor(isMobile),
      ],
    )
        .animate()
        .fadeIn(delay: 600.ms, duration: 600.ms);
  }

  Widget _buildCursor(bool isMobile) {
    return Container(
      width: 2,
      height: isMobile ? 24 : 34,
      color: AppColors.primary,
    )
        .animate(onPlay: (c) => c.repeat())
        .fadeIn(duration: 500.ms)
        .then()
        .fadeOut(duration: 500.ms);
  }

  Widget _buildDescription(bool isMobile) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Text(
        'I craft beautiful, performant cross-platform apps that users love. '
        'Specializing in Flutter, Dart, and modern mobile architecture.',
        textAlign: isMobile ? TextAlign.center : TextAlign.start,
        style: TextStyle(
          color: AppColors.textSecondary,
          fontSize: isMobile ? 15 : 17,
          height: 1.7,
        ),
      ),
    )
        .animate()
        .fadeIn(delay: 800.ms, duration: 600.ms)
        .slideY(begin: 0.2, end: 0);
  }

  Widget _buildButtons(bool isMobile) {
    return Wrap(
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
      spacing: 16,
      runSpacing: 16,
      children: [
        // Primary CTA
        _GradientButton(
          label: 'View My Work',
          icon: Icons.arrow_forward_rounded,
          onTap: widget.onProjectsTap,
        ),
        // Secondary CTA
        _OutlineButton(
          label: 'Get In Touch',
          icon: Icons.mail_outline_rounded,
          onTap: widget.onContactTap,
        ),
      ],
    )
        .animate()
        .fadeIn(delay: 1000.ms, duration: 600.ms)
        .slideY(begin: 0.2, end: 0);
  }

  Widget _buildStats(bool isMobile) {
    return Wrap(
      spacing: isMobile ? 32 : 48,
      runSpacing: 20,
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
      children: PortfolioData.stats
          .map((s) => _StatItem(stat: s))
          .toList(),
    )
        .animate()
        .fadeIn(delay: 1200.ms, duration: 600.ms);
  }

  Widget _buildScrollIndicator() {
    return Column(
      children: [
        Text(
          'Scroll down',
          style: TextStyle(
            color: AppColors.textMuted,
            fontSize: 12,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.textMuted,
        )
            .animate(onPlay: (c) => c.repeat())
            .moveY(begin: 0, end: 6, duration: 800.ms)
            .then()
            .moveY(begin: 6, end: 0, duration: 800.ms),
      ],
    ).animate().fadeIn(delay: 1500.ms, duration: 600.ms);
  }
}

class _GradientButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _GradientButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<_GradientButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(_hovering ? 1.04 : 1.0),
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.secondary],
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: _hovering
                ? [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.4),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 8),
              Icon(widget.icon, color: Colors.white, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class _OutlineButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _OutlineButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_OutlineButton> createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<_OutlineButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(_hovering ? 1.04 : 1.0),
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            color: _hovering
                ? AppColors.primary.withOpacity(0.08)
                : Colors.transparent,
            border: Border.all(
              color: _hovering
                  ? AppColors.primary
                  : AppColors.cardBorder,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                color: _hovering ? AppColors.primary : AppColors.textSecondary,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: TextStyle(
                  color: _hovering
                      ? AppColors.primary
                      : AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final Map<String, dynamic> stat;
  const _StatItem({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
              ).createShader(bounds),
              child: Text(
                stat['value'],
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          stat['label'],
          style: const TextStyle(
            color: AppColors.textMuted,
            fontSize: 12,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}

// Custom painter for particles
class ParticlePainter extends CustomPainter {
  final double progress;
  final List<_Particle> particles;

  ParticlePainter(this.progress)
      : particles = List.generate(
          30,
          (i) => _Particle(
            x: (i * 0.12 + 0.05) % 1.0,
            y: (i * 0.17 + 0.03) % 1.0,
            size: 1.0 + (i % 3) * 0.8,
            speed: 0.0002 + (i % 5) * 0.00015,
            phase: i * 0.4,
          ),
        );

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    for (final p in particles) {
      final x = (p.x + math.sin(progress * math.pi * 2 + p.phase) * 0.05) *
          size.width;
      final y = (p.y - progress * p.speed * 100) % 1.0 * size.height;
      final opacity =
          (math.sin(progress * math.pi * 2 + p.phase) * 0.3 + 0.4).clamp(
              0.1, 0.7);
      paint.color = AppColors.primary.withOpacity(opacity * 0.6);
      canvas.drawCircle(Offset(x, y), p.size, paint);
    }
  }

  @override
  bool shouldRepaint(ParticlePainter old) => true;
}

class _Particle {
  final double x, y, size, speed, phase;
  const _Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.phase,
  });
}
