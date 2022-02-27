import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _businessName = TextEditingController();
  final _contactNumber = TextEditingController();
  final _email = TextEditingController();
  String? _bName;

  Widget _formField(
      {TextEditingController? controller,
      String? label,
      TextInputType? type,
      String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        prefixText: controller == _contactNumber?'+84':null,
      ),
      validator: validator,
      onChanged: (value) {
        if(controller==_businessName){
          setState(() {
          _bName = value;
        });
        }
        
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 240,
            child: Stack(
              children: [
                Container(
                  color: Colors.blue,
                  height: 240,
                  child: Center(child: Text('data')),
                ),
                SizedBox(
                  height: 80,
                  child: AppBar(
                    elevation: 0,
                    actions: [
                      IconButton(
                        icon: Icon(Icons.exit_to_app),
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                        },
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Card(
                          elevation: 4,
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Center(child: Text('+')),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          _bName == null ? '' : _bName!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
            child: Column(
              children: [
                _formField(
                    controller: _businessName,
                    label: 'Tên cửa hàng',
                    type: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nhập tên cửa hàng';
                      }
                    }),
                _formField(
                    controller: _contactNumber,
                    label: 'Số điện thoại',
                    type: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nhập số điện thoại';
                      }
                    }),
                _formField(
                    controller: _email,
                    label: 'Email',
                    type: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nhập email của bạn';
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: (){}, 
                  child: Text('Đăng ký')),
              ),
            ),
          ],
        )
      ],
    );
  }
}
