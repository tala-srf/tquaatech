import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form_tuqaatech/core/page/scaffold_start.dart';
import 'package:test_form_tuqaatech/core/widget/load.dart';

import 'package:test_form_tuqaatech/features/auth/presentation/bloc/bloc_register/bloc/register1_bloc.dart';

import '../widget/formsingup.dart';

// ignore: must_be_immutable
class RegisterUI extends StatelessWidget {
  RegisterUI({Key? key}) : super(key: key);
  TextEditingController controllername = TextEditingController();
  TextEditingController controllerage = TextEditingController();
  TextEditingController controllergender = TextEditingController();
  TextEditingController controllercountry = TextEditingController();
  TextEditingController controllerphone = TextEditingController();
  TextEditingController controllernemail = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();
  TextEditingController controllerreenterpassword = TextEditingController();
  TextEditingController controllercity = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StartClass(
      num: 1.0,
      widgetstart: Expanded(
        child: ListView.builder(
           padding: const EdgeInsets.only(bottom: 10, top: 30.0),
            itemCount: 1,
            itemBuilder: (context, index) {
              return BlocConsumer<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if (state is SuccessedRegister) {
                    Navigator.of(context).popAndPushNamed("/done");
                  
                  } else if (state is ErrorNet) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('عذراً يوجد خطأ ')));
                  }
                },
                builder: (context, state) {
                  if (state is RegisterInitial || state is ErrorNet) {
                    return FormSignup(
                      
                        controllername: controllername,
                        controllerage: controllerage,
                        controllergender: controllergender,
                        controllercountry: controllercountry,
                        controllercity: controllercity,
                        controllerphone: controllerphone,
                        controllernemail: controllernemail,
                        controllerpassword: controllerpassword,
                        controllerreenterpassword: controllerreenterpassword);
                  } else if (state is Loading) {
                    return const LoadingWidget();
                  } else {
                    return const Text("data");
                  }
                },
              );
            }),
      ),
    );
  }
}
