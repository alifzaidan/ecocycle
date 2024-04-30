import 'package:ecocycle/models/bookmark_model.dart';
import 'package:ecocycle/services/bookmark_services.dart';
import 'package:ecocycle/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  Future<List<Bookmark>>? futureBookmark;
  final bookmarkDB = DBBookmark();

  @override
  void initState() {
    super.initState();
    fetchBookmark();
  }

  void fetchBookmark() {
    setState(() {
      futureBookmark = bookmarkDB.list();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 32,
            padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _backButton(context),
                const SizedBox(height: 20),
                _contentPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconButton _backButton(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      alignment: Alignment.centerLeft,
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(PhosphorIconsBold.arrowLeft),
    );
  }

  Column _contentPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bookmark',
          style: GoogleFonts.dmSans(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 32),
        SizedBox(
          height: 200,
          child: FutureBuilder<List<Bookmark>>(
            future: futureBookmark,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    if (snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          'No bookmark yet',
                          style: GoogleFonts.dmSans(
                            color: Colors.amber,
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(
                          'Bookmark available',
                          style: GoogleFonts.dmSans(
                            color: Colors.amber,
                          ),
                        ),
                      );
                    }
                  },
                );
              } else if (snapshot.hasError) {
                return Text(
                  '${snapshot.error}',
                  style: GoogleFonts.dmSans(
                    color: Colors.amber,
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF00BFA6),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
