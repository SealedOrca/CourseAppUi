import 'package:flutter/material.dart';
import 'package:learn_o/screens/utiltiy/btmnavbae.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                BackButton(),
                Text(
                  'Choose Payment Method',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const PaymentOptionCard(
              imageAsset: 'assets/master.png',
              title: 'Mastercard',
              subtitle: '**** **** **** 1234',
            ),
            const SizedBox(height: 16),
            const PaymentOptionCard(
              imageAsset: 'assets/visa.png',
              title: 'Visa',
              subtitle: '**** **** **** 5678',
            ),
            const SizedBox(height: 16),
            PaymentOptionCard(
              title: 'Add New Payment Method',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddPaymentScreen()),
                );
              },
              subtitle: '',
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentOptionCard extends StatefulWidget {
  final String? imageAsset;
  final IconData? icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const PaymentOptionCard({
    Key? key,
    this.imageAsset,
    this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  _PaymentOptionCardState createState() => _PaymentOptionCardState();
}

class _PaymentOptionCardState extends State<PaymentOptionCard> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        } else {
          setState(() {
            _isSelected = !_isSelected;
          });
        }
      },
      child: Card(
        elevation: 2,
        child: ListTile(
          leading: widget.imageAsset != null
              ? Image.asset(widget.imageAsset!, height: 36, width: 36)
              : Icon(widget.icon, size: 36),
          title: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(widget.subtitle),
          trailing: widget.onTap != null
              ? const Icon(Icons.arrow_forward_ios)
              : Radio<bool>(
                  value: _isSelected,
                  groupValue: true,
                  onChanged: (value) {
                    setState(() {
                      _isSelected = value!;
                    });
                  },
                ),
        ),
      ),
    );
  }
}

class AddPaymentScreen extends StatelessWidget {
  const AddPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                BackButton(),
                Text(
                  'Enter Payment Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Card Holder Name'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Card Number'),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Expiration Date'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'CVV'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform payment processing logic
              },
              child: const Text('Add Payment Method'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: PaymentScreen(),
  ));
}
