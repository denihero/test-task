import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task/logic/auth/auth_bloc.dart';
import 'package:test_task/logic/profile_cubit/profile_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.02),
        appBar: AppBar(
          title: const Text(
            'Профиль',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if(state is ProfileSuccess) {
              final result = state.profile;
              return Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  SvgPicture.asset('assets/icons/profile.svg',width: 80,height: 80,color: Colors.black,),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${result.nickname}',
                    style: const TextStyle(
                        fontSize: 24,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal),
                  ),
                  Text(
                    '${result.email}',
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Color.fromRGBO(146, 146, 146, 1)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListTile(
                    tileColor: Colors.white,
                    onTap: () {
                      BlocProvider.of<AuthBloc>(context).add(AuthLogout());
                      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Вы успешно вышли')));
                    },
                    title: const Text(
                      'Выйти',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              );
            }else if(state is ProfileLoading){
              return const Center(child: CircularProgressIndicator(),);
            }else if(state is ProfileError){
              return const Center(child: Text('Something get wrong'),);
            }
            return const SizedBox();
          },
        ));
  }
}
