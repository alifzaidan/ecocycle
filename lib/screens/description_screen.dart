import 'package:ecocycle/models/garbage_model.dart';
import 'package:ecocycle/screens/result_screen.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  late DatabaseReference _databaseReference;
  GarbageModel? garbageData;

  @override
  void initState() {
    super.initState();
    String childTrash;

    if (nameTrash == 'Botol Plastik') {
      childTrash = '1';
    } else if (nameTrash == 'Kardus') {
      childTrash = '2';
    } else {
      childTrash = '0';
    }
    _databaseReference =
        FirebaseDatabase.instance.ref().child('garbage').child(childTrash);
    _databaseReference.once().then((snapshot) {
      setState(() {
        garbageData = GarbageModel.fromDataSnapshot(snapshot.snapshot);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return garbageData == null
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.black,
          ))
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _description(context),
              const SizedBox(height: 20),
              _funfact(context),
              const SizedBox(height: 20),
              _trashGallery(context),
            ],
          );
  }

  Widget _description(BuildContext context) {
    return ExpandablePanel(
      header: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Deskripsi',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      collapsed: Text(
        garbageData!.description,
        style: GoogleFonts.dmSans(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 1.5,
        ),
        textAlign: TextAlign.justify,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      expanded: Text(
        garbageData!.description,
        style: GoogleFonts.dmSans(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 1.5,
        ),
        textAlign: TextAlign.justify,
      ),
      theme: const ExpandableThemeData(crossFadePoint: 0),
    );
  }

  Widget _funfact(BuildContext context) {
    List<String> funfact = garbageData!.funfact.split('   ');
    return ExpandablePanel(
      header: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Funfact',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      collapsed: SizedBox(
        height: 100.0,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: funfact.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                funfact[index],
                style: GoogleFonts.dmSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ),
      ),
      expanded: SizedBox(
        height: 100.0 * funfact.length,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: funfact.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                funfact[index],
                style: GoogleFonts.dmSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
            );
          },
        ),
      ),
      theme: const ExpandableThemeData(crossFadePoint: 0),
    );
  }

  Widget _trashGallery(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Trash Gallery',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: 120,
          child: Scrollbar(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: garbageData!.imageGallery
                  .map(
                    (imagePath) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
