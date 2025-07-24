// ---------------------- PAGE 1 ----------------------
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_cubit.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Page 1 - Name")),
      body: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: 'Enter Name'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<UserFormCubit>().updateName(controller.text);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const Page2()));
            },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}

// ---------------------- PAGE 2 ----------------------
class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Page 2 - Email")),
      body: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: 'Enter Email'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<UserFormCubit>().updateEmail(controller.text);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const Page3()));
            },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}

// ---------------------- PAGE 3 ----------------------
class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Page 3 - Phone")),
      body: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: 'Enter Phone'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<UserFormCubit>().updatePhone(controller.text);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const Page4()));
            },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}

// ---------------------- PAGE 4 ----------------------
class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Page 4 - Address")),
      body: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: 'Enter Address'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<UserFormCubit>().updateAddress(controller.text);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const Page5()));
            },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}

// ---------------------- PAGE 5 ----------------------
class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final userForm = context.watch<UserFormCubit>().state;

    return Scaffold(
      appBar: AppBar(title: const Text("Page 5 - Gender + Summary")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Enter Gender'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<UserFormCubit>().updateGender(controller.text);
              },
              child: const Text('Submit Gender'),
            ),
            const SizedBox(height: 20),
            Text("Name: ${userForm.name}"),
            Text("Email: ${userForm.email}"),
            Text("Phone: ${userForm.phone}"),
            Text("Address: ${userForm.address}"),
            Text("Gender: ${userForm.gender}"),
          ],
        ),
      ),
    );
  }
}

class Page6 extends StatelessWidget {
  const Page6({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final userForm = context.watch<UserFormCubit>().state;

    return Scaffold(
      appBar: AppBar(title: const Text("Page 5 - Gender + Summary")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Enter Gender'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<UserFormCubit>().updateGender(controller.text);
              },
              child: const Text('Submit Gender'),
            ),
            const SizedBox(height: 20),
            Text("Name: ${userForm.name}"),
            Text("Email: ${userForm.email}"),
            Text("Phone: ${userForm.phone}"),
            Text("Address: ${userForm.address}"),
            Text("Gender: ${userForm.gender}"),
          ],
        ),
      ),
    );
  }
}
