import 'package:flutter/material.dart';
import 'package:neuroute_prescreen/components/complete_page.dart';


class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Finish Sign Up", style: TextStyle(fontSize: 20),),
            Divider(
              color: Colors.grey.withOpacity(1),
            ),
            TextField(
              decoration: InputDecoration(hintText: "Full name", focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Color(0xff00C7A8)))),
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(hintText: "Enter email", focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Color(0xff00C7A8)))),          ),
            SizedBox(height: 10,),

            TextField(
              decoration: InputDecoration(hintText: "Phone number", focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Color(0xff00C7A8)))),          ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(hintText: "ZIP code", focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Color(0xff00C7A8)))),          ),
            SizedBox(height: 60,),
            Container(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CompletionPage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Finish sign up",
                        style: TextStyle(color: Colors.white)),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff5D6569),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                )),

          ],
        ),
      ),
    );
  }
}
