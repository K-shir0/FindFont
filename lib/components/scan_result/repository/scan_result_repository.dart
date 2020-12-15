import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:find_font/components/scan_result/model/font_information.dart';
import 'package:find_font/components/scan_result/model/scan_result.dart';
import 'package:find_font/components/scan_result/model/scan_result_factory.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';

class ScanResultRepository {
  Box _scan_result_box;
  Box _fontInformationBox;

  init() async {
    print("openBox");
    this._scan_result_box = await Hive.openBox('scanResults');
    this._fontInformationBox = await Hive.openBox('fontInformations');

    // _fontInformationBox.clear();
    // _scan_result_box.clear();

    if(_fontInformationBox.length == 0) {
      print("FontList初期化処理");

      _fontInformationBox.add(new FontInformation("Mukta-ExtraBold", "Mukta", "ExtraBold", false ));
      _fontInformationBox.add(new FontInformation("RobotoSlab-Medium", "RobotoSlab", "Medium", false ));
      _fontInformationBox.add(new FontInformation("Lora-Italic", "Lora", "Italic", false ));
      _fontInformationBox.add(new FontInformation("WorkSans-Regular", "WorkSans", "", false ));
      _fontInformationBox.add(new FontInformation("Lato-Italic", "Lato", "Italic", false ));
      _fontInformationBox.add(new FontInformation("SourceSansPro-BlackItalic", "SourceSansPro", "BlackItalic", false ));
      _fontInformationBox.add(new FontInformation("Roboto-Medium", "Roboto", "Medium", false ));
      _fontInformationBox.add(new FontInformation("NotoSans-Regular", "NotoSans", "", false ));
      _fontInformationBox.add(new FontInformation("Rubik-MediumItalic", "Rubik", "MediumItalic", false ));
      _fontInformationBox.add(new FontInformation("Merriweather-Bold", "Merriweather", "Bold", false ));
      _fontInformationBox.add(new FontInformation("Raleway-BoldItalic", "Raleway", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("RobotoMono-Medium", "RobotoMono", "Medium", false ));
      _fontInformationBox.add(new FontInformation("RobotoMono-SemiBold", "RobotoMono", "SemiBold", false ));
      _fontInformationBox.add(new FontInformation("Lato-LightItalic", "Lato", "LightItalic", false ));
      _fontInformationBox.add(new FontInformation("Roboto-Light", "Roboto", "Light", false ));
      _fontInformationBox.add(new FontInformation("Raleway-MediumItalic", "Raleway", "MediumItalic", false ));
      _fontInformationBox.add(new FontInformation("Merriweather-Regular", "Merriweather", "", false ));
      _fontInformationBox.add(new FontInformation("NotoSansJP-Regular", "NotoSansJP", "", false ));
      _fontInformationBox.add(new FontInformation("OpenSansCondensed-Bold", "OpenSansCondensed", "Bold", false ));
      _fontInformationBox.add(new FontInformation("Montserrat-LightItalic", "Montserrat", "LightItalic", false ));
      _fontInformationBox.add(new FontInformation("NotoSansJP-Medium", "NotoSansJP", "Medium", false ));
      _fontInformationBox.add(new FontInformation("OpenSans-SemiBold", "OpenSans", "SemiBold", false ));
      _fontInformationBox.add(new FontInformation("Raleway-ThinItalic", "Raleway", "ThinItalic", false ));
      _fontInformationBox.add(new FontInformation("RobotoMono-SemiBoldItalic", "RobotoMono", "SemiBoldItalic", false ));
      _fontInformationBox.add(new FontInformation("BalsamiqSans-Bold", "BalsamiqSans", "Bold", false ));
      _fontInformationBox.add(new FontInformation("Raleway-ExtraLight", "Raleway", "ExtraLight", false ));
      _fontInformationBox.add(new FontInformation("Lato-Thin", "Lato", "Thin", false ));
      _fontInformationBox.add(new FontInformation("Montserrat-Medium", "Montserrat", "Medium", false ));
      _fontInformationBox.add(new FontInformation("NotoSansJP-Light", "NotoSansJP", "Light", false ));
      _fontInformationBox.add(new FontInformation("Rubik-Bold", "Rubik", "Bold", false ));
      _fontInformationBox.add(new FontInformation("Merriweather-Light", "Merriweather", "Light", false ));
      _fontInformationBox.add(new FontInformation("PTSerif-Italic", "PTSerif", "Italic", false ));
      _fontInformationBox.add(new FontInformation("Ubuntu-Medium", "Ubuntu", "Medium", false ));
      _fontInformationBox.add(new FontInformation("RobotoSlab-SemiBold", "RobotoSlab", "SemiBold", false ));
      _fontInformationBox.add(new FontInformation("SourceSansPro-SemiBoldItalic", "SourceSansPro", "SemiBoldItalic", false ));
      _fontInformationBox.add(new FontInformation("WorkSans-Light", "WorkSans", "Light", false ));
      _fontInformationBox.add(new FontInformation("Poppins-ExtraLight", "Poppins", "ExtraLight", false ));
      _fontInformationBox.add(new FontInformation("Lato-Bold", "Lato", "Bold", false ));
      _fontInformationBox.add(new FontInformation("Lato-Black", "Lato", "Black", false ));
      _fontInformationBox.add(new FontInformation("WorkSans-ExtraBold", "WorkSans", "ExtraBold", false ));
      _fontInformationBox.add(new FontInformation("Oswald-Bold", "Oswald", "Bold", false ));
      _fontInformationBox.add(new FontInformation("PTSans-Italic", "PTSans", "Italic", false ));
      _fontInformationBox.add(new FontInformation("RobotoCondensed-Bold", "RobotoCondensed", "Bold", false ));
      _fontInformationBox.add(new FontInformation("PTSerif-BoldItalic", "PTSerif", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("NotoSerif-BoldItalic", "NotoSerif", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("PlayfairDisplay-Bold", "PlayfairDisplay", "Bold", false ));
      _fontInformationBox.add(new FontInformation("Poppins-ThinItalic", "Poppins", "ThinItalic", false ));
      _fontInformationBox.add(new FontInformation("NotoSerif-Regular", "NotoSerif", "", false ));
      _fontInformationBox.add(new FontInformation("RobotoSlab-ExtraBold", "RobotoSlab", "ExtraBold", false ));
      _fontInformationBox.add(new FontInformation("Lora-Bold", "Lora", "Bold", false ));
      _fontInformationBox.add(new FontInformation("NotoSansKR-Light", "NotoSansKR", "Light", false ));
      _fontInformationBox.add(new FontInformation("Raleway-Medium", "Raleway", "Medium", false ));
      _fontInformationBox.add(new FontInformation("Lora-SemiBold", "Lora", "SemiBold", false ));
      _fontInformationBox.add(new FontInformation("WorkSans-SemiBoldItalic", "WorkSans", "SemiBoldItalic", false ));
      _fontInformationBox.add(new FontInformation("RobotoCondensed-Light", "RobotoCondensed", "Light", false ));
      _fontInformationBox.add(new FontInformation("SourceSansPro-Regular", "SourceSansPro", "", false ));
      _fontInformationBox.add(new FontInformation("Poppins-ExtraLightItalic", "Poppins", "ExtraLightItalic", false ));
      _fontInformationBox.add(new FontInformation("Poppins-BoldItalic", "Poppins", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("WorkSans-MediumItalic", "WorkSans", "MediumItalic", false ));
      _fontInformationBox.add(new FontInformation("Poppins-Light", "Poppins", "Light", false ));
      _fontInformationBox.add(new FontInformation("Raleway-SemiBold", "Raleway", "SemiBold", false ));
      _fontInformationBox.add(new FontInformation("PlayfairDisplay-SemiBold", "PlayfairDisplay", "SemiBold", false ));
      _fontInformationBox.add(new FontInformation("Poppins-Medium", "Poppins", "Medium", false ));
      _fontInformationBox.add(new FontInformation("Roboto-Regular", "Roboto", "", false ));
      _fontInformationBox.add(new FontInformation("RobotoSlab-Thin", "RobotoSlab", "Thin", false ));
      _fontInformationBox.add(new FontInformation("WorkSans-BoldItalic", "WorkSans", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("RobotoMono-Regular", "RobotoMono", "", false ));
      _fontInformationBox.add(new FontInformation("Nunito-ExtraBoldItalic", "Nunito", "ExtraBoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Oswald-SemiBold", "Oswald", "SemiBold", false ));
      _fontInformationBox.add(new FontInformation("Raleway-ExtraBold", "Raleway", "ExtraBold", false ));
      _fontInformationBox.add(new FontInformation("Roboto-MediumItalic", "Roboto", "MediumItalic", false ));
      _fontInformationBox.add(new FontInformation("RobotoSlab-Black", "RobotoSlab", "Black", false ));
      _fontInformationBox.add(new FontInformation("Oswald-Medium", "Oswald", "Medium", false ));
      _fontInformationBox.add(new FontInformation("Montserrat-BoldItalic", "Montserrat", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("SourceSansPro-Bold", "SourceSansPro", "Bold", false ));
      _fontInformationBox.add(new FontInformation("Raleway-ExtraBoldItalic", "Raleway", "ExtraBoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Rubik-SemiBoldItalic", "Rubik", "SemiBoldItalic", false ));
      _fontInformationBox.add(new FontInformation("PTSans-BoldItalic", "PTSans", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("PlayfairDisplay-Medium", "PlayfairDisplay", "Medium", false ));
      _fontInformationBox.add(new FontInformation("Montserrat-Light", "Montserrat", "Light", false ));
      _fontInformationBox.add(new FontInformation("Montserrat-ThinItalic", "Montserrat", "ThinItalic", false ));
      _fontInformationBox.add(new FontInformation("Nunito-ExtraBold", "Nunito", "ExtraBold", false ));
      _fontInformationBox.add(new FontInformation("RobotoCondensed-Italic", "RobotoCondensed", "Italic", false ));
      _fontInformationBox.add(new FontInformation("WorkSans-ExtraLight", "WorkSans", "ExtraLight", false ));
      _fontInformationBox.add(new FontInformation("RobotoMono-LightItalic", "RobotoMono", "LightItalic", false ));
      _fontInformationBox.add(new FontInformation("NotoSansJP-Thin", "NotoSansJP", "Thin", false ));
      _fontInformationBox.add(new FontInformation("Nunito-ExtraLightItalic", "Nunito", "ExtraLightItalic", false ));
      _fontInformationBox.add(new FontInformation("Ubuntu-LightItalic", "Ubuntu", "LightItalic", false ));
      _fontInformationBox.add(new FontInformation("Mukta-SemiBold", "Mukta", "SemiBold", false ));
      _fontInformationBox.add(new FontInformation("WorkSans-ThinItalic", "WorkSans", "ThinItalic", false ));
      _fontInformationBox.add(new FontInformation("Montserrat-ExtraLight", "Montserrat", "ExtraLight", false ));
      _fontInformationBox.add(new FontInformation("Montserrat-Thin", "Montserrat", "Thin", false ));
      _fontInformationBox.add(new FontInformation("Lato-Regular", "Lato", "", false ));
      _fontInformationBox.add(new FontInformation("RobotoCondensed-BoldItalic", "RobotoCondensed", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("BebasNeue-Regular", "BebasNeue", "", false ));
      _fontInformationBox.add(new FontInformation("NotoSans-Bold", "NotoSans", "Bold", false ));
      _fontInformationBox.add(new FontInformation("SourceSansPro-LightItalic", "SourceSansPro", "LightItalic", false ));
      _fontInformationBox.add(new FontInformation("OpenSans-Light", "OpenSans", "Light", false ));
      _fontInformationBox.add(new FontInformation("Raleway-Regular", "Raleway", "", false ));
      _fontInformationBox.add(new FontInformation("Montserrat-Bold", "Montserrat", "Bold", false ));
      _fontInformationBox.add(new FontInformation("Raleway-ExtraLightItalic", "Raleway", "ExtraLightItalic", false ));
      _fontInformationBox.add(new FontInformation("Poppins-SemiBoldItalic", "Poppins", "SemiBoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Merriweather-BoldItalic", "Merriweather", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Montserrat-MediumItalic", "Montserrat", "MediumItalic", false ));
      _fontInformationBox.add(new FontInformation("SourceSansPro-Light", "SourceSansPro", "Light", false ));
      _fontInformationBox.add(new FontInformation("Mukta-Bold", "Mukta", "Bold", false ));
      _fontInformationBox.add(new FontInformation("WorkSans-ExtraLightItalic", "WorkSans", "ExtraLightItalic", false ));
      _fontInformationBox.add(new FontInformation("RobotoMono-BoldItalic", "RobotoMono", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Rubik-Light", "Rubik", "Light", false ));
      _fontInformationBox.add(new FontInformation("OpenSans-Italic", "OpenSans", "Italic", false ));
      _fontInformationBox.add(new FontInformation("Ubuntu-Regular", "Ubuntu", "", false ));
      _fontInformationBox.add(new FontInformation("Raleway-SemiBoldItalic", "Raleway", "SemiBoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Lato-BlackItalic", "Lato", "BlackItalic", false ));
      _fontInformationBox.add(new FontInformation("NotoSansJP-Bold", "NotoSansJP", "Bold", false ));
      _fontInformationBox.add(new FontInformation("Nunito-Light", "Nunito", "Light", false ));
      _fontInformationBox.add(new FontInformation("PTSerif-Bold", "PTSerif", "Bold", false ));
      _fontInformationBox.add(new FontInformation("Nunito-Regular", "Nunito", "", false ));
      _fontInformationBox.add(new FontInformation("Ubuntu-Bold", "Ubuntu", "Bold", false ));
      _fontInformationBox.add(new FontInformation("Lora-SemiBoldItalic", "Lora", "SemiBoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Montserrat-BlackItalic", "Montserrat", "BlackItalic", false ));
      _fontInformationBox.add(new FontInformation("WorkSans-Medium", "WorkSans", "Medium", false ));
      _fontInformationBox.add(new FontInformation("RobotoMono-ExtraLight", "RobotoMono", "ExtraLight", false ));
      _fontInformationBox.add(new FontInformation("RussoOne-Regular", "RussoOne", "", false ));
      _fontInformationBox.add(new FontInformation("Raleway-Light", "Raleway", "Light", false ));
      _fontInformationBox.add(new FontInformation("PlayfairDisplay-BoldItalic", "PlayfairDisplay", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Rubik-Medium", "Rubik", "Medium", false ));
      _fontInformationBox.add(new FontInformation("Mukta-ExtraLight", "Mukta", "ExtraLight", false ));
      _fontInformationBox.add(new FontInformation("RobotoSlab-Bold", "RobotoSlab", "Bold", false ));
      _fontInformationBox.add(new FontInformation("RobotoMono-ThinItalic", "RobotoMono", "ThinItalic", false ));
      _fontInformationBox.add(new FontInformation("Nunito-SemiBold", "Nunito", "SemiBold", false ));
      _fontInformationBox.add(new FontInformation("Poppins-ExtraBoldItalic", "Poppins", "ExtraBoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Nunito-Bold", "Nunito", "Bold", false ));
      _fontInformationBox.add(new FontInformation("Rubik-ExtraBoldItalic", "Rubik", "ExtraBoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Nunito-BoldItalic", "Nunito", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Nunito-Black", "Nunito", "Black", false ));
      _fontInformationBox.add(new FontInformation("Oswald-Regular", "Oswald", "", false ));
      _fontInformationBox.add(new FontInformation("Mukta-Light", "Mukta", "Light", false ));
      _fontInformationBox.add(new FontInformation("WorkSans-SemiBold", "WorkSans", "SemiBold", false ));
      _fontInformationBox.add(new FontInformation("Rubik-Black", "Rubik", "Black", false ));
      _fontInformationBox.add(new FontInformation("RobotoCondensed-LightItalic", "RobotoCondensed", "LightItalic", false ));
      _fontInformationBox.add(new FontInformation("Poppins-ExtraBold", "Poppins", "ExtraBold", false ));
      _fontInformationBox.add(new FontInformation("SourceSansPro-Black", "SourceSansPro", "Black", false ));
      _fontInformationBox.add(new FontInformation("Nunito-ExtraLight", "Nunito", "ExtraLight", false ));
      _fontInformationBox.add(new FontInformation("PlayfairDisplay-ExtraBoldItalic", "PlayfairDisplay", "ExtraBoldItalic", false ));
      _fontInformationBox.add(new FontInformation("OpenSans-ExtraBold", "OpenSans", "ExtraBold", false ));
      _fontInformationBox.add(new FontInformation("Nunito-SemiBoldItalic", "Nunito", "SemiBoldItalic", false ));
      _fontInformationBox.add(new FontInformation("NotoSerif-Italic", "NotoSerif", "Italic", false ));
      _fontInformationBox.add(new FontInformation("PlayfairDisplay-Italic", "PlayfairDisplay", "Italic", false ));
      _fontInformationBox.add(new FontInformation("PlayfairDisplay-Regular", "PlayfairDisplay", "", false ));
      _fontInformationBox.add(new FontInformation("Montserrat-SemiBold", "Montserrat", "SemiBold", false ));
      _fontInformationBox.add(new FontInformation("Nunito-BlackItalic", "Nunito", "BlackItalic", false ));
      _fontInformationBox.add(new FontInformation("Merriweather-BlackItalic", "Merriweather", "BlackItalic", false ));
      _fontInformationBox.add(new FontInformation("NotoSansKR-Bold", "NotoSansKR", "Bold", false ));
      _fontInformationBox.add(new FontInformation("OpenSans-LightItalic", "OpenSans", "LightItalic", false ));
      _fontInformationBox.add(new FontInformation("Raleway-Black", "Raleway", "Black", false ));
      _fontInformationBox.add(new FontInformation("Montserrat-ExtraLightItalic", "Montserrat", "ExtraLightItalic", false ));
      _fontInformationBox.add(new FontInformation("Ubuntu-MediumItalic", "Ubuntu", "MediumItalic", false ));
      _fontInformationBox.add(new FontInformation("RobotoMono-ExtraLightItalic", "RobotoMono", "ExtraLightItalic", false ));
      _fontInformationBox.add(new FontInformation("RobotoSlab-Light", "RobotoSlab", "Light", false ));
      _fontInformationBox.add(new FontInformation("Poppins-BlackItalic", "Poppins", "BlackItalic", false ));
      _fontInformationBox.add(new FontInformation("Rubik-Italic", "Rubik", "Italic", false ));
      _fontInformationBox.add(new FontInformation("NotoSansKR-Thin", "NotoSansKR", "Thin", false ));
      _fontInformationBox.add(new FontInformation("Lora-MediumItalic", "Lora", "MediumItalic", false ));
      _fontInformationBox.add(new FontInformation("WorkSans-Italic", "WorkSans", "Italic", false ));
      _fontInformationBox.add(new FontInformation("Rubik-LightItalic", "Rubik", "LightItalic", false ));
      _fontInformationBox.add(new FontInformation("Montserrat-ExtraBold", "Montserrat", "ExtraBold", false ));
      _fontInformationBox.add(new FontInformation("Roboto-ThinItalic", "Roboto", "ThinItalic", false ));
      _fontInformationBox.add(new FontInformation("BalsamiqSans-Italic", "BalsamiqSans", "Italic", false ));
      _fontInformationBox.add(new FontInformation("Raleway-BlackItalic", "Raleway", "BlackItalic", false ));
      _fontInformationBox.add(new FontInformation("RobotoCondensed-Regular", "RobotoCondensed", "", false ));
      _fontInformationBox.add(new FontInformation("OpenSansCondensed-LightItalic", "OpenSansCondensed", "LightItalic", false ));
      _fontInformationBox.add(new FontInformation("NotoSerif-Bold", "NotoSerif", "Bold", false ));
      _fontInformationBox.add(new FontInformation("RobotoMono-Light", "RobotoMono", "Light", false ));
      _fontInformationBox.add(new FontInformation("PTSans-Regular", "PTSans", "", false ));
      _fontInformationBox.add(new FontInformation("OpenSans-Bold", "OpenSans", "Bold", false ));
      _fontInformationBox.add(new FontInformation("Roboto-BoldItalic", "Roboto", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Rubik-SemiBold", "Rubik", "SemiBold", false ));
      _fontInformationBox.add(new FontInformation("Poppins-Regular", "Poppins", "", false ));
      _fontInformationBox.add(new FontInformation("Montserrat-Black", "Montserrat", "Black", false ));
      _fontInformationBox.add(new FontInformation("WorkSans-BlackItalic", "WorkSans", "BlackItalic", false ));
      _fontInformationBox.add(new FontInformation("OpenSans-SemiBoldItalic", "OpenSans", "SemiBoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Roboto-LightItalic", "Roboto", "LightItalic", false ));
      _fontInformationBox.add(new FontInformation("Alata-Regular", "Alata", "", false ));
      _fontInformationBox.add(new FontInformation("NotoSans-BoldItalic", "NotoSans", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("WorkSans-Thin", "WorkSans", "Thin", false ));
      _fontInformationBox.add(new FontInformation("Rubik-BlackItalic", "Rubik", "BlackItalic", false ));
      _fontInformationBox.add(new FontInformation("SourceSansPro-ExtraLight", "SourceSansPro", "ExtraLight", false ));
      _fontInformationBox.add(new FontInformation("Poppins-LightItalic", "Poppins", "LightItalic", false ));
      _fontInformationBox.add(new FontInformation("Lato-BoldItalic", "Lato", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Montserrat-Regular", "Montserrat", "", false ));
      _fontInformationBox.add(new FontInformation("WorkSans-Black", "WorkSans", "Black", false ));
      _fontInformationBox.add(new FontInformation("RobotoMono-MediumItalic", "RobotoMono", "MediumItalic", false ));
      _fontInformationBox.add(new FontInformation("Lato-Light", "Lato", "Light", false ));
      _fontInformationBox.add(new FontInformation("BalsamiqSans-BoldItalic", "BalsamiqSans", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Raleway-LightItalic", "Raleway", "LightItalic", false ));
      _fontInformationBox.add(new FontInformation("Nunito-Italic", "Nunito", "Italic", false ));
      _fontInformationBox.add(new FontInformation("Montserrat-Italic", "Montserrat", "Italic", false ));
      _fontInformationBox.add(new FontInformation("RobotoMono-Bold", "RobotoMono", "Bold", false ));
      _fontInformationBox.add(new FontInformation("PTSans-Bold", "PTSans", "Bold", false ));
      _fontInformationBox.add(new FontInformation("OpenSans-ExtraBoldItalic", "OpenSans", "ExtraBoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Raleway-Thin", "Raleway", "Thin", false ));
      _fontInformationBox.add(new FontInformation("SourceSansPro-BoldItalic", "SourceSansPro", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Lato-ThinItalic", "Lato", "ThinItalic", false ));
      _fontInformationBox.add(new FontInformation("Roboto-Italic", "Roboto", "Italic", false ));
      _fontInformationBox.add(new FontInformation("Rubik-ExtraBold", "Rubik", "ExtraBold", false ));
      _fontInformationBox.add(new FontInformation("SourceSansPro-SemiBold", "SourceSansPro", "SemiBold", false ));
      _fontInformationBox.add(new FontInformation("Poppins-Bold", "Poppins", "Bold", false ));
      _fontInformationBox.add(new FontInformation("Lora-Medium", "Lora", "Medium", false ));
      _fontInformationBox.add(new FontInformation("Lora-BoldItalic", "Lora", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Mukta-Medium", "Mukta", "Medium", false ));
      _fontInformationBox.add(new FontInformation("Merriweather-Italic", "Merriweather", "Italic", false ));
      _fontInformationBox.add(new FontInformation("KronaOne-Regular", "KronaOne", "", false ));
      _fontInformationBox.add(new FontInformation("Roboto-BlackItalic", "Roboto", "BlackItalic", false ));
      _fontInformationBox.add(new FontInformation("NotoSansKR-Black", "NotoSansKR", "Black", false ));
      _fontInformationBox.add(new FontInformation("PlayfairDisplay-Black", "PlayfairDisplay", "Black", false ));
      _fontInformationBox.add(new FontInformation("OpenSans-Regular", "OpenSans", "", false ));
      _fontInformationBox.add(new FontInformation("RobotoMono-Italic", "RobotoMono", "Italic", false ));
      _fontInformationBox.add(new FontInformation("PlayfairDisplay-SemiBoldItalic", "PlayfairDisplay", "SemiBoldItalic", false ));
      _fontInformationBox.add(new FontInformation("RobotoSlab-ExtraLight", "RobotoSlab", "ExtraLight", false ));
      _fontInformationBox.add(new FontInformation("Rubik-Regular", "Rubik", "", false ));
      _fontInformationBox.add(new FontInformation("Poppins-Black", "Poppins", "Black", false ));
      _fontInformationBox.add(new FontInformation("OpenSans-BoldItalic", "OpenSans", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Roboto-Bold", "Roboto", "Bold", false ));
      _fontInformationBox.add(new FontInformation("WorkSans-LightItalic", "WorkSans", "LightItalic", false ));
      _fontInformationBox.add(new FontInformation("OpenSansCondensed-Light", "OpenSansCondensed", "Light", false ));
      _fontInformationBox.add(new FontInformation("Ubuntu-BoldItalic", "Ubuntu", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Roboto-Thin", "Roboto", "Thin", false ));
      _fontInformationBox.add(new FontInformation("NotoSansKR-Medium", "NotoSansKR", "Medium", false ));
      _fontInformationBox.add(new FontInformation("LexendPeta-Regular", "LexendPeta", "", false ));
      _fontInformationBox.add(new FontInformation("PlayfairDisplay-MediumItalic", "PlayfairDisplay", "MediumItalic", false ));
      _fontInformationBox.add(new FontInformation("Lora-Regular", "Lora", "", false ));
      _fontInformationBox.add(new FontInformation("Raleway-Italic", "Raleway", "Italic", false ));
      _fontInformationBox.add(new FontInformation("Roboto-Black", "Roboto", "Black", false ));
      _fontInformationBox.add(new FontInformation("Oswald-ExtraLight", "Oswald", "ExtraLight", false ));
      _fontInformationBox.add(new FontInformation("Mukta-Regular", "Mukta", "", false ));
      _fontInformationBox.add(new FontInformation("Poppins-Thin", "Poppins", "Thin", false ));
      _fontInformationBox.add(new FontInformation("BalsamiqSans-Regular", "BalsamiqSans", "", false ));
      _fontInformationBox.add(new FontInformation("Poppins-SemiBold", "Poppins", "SemiBold", false ));
      _fontInformationBox.add(new FontInformation("Raleway-Bold", "Raleway", "Bold", false ));
      _fontInformationBox.add(new FontInformation("Poppins-Italic", "Poppins", "Italic", false ));
      _fontInformationBox.add(new FontInformation("SourceSansPro-ExtraLightItalic", "SourceSansPro", "ExtraLightItalic", false ));
      _fontInformationBox.add(new FontInformation("PlayfairDisplay-BlackItalic", "PlayfairDisplay", "BlackItalic", false ));
      _fontInformationBox.add(new FontInformation("RobotoMono-Thin", "RobotoMono", "Thin", false ));
      _fontInformationBox.add(new FontInformation("PlayfairDisplay-ExtraBold", "PlayfairDisplay", "ExtraBold", false ));
      _fontInformationBox.add(new FontInformation("Merriweather-Black", "Merriweather", "Black", false ));
      _fontInformationBox.add(new FontInformation("Ubuntu-Italic", "Ubuntu", "Italic", false ));
      _fontInformationBox.add(new FontInformation("NotoSansJP-Black", "NotoSansJP", "Black", false ));
      _fontInformationBox.add(new FontInformation("SourceSansPro-Italic", "SourceSansPro", "Italic", false ));
      _fontInformationBox.add(new FontInformation("Montserrat-SemiBoldItalic", "Montserrat", "SemiBoldItalic", false ));
      _fontInformationBox.add(new FontInformation("PTSerif-Regular", "PTSerif", "", false ));
      _fontInformationBox.add(new FontInformation("Merriweather-LightItalic", "Merriweather", "LightItalic", false ));
      _fontInformationBox.add(new FontInformation("Nunito-LightItalic", "Nunito", "LightItalic", false ));
      _fontInformationBox.add(new FontInformation("RobotoSlab-Regular", "RobotoSlab", "", false ));
      _fontInformationBox.add(new FontInformation("Oswald-Light", "Oswald", "Light", false ));
      _fontInformationBox.add(new FontInformation("Montserrat-ExtraBoldItalic", "Montserrat", "ExtraBoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Ubuntu-Light", "Ubuntu", "Light", false ));
      _fontInformationBox.add(new FontInformation("WorkSans-ExtraBoldItalic", "WorkSans", "ExtraBoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Rubik-BoldItalic", "Rubik", "BoldItalic", false ));
      _fontInformationBox.add(new FontInformation("Poppins-MediumItalic", "Poppins", "MediumItalic", false ));
      _fontInformationBox.add(new FontInformation("NotoSansKR-Regular", "NotoSansKR", "", false ));
      _fontInformationBox.add(new FontInformation("NotoSans-Italic", "NotoSans", "Italic", false ));
      _fontInformationBox.add(new FontInformation("WorkSans-Bold", "WorkSans", "Bold", false ));
    }

    print("box設置完了" + _fontInformationBox.length.toString());
  }

  Future<void> store(String path, String filename) async {
    final url = DotEnv().env['FIND_FONT_SERVER_URL'];

    Dio dio = new Dio();

    FormData formData = new FormData.fromMap(
        {"photo": await MultipartFile.fromFile(path, filename: filename)});

    // 取得処理
    try {
      print("送信開始");
      final response = await dio.post(url, data: formData);

      // 送信成功
      print(response.data['prediction']);

      var prediction = response.data['prediction'];

      // データの保存処理
      ScanResultFactory scanResultFactory = new ScanResultFactory();
      ScanResult scanResult = scanResultFactory.create();

      scanResult.fontInformationList = HiveList(_fontInformationBox);

      for (int a in prediction) {
        // 配列への問合せ
        print(_fontInformationBox.getAt(0));
        scanResult.fontInformationList.add(_fontInformationBox.getAt(a));
      }

      print(scanResult.fontInformationList);

      print("保存");
      _scan_result_box.add(scanResult);

    } on DioError catch (e) {
      print(e.message);
      print(e);
    }

    // Map<String, dynamic> test =
    //     json.decode('{"model":"VGG16","prediction":[45,68,72,95,174]}');
    //
    // var prediction = test['prediction'];
    //
    // // _scan_result_box.clear();
    //
    // // データの保存
    // ScanResultFactory scanResultFactory = new ScanResultFactory();
    // ScanResult scanResult = scanResultFactory.create();
    //
    // scanResult.fontInformationList = HiveList(_fontInformationBox);

    // for (int a in prediction) {
    //   // 配列への問合せ
    //   print(_fontInformationBox.getAt(0));
    //   scanResult.fontInformationList.add(_fontInformationBox.getAt(a));
    // }
    //
    // print(scanResult.fontInformationList);
    //
    // print("保存");
    // _scan_result_box.add(scanResult);
  }

  getAll() {
    List _scanResultList = [];

    print("BOXの長さ " + _scan_result_box.length.toString());

    for (var i = 0; i < _scan_result_box.length; i++) {
      _scanResultList.add(_scan_result_box.getAt(i));
    }

    return _scanResultList;
  }

  getById(int id) {
    return _scan_result_box.getAt(id);
  }
}
