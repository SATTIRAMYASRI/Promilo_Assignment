import 'package:flutter/material.dart';
import 'package:promilo_assignment/Screens/meet_up_screen.dart';
import 'package:promilo_assignment/constants/string_constants.dart';
import 'package:promilo_assignment/cubits/cubit/meet_up_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MeetUpCubit _meetUpCubit;

  @override
  void initState() {
    _meetUpCubit = MeetUpCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      const Center(child: Text("Home")),
      const Center(child: Text("Prolet")),
      const MeetUpScreen(),
      const Center(
        child: Text("Explore"),
      ),
      const Center(child: Text("Account")),
    ];

    return BlocProvider(
      create: (context) => _meetUpCubit,
      child: BlocBuilder<MeetUpCubit, MeetUpState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading:
                  Icon(Icons.arrow_back_ios, color: Colors.indigo.shade900),
              title: Text(
                StringConstants.individualMeetup,
                style: TextStyle(color: Colors.indigo.shade900, fontSize: 20),
              ),
            ),
            body: _pages[_meetUpCubit.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.indigo.shade900,
              showUnselectedLabels: true,
              unselectedLabelStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              selectedItemColor: Colors.blue.shade400,
              currentIndex: _meetUpCubit.selectedIndex,
              onTap: _meetUpCubit.onItemTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.grid_goldenratio_sharp),
                  label: 'Prolet',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.handshake_outlined),
                  label: 'Meetup',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.wallet),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Account',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
