
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Registration extends StatelessWidget {
  final pwd=TextEditingController();
  final pwd2=TextEditingController();
  


   Registration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text("Ecommerce application"),
),
      body: Container(
        height: MediaQuery.of(context).size.height,

        // color: Colors.yellow,
        child: Container(
          color: Colors.white12,
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                Align(
                  heightFactor: 5,
                  child: Text("Registration Form", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email"
                  ),
                  validator: EmailValidator(errorText: "please enter valid email"),

                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password"
                  ),
                    keyboardType: TextInputType.text,
                  obscureText: true,
                  controller: pwd,
                  validator:MultiValidator(
                    [
                    MinLengthValidator(6,errorText: "Password should be atleast 6 caharcters"),
                      MaxLengthValidator(12, errorText: "only 16 caharacters are allowed")
                  ]

                  )
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Confirm password",
                  ),
                  keyboardType: TextInputType.text,
                  controller: pwd2,
                  obscureText: true,
                  validator: (value){
                    if(value!=pwd.text){
                      return "password should be same";
                    }
                    else{
                      return null;
                    }
                  }
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  print("success");
                },
                    child: Text("Sign up"))
              ],

            ),
          ),
        ),
      ),
    );
  }
}
