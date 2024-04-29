import 'package:ecocycle/screens/tutorial_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        _article(context),
        // const SizedBox(height: 20),
      ],
    );
  }

  Column _article(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.width;
    double sizedBoxHeight = screenHeight - MediaQuery.of(context).padding.top;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: sizedBoxHeight,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TutorialDetailScreen(),
                  ));
                },
                child: Stack(
                  children: [
                    Container(
                      height: 180,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(25),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                                alignment: Alignment.center,
                                // child: Image.asset(
                                //   'assets/images/sampah_plastik.png',
                                //   width: 25,
                                //   height: 25,
                                //   color: Colors.white,
                                // ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Vas Bunga',
                                    style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        PhosphorIconsRegular.clock,
                                        color: Colors.grey[400],
                                        size: 17,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '5 minutes ago',
                                        style: GoogleFonts.dmSans(
                                          fontSize: 11,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildGreyButton("Dekorasi"),
                              _buildGreyButton("Interior"),
                              _buildGreyButton("Hiasan"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        decoration: const BoxDecoration(
                          color: Color(0xFFE9F5F1),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  PhosphorIconsFill.heart,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '12',
                                  style: GoogleFonts.dmSans(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Row(
                              children: [
                                const Icon(
                                  PhosphorIconsRegular.chat,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '10',
                                  style: GoogleFonts.dmSans(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Row(
                              children: [
                                const Icon(
                                  PhosphorIconsRegular.shareFat,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '2',
                                  style: GoogleFonts.dmSans(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(
                              PhosphorIconsRegular.bookmarkSimple,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20);
            },
            itemCount: 2,
          ),
        ),
      ],
    );
  }

  Widget _buildGreyButton(String text) {
    return SizedBox(
      width: 100,
      child: Container(
        margin: const EdgeInsets.only(right: 1),
        decoration: BoxDecoration(
          color: const Color(0xffF2F2F4),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
