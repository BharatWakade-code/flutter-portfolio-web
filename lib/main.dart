// lib/main.dart
import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/about_section.dart';
import 'widgets/skills_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/contact_section.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bharat Wakade — Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();

  // Section keys for navigation
  final List<GlobalKey> _sectionKeys = List.generate(6, (_) => GlobalKey());

  // Convenience getters
  GlobalKey get _heroKey => _sectionKeys[0];
  GlobalKey get _aboutKey => _sectionKeys[1];
  GlobalKey get _skillsKey => _sectionKeys[2];
  GlobalKey get _projectsKey => _sectionKeys[3];
  GlobalKey get _experienceKey => _sectionKeys[4];
  GlobalKey get _contactKey => _sectionKeys[5];

  void _scrollToSection(int index) {
    final key = _sectionKeys[index];
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Hero
                KeyedSubtree(
                  key: _heroKey,
                  child: HeroSection(
                    onContactTap: () => _scrollToSection(5),
                    onProjectsTap: () => _scrollToSection(3),
                  ),
                ),
                // About
                KeyedSubtree(
                  key: _aboutKey,
                  child: const AboutSection(),
                ),
                // Skills
                KeyedSubtree(
                  key: _skillsKey,
                  child: const SkillsSection(),
                ),
                // Projects
                KeyedSubtree(
                  key: _projectsKey,
                  child: const ProjectsSection(),
                ),
                // Experience
                KeyedSubtree(
                  key: _experienceKey,
                  child: const ExperienceSection(),
                ),
                // Contact
                KeyedSubtree(
                  key: _contactKey,
                  child: const ContactSection(),
                ),
              ],
            ),
          ),
          // Fixed navbar overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              scrollController: _scrollController,
              sectionKeys: _sectionKeys,
            ),
          ),
          // Back to top FAB
          Positioned(
            bottom: 32,
            right: 32,
            child: _BackToTopButton(scrollController: _scrollController),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _BackToTopButton extends StatefulWidget {
  final ScrollController scrollController;
  const _BackToTopButton({required this.scrollController});

  @override
  State<_BackToTopButton> createState() => _BackToTopButtonState();
}

class _BackToTopButtonState extends State<_BackToTopButton> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() {
      final shouldShow = widget.scrollController.offset > 400;
      if (shouldShow != _visible) setState(() => _visible = shouldShow);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: AnimatedScale(
        scale: _visible ? 1.0 : 0.8,
        duration: const Duration(milliseconds: 300),
        child: GestureDetector(
          onTap: () => widget.scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOutCubic,
          ),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
              ),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const Icon(
              Icons.keyboard_arrow_up_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
