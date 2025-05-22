import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../constants/app_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                AppConstants.backgroundImagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App Bar
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Larger Logo
                        Image.asset(
                          AppConstants.logoPath,
                          width: 120, // Increased size
                          height: 120, // Increased size
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.notifications_outlined),
                              onPressed: () {
                                // TODO: Implement notifications
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.person_outline),
                              onPressed: () {
                                Navigator.pushNamed(context, '/profile');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Welcome Section
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to',
                          style: AppTheme.subheadingStyle.copyWith(
                            color: AppTheme.textLightColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          AppConstants.appName,
                          style: AppTheme.headingStyle.copyWith(
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          AppConstants.appDescription,
                          style: AppTheme.bodyStyle.copyWith(
                            color: AppTheme.textLightColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Features Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Features',
                          style: AppTheme.subheadingStyle,
                        ),
                        const SizedBox(height: 16),
                        ...AppConstants.features.map((feature) => _buildFeatureCard(feature)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // How It Works Section
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: AppTheme.secondaryGradient,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'How It Works',
                          style: AppTheme.subheadingStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 24),
                        ...AppConstants.howItWorksSteps.asMap().entries.map(
                          (entry) => _buildStepCard(entry.key + 1, entry.value),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/plans');
        },
        backgroundColor: AppTheme.primaryColor,
        icon: const Icon(Icons.diamond_outlined),
        label: const Text('View Plans'),
      ),
    );
  }

  Widget _buildFeatureCard(String feature) {
    IconData icon;
    switch (feature) {
      case 'Best Matches':
        icon = Icons.favorite;
        break;
      case 'Verified Profiles':
        icon = Icons.verified_user;
        break;
      case '100% Privacy':
        icon = Icons.lock;
        break;
      default:
        icon = Icons.star;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: AppTheme.cardDecoration,
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primaryColor, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              feature,
              style: AppTheme.subheadingStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepCard(int number, Map<String, String> step) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: AppTheme.subheadingStyle.copyWith(
                  color: AppTheme.primaryColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step['title']!,
                  style: AppTheme.subheadingStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  step['description']!,
                  style: AppTheme.bodyStyle.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 