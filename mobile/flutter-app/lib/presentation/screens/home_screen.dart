import 'package:flutter/material.dart';

import '../../domain/models/user.dart';

class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
        final user = ModalRoute.of(context)?.settings.arguments as User?;

        return Scaffold(
            appBar: AppBar(
                title: const Text('Home'),
                actions: [
                    IconButton(
                        icon: const Icon(Icons.logout),
                        tooltip: 'Logout',
                        onPressed: () =>
                            Navigator.pushReplacementNamed(context, '/login'),
                    ),
                ],
            ),
            body: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                            'Welcome, ${user?.username ?? 'User'}!',
                            style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                            'Role: ${user?.role ?? 'N/A'}',
                            style: Theme.of(context).textTheme.bodyLarge,
                        ),
                    ],
                ),
            ),
        );
    }
}
