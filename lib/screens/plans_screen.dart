import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/session_manager.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({Key? key}) : super(key: key);

  @override
  _PlansScreenState createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  final _sessionManager = SessionManager();

  @override
  void initState() {
    super.initState();
    _sessionManager.init();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final userId = await _sessionManager.getUserId();
    if (userId == null && mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Membership Plans',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Your Plan',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Select a plan that best suits your needs',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),

            // Free Plan
            _buildPlanCard(
              title: 'Free Plan',
              price: '\$0',
              duration: 'Lifetime',
              features: [
                'Basic Profile',
                'Limited Search',
                'View Basic Profiles',
                'Send Interest (Limited)',
              ],
              isPopular: false,
              onSelect: () {
                // TODO: Implement free plan selection
              },
            ),
            const SizedBox(height: 16),

            // Premium Plan
            _buildPlanCard(
              title: 'Premium Plan',
              price: '\$29.99',
              duration: 'per month',
              features: [
                'Advanced Profile',
                'Unlimited Search',
                'View Full Profiles',
                'Send Unlimited Interest',
                'Priority Support',
                'Advanced Filters',
              ],
              isPopular: true,
              onSelect: () {
                // TODO: Implement premium plan selection
              },
            ),
            const SizedBox(height: 16),

            // Gold Plan
            _buildPlanCard(
              title: 'Gold Plan',
              price: '\$49.99',
              duration: 'per month',
              features: [
                'All Premium Features',
                'Profile Highlight',
                'Verified Badge',
                'Direct Messaging',
                'Profile Boost',
                'VIP Support',
              ],
              isPopular: false,
              onSelect: () {
                // TODO: Implement gold plan selection
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    required String duration,
    required List<String> features,
    required bool isPopular,
    required VoidCallback onSelect,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isPopular
            ? BorderSide(color: Colors.green.shade800, width: 2)
            : BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isPopular)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade800,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Most Popular',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  price,
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800,
                  ),
                ),
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    duration,
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ...features.map((feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green.shade800,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        feature,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onSelect,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPopular ? Colors.green.shade800 : Colors.white,
                  foregroundColor: isPopular ? Colors.white : Colors.green.shade800,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: Colors.green.shade800,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  'Select Plan',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 