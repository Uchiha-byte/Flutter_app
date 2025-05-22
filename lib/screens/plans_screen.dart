import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../constants/app_constants.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({Key? key}) : super(key: key);

  Widget _buildPackageCard(Map<String, dynamic> plan, BuildContext context) {
    final bool isDiamond = plan['name'] == 'DIAMOND PLAN';
    final bool isGold = plan['name'] == 'GOLD PLAN';
    final bool isSilver = plan['name'] == 'SILVER PLAN';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: isDiamond
            ? AppTheme.diamondGradient
            : isGold
                ? AppTheme.goldGradient
                : AppTheme.silverGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: (isDiamond
                    ? Colors.blue
                    : isGold
                        ? Colors.amber
                        : Colors.grey)
                .withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                plan['name'],
                style: AppTheme.headingStyle.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  plan['duration'],
                  style: AppTheme.subheadingStyle.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ...(plan['features'] as List<String>).map((feature) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            feature,
                            style: AppTheme.bodyStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  plan['price'],
                  style: AppTheme.headingStyle.copyWith(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement purchase functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: isDiamond
                      ? Colors.blue
                      : isGold
                          ? Colors.amber
                          : Colors.grey,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 4,
                ),
                child: Text(
                  'Purchase This Package',
                  style: AppTheme.buttonStyle.copyWith(
                    color: isDiamond
                        ? Colors.blue
                        : isGold
                            ? Colors.amber
                            : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membership Plans'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppTheme.primaryGradient,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              AppTheme.primaryColor.withOpacity(0.1),
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                'Choose any of our packages as per your need',
                style: AppTheme.headingStyle.copyWith(
                  fontSize: 24,
                  color: AppTheme.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: AppConstants.packagePlans.length,
                itemBuilder: (context, index) {
                  return _buildPackageCard(
                    AppConstants.packagePlans[index],
                    context,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} 