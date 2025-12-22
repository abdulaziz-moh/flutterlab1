import 'package:flutter/material.dart';
import 'package:flutter_lab_1/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.facebook, size: 80, color: Color(0xFF1877F2)),
              const SizedBox(height: 20),
              Text(
                "Welcome Back",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "Username",
                floatingLabelStyle: TextStyle(color: Colors.blue),
                prefixIcon: Icon(Icons.person),
                focusColor: Colors.blue,
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email";
                }
                if (!value.contains('@')) {
                  return "Please enter a valid email";
                }
                return null;
              },
            ),

            SizedBox(height: 20),

            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                floatingLabelStyle: TextStyle(color: Colors.blue),
                prefixIcon: Icon(Icons.password),
                focusColor: Colors.blue,
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              validator: (value) {
                if (value == null) {
                  return "Please enter a password";
                }
                if (value.length < 8) {
                  return "Password length must be greater than 8";
                }
                return null;
              },
            ),

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                    print("Form is valid. Navigating... ");
                  } else {
                    print("Form is invalid. Try again.");
                  }
                },
                child: Text("Log In"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _LoginFormState extends State<LoginForm> {
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _usernameController,
//               decoration: const InputDecoration(
//                 labelText: "Username",
//                 floatingLabelStyle: TextStyle(color: Colors.blue),
//                 focusColor: Colors.blue,
//                 prefixIcon: Icon(Icons.person),
//                 border: OutlineInputBorder(),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue, width: 2),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: "Password",
//                 floatingLabelStyle: TextStyle(color: Colors.blue),
//                 prefixIcon: Icon(Icons.lock),
//                 border: OutlineInputBorder(),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue, width: 2),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//             SizedBox(
//               width: double.infinity,
//               height: 50,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 onPressed: () {
//                   // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));  // creates a back icon on the routed page
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrationScreen()));
//                   // Navigator.pushReplacement(
//                   //   context,
//                   //   MaterialPageRoute(builder: (context) => HomeScreen()),
//                   // );
//                 },
//                 child: const Text("Log In", style: TextStyle(fontSize: 16)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Account")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: "Full Name")),
            TextField(decoration: InputDecoration(labelText: "Email")),
            TextField(
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to save user... then go back
                Navigator.pop(context);
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
