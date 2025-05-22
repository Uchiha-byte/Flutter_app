import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../constants/app_constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit_outlined),
                          onPressed: () {
                            // TODO: Implement edit profile
                          },
                        ),
                      ],
                    ),
                  ),
                  // Profile Header
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppTheme.primaryColor,
                              width: 3,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.asset(
                              AppConstants.logoPath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'John Doe',
                          style: AppTheme.headingStyle.copyWith(
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'john.doe@example.com',
                          style: AppTheme.bodyStyle.copyWith(
                            color: AppTheme.textLightColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Profile Sections
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionTitle('Personal Information'),
                        _buildInfoCard(
                          icon: Icons.person_outline,
                          title: 'Full Name',
                          value: 'John Doe',
                        ),
                        _buildInfoCard(
                          icon: Icons.calendar_today_outlined,
                          title: 'Date of Birth',
                          value: '01/01/1990',
                        ),
                        _buildInfoCard(
                          icon: Icons.people_outline,
                          title: 'On Behalf',
                          value: 'Self',
                        ),
                        const SizedBox(height: 24),
                        _buildSectionTitle('Membership'),
                        _buildMembershipCard(),
                        const SizedBox(height: 24),
                        _buildSectionTitle('Settings'),
                        _buildSettingsCard(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Logout Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      style: AppTheme.secondaryButtonStyle,
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: AppTheme.subheadingStyle,
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: AppTheme.cardDecoration,
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primaryColor),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTheme.bodyStyle.copyWith(
                    color: AppTheme.textLightColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: AppTheme.subheadingStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMembershipCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: AppTheme.goldGradient,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.diamond_outlined, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                'Gold Membership',
                style: AppTheme.subheadingStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Valid until: 31/12/2024',
            style: AppTheme.bodyStyle.copyWith(
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement upgrade
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppTheme.primaryColor,
            ),
            child: const Text('Upgrade Plan'),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsCard() {
    return Container(
      decoration: AppTheme.cardDecoration,
      child: Column(
        children: [
          _buildSettingTile(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            onTap: () {
              // TODO: Implement notifications settings
            },
          ),
          const Divider(height: 1),
          _buildSettingTile(
            icon: Icons.lock_outline,
            title: 'Privacy',
            onTap: () {
              // TODO: Implement privacy settings
            },
          ),
          const Divider(height: 1),
          _buildSettingTile(
            icon: Icons.help_outline,
            title: 'Help & Support',
            onTap: () {
              // TODO: Implement help & support
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primaryColor),
      title: Text(title, style: AppTheme.bodyStyle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
} 