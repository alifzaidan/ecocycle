import 'package:ecocycle/screens/description_screen.dart';
import 'package:ecocycle/screens/droppoint_screen.dart';
import 'package:ecocycle/screens/tutorial_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum Result { description, tutorial }

Map<Result, Widget> resultPage = <Result, Widget>{
  Result.description: const DescriptionScreen(),
  Result.tutorial: const TutorialScreen(),
};

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Result _selectedSegment = Result.description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height - 32,
            padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _backButton(context),
                _imageScan(),
                const SizedBox(height: 20),
                _contentPage(),
                const SizedBox(height: 20),
                _linkDropPoint(context),
                const SizedBox(height: 20),
                _segmentedControl(),
                const SizedBox(height: 20),
                resultPage[_selectedSegment]!,
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

  Widget _imageScan() {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
        alignment: Alignment.center,
        // child: Image.asset(
        //   'assets/images/sampah_plastik.png',
        //   width: 65,
        //   height: 65,
        //   color: Colors.white,
        // ),
      ),
    );
  }

  Column _contentPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Botol Plastik',
          style: GoogleFonts.dmSans(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),
        const SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Sampah Plastik',
                style: TextStyle(fontSize: 16),
              ),
              Icon(
                Icons.circle,
                size: 6,
                color: Colors.black,
              ),
              Text(
                'Rp. 5000 - 8.000 / kg',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _linkDropPoint(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DropPointScreen()));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFF9C951).withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cek Nearby Drop Point',
              style: TextStyle(
                color: Color(0xFF29A77E),
                fontSize: 14,
              ),
            ),
            SizedBox(width: 10),
            Icon(
              PhosphorIconsRegular.arrowSquareOut,
              color: Color(0xFF29A77E),
            ),
          ],
        ),
      ),
    );
  }

  Widget _segmentedControl() {
    return SizedBox(
      width: double.infinity,
      child: SegmentedButton<Result>(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xFF2BD07A)),
          textStyle: MaterialStateProperty.all(
            GoogleFonts.dmSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onSelectionChanged: (value) {
          setState(() {
            _selectedSegment = value.first;
            print(_selectedSegment);
          });
        },
        segments: const <ButtonSegment<Result>>[
          ButtonSegment<Result>(
            value: Result.description,
            label: Text('Description'),
          ),
          ButtonSegment<Result>(
            value: Result.tutorial,
            label: Text('Tutorial'),
          ),
        ],
        selected: <Result>{_selectedSegment},
      ),
    );
  }
}