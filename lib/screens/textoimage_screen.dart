// ignore: must_be_immutable, unused_import
import 'dart:typed_data';

import 'package:final_project/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../localization/app_localization.dart';

// ignore: must_be_immutable
class TexttoImage extends ConsumerWidget {
  TexttoImage({super.key});
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var localizations = AppLocalizations.of(context);
    final fWatch = ref.watch(api_provider);
    final fRead = ref.read(api_provider);

    return Scaffold(
      backgroundColor: const Color(0xff212121),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Flutter AI',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.openSans().fontFamily),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  fWatch.isLoading == true
                      ? Container(
                          alignment: Alignment.center,
                          height: 320,
                          width: 320,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(
                                12.0,
                              )),
                          child: Image.memory(fWatch.imageData!),
                        )
                      : Container(
                          alignment: Alignment.center,
                          height: 320,
                          width: 320,
                          decoration: BoxDecoration(
                              color: const Color(0xff424242),
                              borderRadius: BorderRadius.circular(
                                12.0,
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_outlined,
                                size: 100,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                localizations.getTranslate('no_image'),
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily),
                              ),
                            ],
                          ),
                        ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xff424242),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: TextField(
                      controller: textController,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          fontFamily: GoogleFonts.openSans().fontFamily),
                      cursorColor: Colors.white,
                      maxLines: 5,
                      decoration: InputDecoration(
                          hintText: localizations.getTranslate('enter_prompt'),
                          hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: GoogleFonts.openSans().fontFamily),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(12.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          fRead.textToImage(textController.text, context);
                          fRead.searchingChange(true);
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 160,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.deepPurpleAccent,
                                      Colors.purple
                                    ]),
                                color: Colors.purpleAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                            child: fWatch.isSearching == false
                                ? Text(
                                    localizations.getTranslate('generate'),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            GoogleFonts.openSans().fontFamily),
                                  )
                                : const CircularProgressIndicator(
                                    color: Colors.white,
                                  )),
                      ),
                      GestureDetector(
                        onTap: () {
                          fRead.loadingChange(false);
                          textController.clear();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 160,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.pink, Colors.red]),
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0))),
                          child: Text(
                            localizations.getTranslate('clear'),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.openSans().fontFamily),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
