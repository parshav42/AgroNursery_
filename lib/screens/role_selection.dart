import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'farmer_login.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_title'.tr()),
        backgroundColor: Colors.green.shade700,
        actions: [
          PopupMenuButton<Locale>(
            tooltip: 'language'.tr(),
            icon: const Icon(Icons.language),
            onSelected: (loc) => context.setLocale(loc),
            itemBuilder: (ctx) => [
              PopupMenuItem(value: const Locale('en'), child: Text('english'.tr())),
              PopupMenuItem(value: const Locale('mr'), child: Text('marathi'.tr())),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 36),
            Text(
              'choose_role'.tr(),
              style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w700, color: Colors.green.shade800),
            ),
            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: _RoleCardButton(
                label: 'farmer'.tr(),
                assetPath: 'assets/icons/farmer.png',
                accent: Colors.green.shade600,
                onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => FarmerLoginPage())),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: _RoleCardButton(
                label: 'nursery_owner'.tr(),
                assetPath: 'assets/icons/nursery.png',
                accent: Colors.teal.shade600,
                onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => NurseryLoginPage())),
              ),
            ),

            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.language, size: 18, color: Colors.green.shade700),
                  const SizedBox(width: 6),
                  Text(
                    '${'language'.tr()}: '
                    '${context.locale.languageCode == 'mr' ? 'marathi'.tr() : 'english'.tr()}',
                    style: TextStyle(
                      color: Colors.green.shade800, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _RoleCardButton extends StatelessWidget {
  final String label;
  final String assetPath;
  final VoidCallback onTap;
  final Color accent;

  const _RoleCardButton({
    required this.label,
    required this.assetPath,
    required this.onTap,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: accent.withOpacity(0.25), width: 1),
          ),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: accent.withOpacity(0.12), shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Image.asset(
                  assetPath, width: 32, height: 32, fit: BoxFit.contain),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w700, color: Colors.green.shade900),
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 18, color: accent),
            ],
          ),
        ),
      ),
    );
  }
}
