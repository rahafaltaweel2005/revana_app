import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:revana_app/core/constant/color_const.dart';

import '../../../../../core/textfield/revana_text_field.dart';
import '../../../../core/constant/app_spacing.dart';

import '../../../../core/constant/svg_const.dart';
import '../../../categories/presentaion/viewadmincategory/view/view_admin_categories_screen.dart';
import '../login/cubit/login_cubit.dart';
import '../login/state/login_state.dart';
import '../register/cubit/register_cubit.dart';
import '../register/state/register_state.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  int currentPage = 1;
  bool isPasswordHidden = true;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void togglePassword() {
    setState(() {
      isPasswordHidden = !isPasswordHidden;
    });
  }
  Widget _buildLoginForm() {
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "PRIVILEGED ACCESS",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18,
                color: ColorConst.secondary,
              ),
            ),
            Text(
              "Welcome Back",
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 13,
                color: ColorConst.textDark,
              ),
            ),
            Text(
              "Access your saved olfactory formulations and private cellar ledger.",
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 13,
                color: ColorConst.neutral,
              ),
            ),
            SizedBox(height: AppSpacing.md),
            RevanaTextField(
              controller: emailController,
              title: 'PATRON EMAIL ADDRESS',
              hint: 'parfumier@revana.fr',
              prefixIcon: Icon(
                Icons.email_outlined,
                color: ColorConst.neutral,
                size: 20,
              ),
              obscureText: false,
            ),
            const SizedBox(height: AppSpacing.md),
            RevanaTextField(
              controller: passwordController,
              title: 'VAULT CIPHER',
              hint: '••••••••',
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: ColorConst.neutral,
                size: 20,
              ),
              suffixIcon: IconButton(
                onPressed: togglePassword,
                icon: Icon(
                  isPasswordHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
              obscureText: isPasswordHidden,
            ),
            const SizedBox(height: AppSpacing.lg),
            ElevatedButton(
              onPressed: () {
                context.read<LoginCubit>().login(
                  email: emailController.text.trim(),
                  password: passwordController.text,
                );
              },
              child: Row(
                spacing: AppSpacing.sm,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('SIGN IN TO SANCTUARY'),
                  Icon(Icons.login_outlined),
                ],
              ),
            ),
          ],
        );
      },
      listener: (context, state) {
        if (state is LoginErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is LoginSuccessState) {

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) =>
              ViewAdminCategoriesScreen(),));
        }
      },
    );
  }
  Widget _buildRegisterForm() {
    return BlocConsumer<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Column(
crossAxisAlignment: CrossAxisAlignment.start,          children: [
            Text(
              "MAISON MEMBERSHIP",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18,
                color: ColorConst.secondary,
              ),
            ),
            Text(
              "Create Patron Profile",
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 13,
                color: ColorConst.textDark,
              ),
            ),
            Text(
              "Enroll in the Privilège Program and access bespoke flacon allocations.",
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 13,
                color: ColorConst.neutral,
              ),
            ),
          SizedBox(height: AppSpacing.md),
          Row(
              children: [
                Expanded(
                  child: RevanaTextField(
                    controller: firstNameController,
                    title: 'PRÉNOM / FIRST NAME',
                    hint: 'Camille',
                    obscureText: false,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: RevanaTextField(
                    controller: lastNameController,
                    title: 'NOM / LAST NAME',
                    hint: 'Gautier',
                    obscureText: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
          RevanaTextField(
              controller: emailController,
              title: 'EMAIL ADDRESS',
              hint: 'c.gautier@revana.fr',
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: ColorConst.neutral,
                size: 20,
              ),
              obscureText: false,
            ),
            const SizedBox(height: AppSpacing.md),
          RevanaTextField(
              controller: passwordController,
              title: 'VAULT CIPHER',
              hint: '••••••••',
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: ColorConst.neutral,
                size: 20,
              ),
              suffixIcon: IconButton(
                onPressed: togglePassword,
                icon: Icon(
                  isPasswordHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
              obscureText: isPasswordHidden,
            ),
            const SizedBox(height: AppSpacing.lg),
            ElevatedButton(
              onPressed: () {
                context.read<RegisterCubit>().register(
                  firstName: firstNameController.text.trim(),
                  lastName: lastNameController.text.trim(),
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
              },
              child: Row(
                spacing: AppSpacing.sm,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('CREATE ACCOUNT'),
                 Icon(Icons.create_outlined),

                ],
              ),
            ),
          ],
        );
      },
      listener: (context, state) {
        if (state is RegisterErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is RegisterSuccessState) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) =>
                ViewAdminCategoriesScreen(),));
        }
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: size.width*0.8,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xFFFFFFFF),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,


              children: [
                Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25) ),
                    color: ColorConst.textDark,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: ColorConst.outline,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: SizedBox(
                          height: 72,
                          width: 72,
                          child: SvgPicture.asset(SvgConst.logo),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      Text(
                        "CIRCLE PRIVÉ CONCIERGE",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          color: ColorConst.secondary,
                        ),
                      ),
                      Text(
                        "Enter the",
                        style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ColorConst.onPrimary,
                        ),
                      ),
                      Text(
                        "Circle Privé",
                        style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          color: ColorConst.secondary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xxl),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: ColorConst.outline, width: 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\"Where rare botanicals whisper the timeless essence \nof Parisian luxury.\"",
                              style: TextStyle(
                                fontFamily: 'PlayfairDisplay',
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                color: ColorConst.secondary,
                              ),
                            ),
                            SizedBox(height: AppRadius.lg),
                            Row(
                              spacing: AppRadius.sm,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/svg/02_star.svg",
                                  height: 20,
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Private Flacon Allocations",
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 18,
                                        color: ColorConst.onPrimary,
                                      ),
                                    ),
                                    Text(
                                      "Priority reservation on numbered, small-\nbatch Extraits de Parfum.",
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 18,
                                        color: ColorConst.neutral,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: AppRadius.lg),
                            Row(
                              spacing: AppRadius.sm,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/svg/revana_flower_icon.svg",
                                  height: 20,
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Olfactive Consultations",
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 18,
                                        color: ColorConst.onPrimary,
                                      ),
                                    ),
                                    Text(
                                      "Direct correspondence with Master Noses at \nAtelier Vendôme.",
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 18,
                                        color: ColorConst.neutral,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppRadius.lg),

                Expanded(
                  child: Container(
                      width: size.width * 0.5,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFFFFFFF),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: AppSpacing.xl, bottom: AppSpacing.sm , right: AppSpacing.sm  ,left:AppSpacing.sm ),

                            child: Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        currentPage = 0;
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(14),bottomLeft: Radius.circular(14) ),
                                      ),
                                      padding: EdgeInsets.all(20),
                                      backgroundColor: currentPage == 0
                                          ? ColorConst.outline
                                          : ColorConst.surfaceContainerHigh,
                                    ),
                                    child: Text(
                                      "CREATE PROFILE",

                                      style: TextStyle(
                                        color: ColorConst.textDark,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        currentPage = 1;
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(14),bottomRight: Radius.circular(14) ),
                                      ),
                                      padding: EdgeInsets.all(20),
                                      backgroundColor: currentPage == 1
                                          ? ColorConst.outline
                                          : ColorConst.surfaceContainerHigh,
                                    ),
                                    child: Text(
                                      "MEMBER SIGN IN",
                                      style: TextStyle(
                                        color: ColorConst.textDark,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(AppSpacing.xxl),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: currentPage == 0
                                ? _buildRegisterForm()
                                : _buildLoginForm(),
                          ),
                        ],
                      ),
                    ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
