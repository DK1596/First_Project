import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register Form Page',
      home: RegisterFormPage(),
    );
  }
}

class RegisterFormPage extends StatefulWidget {
  @override
  _RegisterFormPageState createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePass = true;

  final _nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Form'),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: 'Full Name *', hintText: 'Enter Full Name',
              prefixIcon: Icon(Icons.person),
              suffixIcon: Icon(Icons.delete_forever_sharp),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.lime, width: 2)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.cyan, width: 2)
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.call),
                suffixIcon: Icon(Icons.delete_forever_sharp),
                helperText: 'Phone format (XXX)XXX-XXXX',
                  labelText: 'Phone Number *', hintText: 'Enter your phone',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.lime, width: 2)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.cyan, width: 2)
                ),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'E-mail',
                icon: Icon(Icons.email_outlined)
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(labelText: 'Biography',
              border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLength: 8,
              obscureText: _hidePass,
              decoration: InputDecoration(labelText: 'Password *',
                suffixIcon: IconButton(
                  icon: Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                  onPressed: (){
                    setState(() {
                      _hidePass =! _hidePass;
                    });
                  },
                ),
                icon: Icon(Icons.security),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLength: 8,
              obscureText: _hidePass,
              decoration: InputDecoration(labelText: 'Confirm Password *',
                icon: Icon(Icons.border_color),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              onPressed: _submitForm,
              color: Colors.pinkAccent,
              child: Text(
                'Submit Form',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _submitForm(){
    print('Name: ${_nameController.text}');
  }
}
