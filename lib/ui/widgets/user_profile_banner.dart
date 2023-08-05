import 'package:flutter/material.dart';
import 'package:m_11_addtask_project/Data/Models/auth_utility.dart';
import 'package:m_11_addtask_project/ui/screen/LoginScreen.dart';

class UserProfileBanner extends StatefulWidget {
  const UserProfileBanner({
    super.key,
  });

  @override
  State<UserProfileBanner> createState() => _UserProfileBannerState();
}

class _UserProfileBannerState extends State<UserProfileBanner> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      tileColor: Colors.green,
      leading: CircleAvatar(
        backgroundImage:
            NetworkImage('${AuthUtility.userinfo.data?.photo ?? ''}'),
        onBackgroundImageError: (_, __) {
          const Icon(Icons.image);
        },
        radius: 15,
      ),
      title: Text(
        '${AuthUtility.userinfo.data?.firstName ?? ''} ${AuthUtility.userinfo.data?.lastName ?? ''}',
        style: const TextStyle(fontSize: 14, color: Colors.white),
      ),
      subtitle: Text(
        '${AuthUtility.userinfo.data?.email ?? 'Unknown'}',
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
      trailing: IconButton(
          onPressed: () async {
            await AuthUtility.clearUserInfo();
            if (mounted) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false);
            }
          },
          icon: const Icon(Icons.logout)),
    );
  }
}
