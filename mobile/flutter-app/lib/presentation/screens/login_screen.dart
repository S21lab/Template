import 'package:flutter/material.dart';

import '../../data/services/api_client.dart';
import '../../domain/models/user.dart';

class LoginScreen extends StatefulWidget {
    const LoginScreen({super.key});

    @override
    State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    final _formKey = GlobalKey<FormState>();
    final _usernameCtrl = TextEditingController();
    final _passwordCtrl = TextEditingController();
    final _apiClient = ApiClient();

    bool _loading = false;
    String? _error;

    Future<void> _submit() async {
        if (!_formKey.currentState!.validate()) return;

        setState(() {
            _loading = true;
            _error = null;
        });

        try {
            final data = await _apiClient.post('/auth/login', {
                'username': _usernameCtrl.text.trim(),
                'password': _passwordCtrl.text,
            });

            final user = User.fromJson(data);
            _apiClient.setToken(user.token);

            if (mounted) {
                Navigator.pushReplacementNamed(context, '/home', arguments: user);
            }
        } on ApiException catch (e) {
            setState(() => _error = 'Login failed (${e.statusCode})');
        } catch (_) {
            setState(() => _error = 'Network error — check your connection');
        } finally {
            if (mounted) setState(() => _loading = false);
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('Sign in')),
            body: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            if (_error != null)
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Text(
                                        _error!,
                                        style: const TextStyle(color: Colors.red),
                                    ),
                                ),
                            TextFormField(
                                controller: _usernameCtrl,
                                decoration: const InputDecoration(
                                    labelText: 'Username',
                                    border: OutlineInputBorder(),
                                ),
                                textInputAction: TextInputAction.next,
                                validator: (v) =>
                                    v == null || v.trim().isEmpty ? 'Required' : null,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                                controller: _passwordCtrl,
                                decoration: const InputDecoration(
                                    labelText: 'Password',
                                    border: OutlineInputBorder(),
                                ),
                                obscureText: true,
                                textInputAction: TextInputAction.done,
                                onFieldSubmitted: (_) => _submit(),
                                validator: (v) =>
                                    v == null || v.isEmpty ? 'Required' : null,
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ElevatedButton(
                                    onPressed: _loading ? null : _submit,
                                    child: _loading
                                        ? const SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(strokeWidth: 2),
                                          )
                                        : const Text('Sign in'),
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }

    @override
    void dispose() {
        _usernameCtrl.dispose();
        _passwordCtrl.dispose();
        super.dispose();
    }
}
