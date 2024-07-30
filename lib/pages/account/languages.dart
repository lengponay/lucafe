import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../accountWidget/chooseLanguages.dart';
import 'localeProvider.dart';
class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  bool _isCheckedKhmer = false;
  bool _isCheckedEnglish = false;
  bool _isCheckedChinese = false;
  bool _isCheckedKorean = false;

  @override
  Widget build(BuildContext context) {
    var localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors:  [Color.fromARGB(255, 74, 140, 215), Color.fromARGB(255, 217, 222, 222)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top : 60, right : 30, left : 30),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  setState(() {
                    _isCheckedKhmer = true;
                    _isCheckedEnglish = false;
                    _isCheckedChinese = false;
                    _isCheckedKorean = false;
                    localeProvider.setLocale(Locale('km'));
                    Navigator.pop(context);
                  });
                },
                child: chooseLanguage(
                  '',
                  language: "ភាសាខ្មែរ",
                  flag: "lib/images/flag/kh.png",
                  isChecked: _isCheckedKhmer,
                ),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  setState(() {
                    _isCheckedEnglish = true;
                    _isCheckedKhmer = false;
                    _isCheckedChinese = false;
                    _isCheckedKorean = false;
                    localeProvider.setLocale(Locale('en'));
                    Navigator.pop(context);
                  });
                },
                child: chooseLanguage(
                  '',
                  language: 'English',
                  flag: "lib/images/flag/eng.png",
                  isChecked: _isCheckedEnglish,
                ),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  setState(() {
                    _isCheckedChinese = true;
                    _isCheckedKhmer = false;
                    _isCheckedEnglish = false;
                    _isCheckedKorean = false;
                    localeProvider.setLocale(Locale('zh'));
                    Navigator.pop(context);
                  });
                },
                child: chooseLanguage(
                  '',
                  language: "中文",
                  flag: "lib/images/flag/china.png",
                  isChecked: _isCheckedChinese,
                ),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  setState(() {
                    _isCheckedKorean = true;
                    _isCheckedKhmer = false;
                    _isCheckedEnglish = false;
                    _isCheckedChinese = false;
                    localeProvider.setLocale(Locale('ko'));
                    Navigator.pop(context);
                  });
                },
                child: chooseLanguage(
                  '',
                  language: "한국인",
                  flag: "lib/images/flag/kr.jpg",
                  isChecked: _isCheckedKorean,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}