import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/widget/textfield_widget.dart';

import '../../../../core/widget/elevated_button.dart';
import '../../domin/entites/login_entity.dart';
import '../bloc/bloc_login/bloc/login_bloc.dart';
import 'accept.dart';
import 'bottom_widget.dart';


class FormLoginWidget extends StatefulWidget {
   const FormLoginWidget({
    super.key,
    required this.controlleremail,
    required this.controllerpass,
  });

  final TextEditingController controlleremail;
  final TextEditingController controllerpass;

  @override
  State<FormLoginWidget> createState() => _FormLoginWidgetState();
}

class _FormLoginWidgetState extends State<FormLoginWidget> {
final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Expanded(
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
          const Spacer(),
          TextFieldWidget(
              keyboard: TextInputType.emailAddress,
              name: "Email",
              icon: "asset/icons/email.png",
              controller: widget.controlleremail),
          TextFieldWidget(
              keyboard: TextInputType.text,
              name: "Password",
              icon: "asset/icons/key.png",
              controller: widget.controllerpass),
          Accept(name: "Remember me", line: ""),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ButtonWidget(newVariable: "", onPressed: ()=>_onpressed() , name: "Login"),
          ),
          const Spacer(),
          BottomWidget(
            bottom: "Don't have an account ?",
            textbutton: "Creat Account",
            onPressed: () => Navigator.pushNamed(context, "/register"),
          ),
              ],
            ),
        ));
  }

    void _onpressed() {


    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final login = LoginEntity(
        widget.controllerpass.text,
        true ,
        widget.controlleremail.text,
      
          );
   
      BlocProvider.of< LoginBloc>(context)
          .add(Loginevent(entity: login));
    }
  }
}
