import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecocycle/screens/article_screen.dart';
import 'package:ecocycle/screens/droppoint_screen.dart';
import 'package:ecocycle/screens/result_screen.dart';
import 'package:ecocycle/screens/scan_screen.dart';
import 'package:ecocycle/screens/upload_screen.dart';
import 'package:ecocycle/services/firebase_auth_services.dart';
import 'package:ecocycle/services/history_services.dart';
import 'package:ecocycle/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _appBar(),
                const SizedBox(height: 20),
                _welcomeBanner(),
                const SizedBox(height: 28),
                _homeMenu(context),
                const SizedBox(height: 28),
                _historyScan(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: FutureBuilder(
          future: DbUser.getUserByEmail(_authService.getCurrentUser()!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              String name = snapshot.data![0]['name'];
              String jenisKelamin = snapshot.data![0]['jenisKelamin'];
              String avatarUser;

              if (name.length > 15) {
                List<String> nameParts = name.split(' ');
                name = '${nameParts[0]} ${nameParts[1]}';
              }

              if (jenisKelamin == 'Laki-laki') {
                avatarUser = 'avatar_men';
              } else if (jenisKelamin == 'Perempuan') {
                avatarUser = 'avatar_women';
              } else {
                avatarUser = 'avatar_none';
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello,\n$name",
                    style: GoogleFonts.dmSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/$avatarUser.png"),
                    radius: 24,
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error retrieving user data: ${snapshot.error}');
            } else {
              return Text(
                "Loading...",
                style: GoogleFonts.dmSans(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              );
            }
          }),
    );
  }

  Container _welcomeBanner() {
    return Container(
        height: 170,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xff28A77D), Color(0xff0D0140)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: AssetImage('assets/images/ilustrasi1.png'),
            alignment: Alignment.bottomRight,
            scale: 18,
          ),
        ),
        child: RichText(
          text: TextSpan(
            text: 'Don’t Throw Away\n',
            style: GoogleFonts.dmSans(
              color: Colors.white,
              fontSize: 24,
              height: 3,
              fontWeight: FontWeight.w700,
            ),
            children: [
              TextSpan(
                text: 'Recycle for\nAnother Day',
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 20,
                  height: 1.2,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ));
  }

  Container _homeMenu(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Find Your Solution',
            style: GoogleFonts.dmSans(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 15),
          StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2.4,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      useRootNavigator: true,
                      builder: (context) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          height: 400,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                PhosphorIconsBold.minus,
                                size: 50,
                                color: Color(0xFF176B3F),
                              ),
                              const SizedBox(height: 25),
                              Text(
                                'What would you like to add?',
                                style: GoogleFonts.dmSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Would you like to scan your trash by camera or add trash picture manually?',
                                style: GoogleFonts.dmSans(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 42),
                              Container(
                                height: 62,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF28A77D),
                                      Color(0xFF2BD07A),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    pushScreen(
                                      context,
                                      settings:
                                          const RouteSettings(name: "/scan"),
                                      screen: const ScanScreen(),
                                    );
                                  },
                                  child: const Text(
                                    'SCAN YOUR TRASH',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                height: 62,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDDDEDD),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    pushScreen(
                                      context,
                                      settings:
                                          const RouteSettings(name: "/upload"),
                                      screen: const UploadScreen(),
                                    );
                                  },
                                  child: const Text(
                                    'ADD MANUALLY',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF99ABC6).withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 32,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFF9C951),
                                  Color(0xFFFFEAB6),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: const Icon(
                              PhosphorIconsBold.scan,
                              size: 32,
                              color: Color(0xFF176B3F),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Scan Your Trash',
                            style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1.2,
                child: InkWell(
                  onTap: () {
                    pushScreen(
                      context,
                      settings: const RouteSettings(name: "/droppoint"),
                      screen: const DropPointScreen(),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF99ABC6).withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 32,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFF9C951),
                                  Color(0xFFFFEAB6),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: const Icon(
                              PhosphorIconsBold.mapPinLine,
                              color: Color(0xFF176B3F),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Nearby Drop Point',
                            style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1.2,
                child: InkWell(
                  onTap: () {
                    pushScreen(
                      context,
                      withNavBar: true,
                      settings: const RouteSettings(name: "/article"),
                      screen: const ArticleScreen(),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .shadow
                              .withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 32,
                          offset:
                              const Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFF9C951),
                                  Color(0xFFFFEAB6),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: const Icon(
                              PhosphorIconsBold.article,
                              color: Color(0xFF176B3F),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Garbage Article',
                            style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _historyScan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Recent Your Garbage',
            style: GoogleFonts.dmSans(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 15),
        StreamBuilder<QuerySnapshot>(
          stream: DbHistory.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                height: 850,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    DocumentSnapshot history = snapshot.data!.docs[index];

                    return Container(
                      height: 196,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF99ABC6).withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 40,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(history['imageUrl']),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                history['name'],
                                style: GoogleFonts.dmSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF2F2F4),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    history['category'],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF2F2F4),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    history['rangePrice'],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                timeago
                                    .format(history.get('timestamp').toDate()),
                                textAlign: TextAlign.end,
                                style: GoogleFonts.dmSans(
                                  fontSize: 12,
                                  color: const Color(0xFFAAA6B9),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  pushScreen(
                                    context,
                                    settings:
                                        const RouteSettings(name: "/result"),
                                    screen: const ResultScreen(),
                                  );
                                },
                                child: Container(
                                  width: 160,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD3ECE5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Text(
                                    'See Detail',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20);
                  },
                  itemCount: snapshot.data!.docs.length > 4
                      ? 4
                      : snapshot.data!.docs.length,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }
}
