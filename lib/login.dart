import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'credentails.dart' as cred;
import 'display page.dart';
import 'api.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();

}



GlobalKey<FormState> formkey=GlobalKey();

class _LoginpageState extends State<Loginpage> {

  final usr=TextEditingController();
  final pwd=TextEditingController();

  void navigatenextpage()
  {
    if(cred.username==usr.text && cred.paswword==pwd.text){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context)=>const apitest()
      ));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:Text( "Wrong credentail"),
        ),
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        title: Center(
          child:Text("FACEBOOK",style: TextStyle(
            fontSize:30
          ),)
        )
      ),
      body: Form(
        autovalidateMode:AutovalidateMode.always,
      key: formkey,
        child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),),
            TextFormField(
              controller:usr,
              decoration: InputDecoration(
              labelText: "Email"
            ),
            validator:EmailValidator(errorText: 'Not a valid email'),
            ),
            TextFormField(
              controller: pwd,
              decoration: InputDecoration(
                labelText: "Password"
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: MultiValidator(
                [
                  MinLengthValidator(6, errorText: 'Should be atleast 6 character',),
                  MaxLengthValidator(15,errorText: 'length should be less than 15')
                ]
              ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
                onPressed:navigatenextpage,
                 child: Text("Signin"))

          ],
        ),
      ),

    ),
    );
  }
}
