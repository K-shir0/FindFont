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

    // this._fontInformationBox.clear();
    // this._scan_result_box.clear();

    if (_fontInformationBox.length == 0) {
      print("FontList初期化処理 - 開始");

      _fontInformationBox
          .add(new FontInformation(0, "Alata-Regular", "Alata", "", false));
      _fontInformationBox.add(new FontInformation(
          1, "BalsamiqSans-Bold", "BalsamiqSans", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          2, "BalsamiqSans-BoldItalic", "BalsamiqSans", "BoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          3, "BalsamiqSans-Italic", "BalsamiqSans", "Italic", false));
      _fontInformationBox.add(new FontInformation(
          4, "BalsamiqSans-Regular", "BalsamiqSans", "", false));
      _fontInformationBox.add(
          new FontInformation(5, "BebasNeue-Regular", "BebasNeue", "", false));
      _fontInformationBox.add(
          new FontInformation(6, "KronaOne-Regular", "KronaOne", "", false));
      _fontInformationBox
          .add(new FontInformation(7, "Lato-Black", "Lato", "Black", false));
      _fontInformationBox.add(new FontInformation(
          8, "Lato-BlackItalic", "Lato", "BlackItalic", false));
      _fontInformationBox
          .add(new FontInformation(9, "Lato-Bold", "Lato", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          10, "Lato-BoldItalic", "Lato", "BoldItalic", false));
      _fontInformationBox
          .add(new FontInformation(11, "Lato-Italic", "Lato", "Italic", false));
      _fontInformationBox
          .add(new FontInformation(12, "Lato-Light", "Lato", "Light", false));
      _fontInformationBox.add(new FontInformation(
          13, "Lato-LightItalic", "Lato", "LightItalic", false));
      _fontInformationBox
          .add(new FontInformation(14, "Lato-Regular", "Lato", "", false));
      _fontInformationBox
          .add(new FontInformation(15, "Lato-Thin", "Lato", "Thin", false));
      _fontInformationBox.add(new FontInformation(
          16, "Lato-ThinItalic", "Lato", "ThinItalic", false));
      _fontInformationBox.add(new FontInformation(
          17, "LexendPeta-Regular", "LexendPeta", "", false));
      _fontInformationBox
          .add(new FontInformation(18, "Lora-Bold", "Lora", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          19, "Lora-BoldItalic", "Lora", "BoldItalic", false));
      _fontInformationBox
          .add(new FontInformation(20, "Lora-Italic", "Lora", "Italic", false));
      _fontInformationBox
          .add(new FontInformation(21, "Lora-Medium", "Lora", "Medium", false));
      _fontInformationBox.add(new FontInformation(
          22, "Lora-MediumItalic", "Lora", "MediumItalic", false));
      _fontInformationBox
          .add(new FontInformation(23, "Lora-Regular", "Lora", "", false));
      _fontInformationBox.add(
          new FontInformation(24, "Lora-SemiBold", "Lora", "SemiBold", false));
      _fontInformationBox.add(new FontInformation(
          25, "Lora-SemiBoldItalic", "Lora", "SemiBoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          26, "Merriweather-Black", "Merriweather", "Black", false));
      _fontInformationBox.add(new FontInformation(27,
          "Merriweather-BlackItalic", "Merriweather", "BlackItalic", false));
      _fontInformationBox.add(new FontInformation(
          28, "Merriweather-Bold", "Merriweather", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          29, "Merriweather-BoldItalic", "Merriweather", "BoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          30, "Merriweather-Italic", "Merriweather", "Italic", false));
      _fontInformationBox.add(new FontInformation(
          31, "Merriweather-Light", "Merriweather", "Light", false));
      _fontInformationBox.add(new FontInformation(32,
          "Merriweather-LightItalic", "Merriweather", "LightItalic", false));
      _fontInformationBox.add(new FontInformation(
          33, "Merriweather-Regular", "Merriweather", "", false));
      _fontInformationBox.add(new FontInformation(
          34, "Montserrat-Black", "Montserrat", "Black", false));
      _fontInformationBox.add(new FontInformation(
          35, "Montserrat-BlackItalic", "Montserrat", "BlackItalic", false));
      _fontInformationBox.add(new FontInformation(
          36, "Montserrat-Bold", "Montserrat", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          37, "Montserrat-BoldItalic", "Montserrat", "BoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          38, "Montserrat-ExtraBold", "Montserrat", "ExtraBold", false));
      _fontInformationBox.add(new FontInformation(
          39,
          "Montserrat-ExtraBoldItalic",
          "Montserrat",
          "ExtraBoldItalic",
          false));
      _fontInformationBox.add(new FontInformation(
          40, "Montserrat-ExtraLight", "Montserrat", "ExtraLight", false));
      _fontInformationBox.add(new FontInformation(
          41,
          "Montserrat-ExtraLightItalic",
          "Montserrat",
          "ExtraLightItalic",
          false));
      _fontInformationBox.add(new FontInformation(
          42, "Montserrat-Italic", "Montserrat", "Italic", false));
      _fontInformationBox.add(new FontInformation(
          43, "Montserrat-Light", "Montserrat", "Light", false));
      _fontInformationBox.add(new FontInformation(
          44, "Montserrat-LightItalic", "Montserrat", "LightItalic", false));
      _fontInformationBox.add(new FontInformation(
          45, "Montserrat-Medium", "Montserrat", "Medium", false));
      _fontInformationBox.add(new FontInformation(
          46, "Montserrat-MediumItalic", "Montserrat", "MediumItalic", false));
      _fontInformationBox.add(new FontInformation(
          47, "Montserrat-Regular", "Montserrat", "", false));
      _fontInformationBox.add(new FontInformation(
          48, "Montserrat-SemiBold", "Montserrat", "SemiBold", false));
      _fontInformationBox.add(new FontInformation(49,
          "Montserrat-SemiBoldItalic", "Montserrat", "SemiBoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          50, "Montserrat-Thin", "Montserrat", "Thin", false));
      _fontInformationBox.add(new FontInformation(
          51, "Montserrat-ThinItalic", "Montserrat", "ThinItalic", false));
      _fontInformationBox
          .add(new FontInformation(52, "Mukta-Bold", "Mukta", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          53, "Mukta-ExtraBold", "Mukta", "ExtraBold", false));
      _fontInformationBox.add(new FontInformation(
          54, "Mukta-ExtraLight", "Mukta", "ExtraLight", false));
      _fontInformationBox
          .add(new FontInformation(55, "Mukta-Light", "Mukta", "Light", false));
      _fontInformationBox.add(
          new FontInformation(56, "Mukta-Medium", "Mukta", "Medium", false));
      _fontInformationBox
          .add(new FontInformation(57, "Mukta-Regular", "Mukta", "", false));
      _fontInformationBox.add(new FontInformation(
          58, "Mukta-SemiBold", "Mukta", "SemiBold", false));
      _fontInformationBox.add(
          new FontInformation(59, "NotoSans-Bold", "NotoSans", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          60, "NotoSans-BoldItalic", "NotoSans", "BoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          61, "NotoSans-Italic", "NotoSans", "Italic", false));
      _fontInformationBox.add(
          new FontInformation(62, "NotoSans-Regular", "NotoSans", "", false));
      _fontInformationBox.add(new FontInformation(
          63, "NotoSansJP-Black", "NotoSansJP", "Black", false));
      _fontInformationBox.add(new FontInformation(
          64, "NotoSansJP-Bold", "NotoSansJP", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          65, "NotoSansJP-Light", "NotoSansJP", "Light", false));
      _fontInformationBox.add(new FontInformation(
          66, "NotoSansJP-Medium", "NotoSansJP", "Medium", false));
      _fontInformationBox.add(new FontInformation(
          67, "NotoSansJP-Regular", "NotoSansJP", "", false));
      _fontInformationBox.add(new FontInformation(
          68, "NotoSansJP-Thin", "NotoSansJP", "Thin", false));
      _fontInformationBox.add(new FontInformation(
          69, "NotoSansKR-Black", "NotoSansKR", "Black", false));
      _fontInformationBox.add(new FontInformation(
          70, "NotoSansKR-Bold", "NotoSansKR", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          71, "NotoSansKR-Light", "NotoSansKR", "Light", false));
      _fontInformationBox.add(new FontInformation(
          72, "NotoSansKR-Medium", "NotoSansKR", "Medium", false));
      _fontInformationBox.add(new FontInformation(
          73, "NotoSansKR-Regular", "NotoSansKR", "", false));
      _fontInformationBox.add(new FontInformation(
          74, "NotoSansKR-Thin", "NotoSansKR", "Thin", false));
      _fontInformationBox.add(new FontInformation(
          75, "NotoSerif-Bold", "NotoSerif", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          76, "NotoSerif-BoldItalic", "NotoSerif", "BoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          77, "NotoSerif-Italic", "NotoSerif", "Italic", false));
      _fontInformationBox.add(
          new FontInformation(78, "NotoSerif-Regular", "NotoSerif", "", false));
      _fontInformationBox.add(
          new FontInformation(79, "Nunito-Black", "Nunito", "Black", false));
      _fontInformationBox.add(new FontInformation(
          80, "Nunito-BlackItalic", "Nunito", "BlackItalic", false));
      _fontInformationBox
          .add(new FontInformation(81, "Nunito-Bold", "Nunito", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          82, "Nunito-BoldItalic", "Nunito", "BoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          83, "Nunito-ExtraBold", "Nunito", "ExtraBold", false));
      _fontInformationBox.add(new FontInformation(
          84, "Nunito-ExtraBoldItalic", "Nunito", "ExtraBoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          85, "Nunito-ExtraLight", "Nunito", "ExtraLight", false));
      _fontInformationBox.add(new FontInformation(
          86, "Nunito-ExtraLightItalic", "Nunito", "ExtraLightItalic", false));
      _fontInformationBox.add(
          new FontInformation(87, "Nunito-Italic", "Nunito", "Italic", false));
      _fontInformationBox.add(
          new FontInformation(88, "Nunito-Light", "Nunito", "Light", false));
      _fontInformationBox.add(new FontInformation(
          89, "Nunito-LightItalic", "Nunito", "LightItalic", false));
      _fontInformationBox
          .add(new FontInformation(90, "Nunito-Regular", "Nunito", "", false));
      _fontInformationBox.add(new FontInformation(
          91, "Nunito-SemiBold", "Nunito", "SemiBold", false));
      _fontInformationBox.add(new FontInformation(
          92, "Nunito-SemiBoldItalic", "Nunito", "SemiBoldItalic", false));
      _fontInformationBox.add(
          new FontInformation(93, "OpenSans-Bold", "OpenSans", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          94, "OpenSans-BoldItalic", "OpenSans", "BoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          95, "OpenSans-ExtraBold", "OpenSans", "ExtraBold", false));
      _fontInformationBox.add(new FontInformation(96,
          "OpenSans-ExtraBoldItalic", "OpenSans", "ExtraBoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          97, "OpenSans-Italic", "OpenSans", "Italic", false));
      _fontInformationBox.add(new FontInformation(
          98, "OpenSans-Light", "OpenSans", "Light", false));
      _fontInformationBox.add(new FontInformation(
          99, "OpenSans-LightItalic", "OpenSans", "LightItalic", false));
      _fontInformationBox.add(
          new FontInformation(100, "OpenSans-Regular", "OpenSans", "", false));
      _fontInformationBox.add(new FontInformation(
          101, "OpenSans-SemiBold", "OpenSans", "SemiBold", false));
      _fontInformationBox.add(new FontInformation(
          102, "OpenSans-SemiBoldItalic", "OpenSans", "SemiBoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          103, "OpenSansCondensed-Bold", "OpenSansCondensed", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          104, "OpenSansCondensed-Light", "OpenSansCondensed", "Light", false));
      _fontInformationBox.add(new FontInformation(
          105,
          "OpenSansCondensed-LightItalic",
          "OpenSansCondensed",
          "LightItalic",
          false));
      _fontInformationBox.add(
          new FontInformation(106, "Oswald-Bold", "Oswald", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          107, "Oswald-ExtraLight", "Oswald", "ExtraLight", false));
      _fontInformationBox.add(
          new FontInformation(108, "Oswald-Light", "Oswald", "Light", false));
      _fontInformationBox.add(
          new FontInformation(109, "Oswald-Medium", "Oswald", "Medium", false));
      _fontInformationBox
          .add(new FontInformation(110, "Oswald-Regular", "Oswald", "", false));
      _fontInformationBox.add(new FontInformation(
          111, "Oswald-SemiBold", "Oswald", "SemiBold", false));
      _fontInformationBox.add(
          new FontInformation(112, "PTSans-Bold", "PTSans", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          113, "PTSans-BoldItalic", "PTSans", "BoldItalic", false));
      _fontInformationBox.add(
          new FontInformation(114, "PTSans-Italic", "PTSans", "Italic", false));
      _fontInformationBox
          .add(new FontInformation(115, "PTSans-Regular", "PTSans", "", false));
      _fontInformationBox.add(
          new FontInformation(116, "PTSerif-Bold", "PTSerif", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          117, "PTSerif-BoldItalic", "PTSerif", "BoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          118, "PTSerif-Italic", "PTSerif", "Italic", false));
      _fontInformationBox.add(
          new FontInformation(119, "PTSerif-Regular", "PTSerif", "", false));
      _fontInformationBox.add(new FontInformation(
          120, "PlayfairDisplay-Black", "PlayfairDisplay", "Black", false));
      _fontInformationBox.add(new FontInformation(
          121,
          "PlayfairDisplay-BlackItalic",
          "PlayfairDisplay",
          "BlackItalic",
          false));
      _fontInformationBox.add(new FontInformation(
          122, "PlayfairDisplay-Bold", "PlayfairDisplay", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          123,
          "PlayfairDisplay-BoldItalic",
          "PlayfairDisplay",
          "BoldItalic",
          false));
      _fontInformationBox.add(new FontInformation(124,
          "PlayfairDisplay-ExtraBold", "PlayfairDisplay", "ExtraBold", false));
      _fontInformationBox.add(new FontInformation(
          125,
          "PlayfairDisplay-ExtraBoldItalic",
          "PlayfairDisplay",
          "ExtraBoldItalic",
          false));
      _fontInformationBox.add(new FontInformation(
          126, "PlayfairDisplay-Italic", "PlayfairDisplay", "Italic", false));
      _fontInformationBox.add(new FontInformation(
          127, "PlayfairDisplay-Medium", "PlayfairDisplay", "Medium", false));
      _fontInformationBox.add(new FontInformation(
          128,
          "PlayfairDisplay-MediumItalic",
          "PlayfairDisplay",
          "MediumItalic",
          false));
      _fontInformationBox.add(new FontInformation(
          129, "PlayfairDisplay-Regular", "PlayfairDisplay", "", false));
      _fontInformationBox.add(new FontInformation(130,
          "PlayfairDisplay-SemiBold", "PlayfairDisplay", "SemiBold", false));
      _fontInformationBox.add(new FontInformation(
          131,
          "PlayfairDisplay-SemiBoldItalic",
          "PlayfairDisplay",
          "SemiBoldItalic",
          false));
      _fontInformationBox.add(
          new FontInformation(132, "Poppins-Black", "Poppins", "Black", false));
      _fontInformationBox.add(new FontInformation(
          133, "Poppins-BlackItalic", "Poppins", "BlackItalic", false));
      _fontInformationBox.add(
          new FontInformation(134, "Poppins-Bold", "Poppins", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          135, "Poppins-BoldItalic", "Poppins", "BoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          136, "Poppins-ExtraBold", "Poppins", "ExtraBold", false));
      _fontInformationBox.add(new FontInformation(
          137, "Poppins-ExtraBoldItalic", "Poppins", "ExtraBoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          138, "Poppins-ExtraLight", "Poppins", "ExtraLight", false));
      _fontInformationBox.add(new FontInformation(139,
          "Poppins-ExtraLightItalic", "Poppins", "ExtraLightItalic", false));
      _fontInformationBox.add(new FontInformation(
          140, "Poppins-Italic", "Poppins", "Italic", false));
      _fontInformationBox.add(
          new FontInformation(141, "Poppins-Light", "Poppins", "Light", false));
      _fontInformationBox.add(new FontInformation(
          142, "Poppins-LightItalic", "Poppins", "LightItalic", false));
      _fontInformationBox.add(new FontInformation(
          143, "Poppins-Medium", "Poppins", "Medium", false));
      _fontInformationBox.add(new FontInformation(
          144, "Poppins-MediumItalic", "Poppins", "MediumItalic", false));
      _fontInformationBox.add(
          new FontInformation(145, "Poppins-Regular", "Poppins", "", false));
      _fontInformationBox.add(new FontInformation(
          146, "Poppins-SemiBold", "Poppins", "SemiBold", false));
      _fontInformationBox.add(new FontInformation(
          147, "Poppins-SemiBoldItalic", "Poppins", "SemiBoldItalic", false));
      _fontInformationBox.add(
          new FontInformation(148, "Poppins-Thin", "Poppins", "Thin", false));
      _fontInformationBox.add(new FontInformation(
          149, "Poppins-ThinItalic", "Poppins", "ThinItalic", false));
      _fontInformationBox.add(
          new FontInformation(150, "Raleway-Black", "Raleway", "Black", false));
      _fontInformationBox.add(new FontInformation(
          151, "Raleway-BlackItalic", "Raleway", "BlackItalic", false));
      _fontInformationBox.add(
          new FontInformation(152, "Raleway-Bold", "Raleway", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          153, "Raleway-BoldItalic", "Raleway", "BoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          154, "Raleway-ExtraBold", "Raleway", "ExtraBold", false));
      _fontInformationBox.add(new FontInformation(
          155, "Raleway-ExtraBoldItalic", "Raleway", "ExtraBoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          156, "Raleway-ExtraLight", "Raleway", "ExtraLight", false));
      _fontInformationBox.add(new FontInformation(157,
          "Raleway-ExtraLightItalic", "Raleway", "ExtraLightItalic", false));
      _fontInformationBox.add(new FontInformation(
          158, "Raleway-Italic", "Raleway", "Italic", false));
      _fontInformationBox.add(
          new FontInformation(159, "Raleway-Light", "Raleway", "Light", false));
      _fontInformationBox.add(new FontInformation(
          160, "Raleway-LightItalic", "Raleway", "LightItalic", false));
      _fontInformationBox.add(new FontInformation(
          161, "Raleway-Medium", "Raleway", "Medium", false));
      _fontInformationBox.add(new FontInformation(
          162, "Raleway-MediumItalic", "Raleway", "MediumItalic", false));
      _fontInformationBox.add(
          new FontInformation(163, "Raleway-Regular", "Raleway", "", false));
      _fontInformationBox.add(new FontInformation(
          164, "Raleway-SemiBold", "Raleway", "SemiBold", false));
      _fontInformationBox.add(new FontInformation(
          165, "Raleway-SemiBoldItalic", "Raleway", "SemiBoldItalic", false));
      _fontInformationBox.add(
          new FontInformation(166, "Raleway-Thin", "Raleway", "Thin", false));
      _fontInformationBox.add(new FontInformation(
          167, "Raleway-ThinItalic", "Raleway", "ThinItalic", false));
      _fontInformationBox.add(
          new FontInformation(168, "Roboto-Black", "Roboto", "Black", false));
      _fontInformationBox.add(new FontInformation(
          169, "Roboto-BlackItalic", "Roboto", "BlackItalic", false));
      _fontInformationBox.add(
          new FontInformation(170, "Roboto-Bold", "Roboto", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          171, "Roboto-BoldItalic", "Roboto", "BoldItalic", false));
      _fontInformationBox.add(
          new FontInformation(172, "Roboto-Italic", "Roboto", "Italic", false));
      _fontInformationBox.add(
          new FontInformation(173, "Roboto-Light", "Roboto", "Light", false));
      _fontInformationBox.add(new FontInformation(
          174, "Roboto-LightItalic", "Roboto", "LightItalic", false));
      _fontInformationBox.add(
          new FontInformation(175, "Roboto-Medium", "Roboto", "Medium", false));
      _fontInformationBox.add(new FontInformation(
          176, "Roboto-MediumItalic", "Roboto", "MediumItalic", false));
      _fontInformationBox
          .add(new FontInformation(177, "Roboto-Regular", "Roboto", "", false));
      _fontInformationBox.add(
          new FontInformation(178, "Roboto-Thin", "Roboto", "Thin", false));
      _fontInformationBox.add(new FontInformation(
          179, "Roboto-ThinItalic", "Roboto", "ThinItalic", false));
      _fontInformationBox.add(new FontInformation(
          180, "RobotoCondensed-Bold", "RobotoCondensed", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          181,
          "RobotoCondensed-BoldItalic",
          "RobotoCondensed",
          "BoldItalic",
          false));
      _fontInformationBox.add(new FontInformation(
          182, "RobotoCondensed-Italic", "RobotoCondensed", "Italic", false));
      _fontInformationBox.add(new FontInformation(
          183, "RobotoCondensed-Light", "RobotoCondensed", "Light", false));
      _fontInformationBox.add(new FontInformation(
          184,
          "RobotoCondensed-LightItalic",
          "RobotoCondensed",
          "LightItalic",
          false));
      _fontInformationBox.add(new FontInformation(
          185, "RobotoCondensed-Regular", "RobotoCondensed", "", false));
      _fontInformationBox.add(new FontInformation(
          186, "RobotoMono-Bold", "RobotoMono", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          187, "RobotoMono-BoldItalic", "RobotoMono", "BoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          188, "RobotoMono-ExtraLight", "RobotoMono", "ExtraLight", false));
      _fontInformationBox.add(new FontInformation(
          189,
          "RobotoMono-ExtraLightItalic",
          "RobotoMono",
          "ExtraLightItalic",
          false));
      _fontInformationBox.add(new FontInformation(
          190, "RobotoMono-Italic", "RobotoMono", "Italic", false));
      _fontInformationBox.add(new FontInformation(
          191, "RobotoMono-Light", "RobotoMono", "Light", false));
      _fontInformationBox.add(new FontInformation(
          192, "RobotoMono-LightItalic", "RobotoMono", "LightItalic", false));
      _fontInformationBox.add(new FontInformation(
          193, "RobotoMono-Medium", "RobotoMono", "Medium", false));
      _fontInformationBox.add(new FontInformation(
          194, "RobotoMono-MediumItalic", "RobotoMono", "MediumItalic", false));
      _fontInformationBox.add(new FontInformation(
          195, "RobotoMono-Regular", "RobotoMono", "", false));
      _fontInformationBox.add(new FontInformation(
          196, "RobotoMono-SemiBold", "RobotoMono", "SemiBold", false));
      _fontInformationBox.add(new FontInformation(197,
          "RobotoMono-SemiBoldItalic", "RobotoMono", "SemiBoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          198, "RobotoMono-Thin", "RobotoMono", "Thin", false));
      _fontInformationBox.add(new FontInformation(
          199, "RobotoMono-ThinItalic", "RobotoMono", "ThinItalic", false));
      _fontInformationBox.add(new FontInformation(
          200, "RobotoSlab-Black", "RobotoSlab", "Black", false));
      _fontInformationBox.add(new FontInformation(
          201, "RobotoSlab-Bold", "RobotoSlab", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          202, "RobotoSlab-ExtraBold", "RobotoSlab", "ExtraBold", false));
      _fontInformationBox.add(new FontInformation(
          203, "RobotoSlab-ExtraLight", "RobotoSlab", "ExtraLight", false));
      _fontInformationBox.add(new FontInformation(
          204, "RobotoSlab-Light", "RobotoSlab", "Light", false));
      _fontInformationBox.add(new FontInformation(
          205, "RobotoSlab-Medium", "RobotoSlab", "Medium", false));
      _fontInformationBox.add(new FontInformation(
          206, "RobotoSlab-Regular", "RobotoSlab", "", false));
      _fontInformationBox.add(new FontInformation(
          207, "RobotoSlab-SemiBold", "RobotoSlab", "SemiBold", false));
      _fontInformationBox.add(new FontInformation(
          208, "RobotoSlab-Thin", "RobotoSlab", "Thin", false));
      _fontInformationBox.add(
          new FontInformation(209, "Rubik-Black", "Rubik", "Black", false));
      _fontInformationBox.add(new FontInformation(
          210, "Rubik-BlackItalic", "Rubik", "BlackItalic", false));
      _fontInformationBox
          .add(new FontInformation(211, "Rubik-Bold", "Rubik", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          212, "Rubik-BoldItalic", "Rubik", "BoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          213, "Rubik-ExtraBold", "Rubik", "ExtraBold", false));
      _fontInformationBox.add(new FontInformation(
          214, "Rubik-ExtraBoldItalic", "Rubik", "ExtraBoldItalic", false));
      _fontInformationBox.add(
          new FontInformation(215, "Rubik-Italic", "Rubik", "Italic", false));
      _fontInformationBox.add(
          new FontInformation(216, "Rubik-Light", "Rubik", "Light", false));
      _fontInformationBox.add(new FontInformation(
          217, "Rubik-LightItalic", "Rubik", "LightItalic", false));
      _fontInformationBox.add(
          new FontInformation(218, "Rubik-Medium", "Rubik", "Medium", false));
      _fontInformationBox.add(new FontInformation(
          219, "Rubik-MediumItalic", "Rubik", "MediumItalic", false));
      _fontInformationBox
          .add(new FontInformation(220, "Rubik-Regular", "Rubik", "", false));
      _fontInformationBox.add(new FontInformation(
          221, "Rubik-SemiBold", "Rubik", "SemiBold", false));
      _fontInformationBox.add(new FontInformation(
          222, "Rubik-SemiBoldItalic", "Rubik", "SemiBoldItalic", false));
      _fontInformationBox.add(
          new FontInformation(223, "RussoOne-Regular", "RussoOne", "", false));
      _fontInformationBox.add(new FontInformation(
          224, "SourceSansPro-Black", "SourceSansPro", "Black", false));
      _fontInformationBox.add(new FontInformation(225,
          "SourceSansPro-BlackItalic", "SourceSansPro", "BlackItalic", false));
      _fontInformationBox.add(new FontInformation(
          226, "SourceSansPro-Bold", "SourceSansPro", "Bold", false));
      _fontInformationBox.add(new FontInformation(227,
          "SourceSansPro-BoldItalic", "SourceSansPro", "BoldItalic", false));
      _fontInformationBox.add(new FontInformation(228,
          "SourceSansPro-ExtraLight", "SourceSansPro", "ExtraLight", false));
      _fontInformationBox.add(new FontInformation(
          229,
          "SourceSansPro-ExtraLightItalic",
          "SourceSansPro",
          "ExtraLightItalic",
          false));
      _fontInformationBox.add(new FontInformation(
          230, "SourceSansPro-Italic", "SourceSansPro", "Italic", false));
      _fontInformationBox.add(new FontInformation(
          231, "SourceSansPro-Light", "SourceSansPro", "Light", false));
      _fontInformationBox.add(new FontInformation(232,
          "SourceSansPro-LightItalic", "SourceSansPro", "LightItalic", false));
      _fontInformationBox.add(new FontInformation(
          233, "SourceSansPro-Regular", "SourceSansPro", "", false));
      _fontInformationBox.add(new FontInformation(
          234, "SourceSansPro-SemiBold", "SourceSansPro", "SemiBold", false));
      _fontInformationBox.add(new FontInformation(
          235,
          "SourceSansPro-SemiBoldItalic",
          "SourceSansPro",
          "SemiBoldItalic",
          false));
      _fontInformationBox.add(
          new FontInformation(236, "Ubuntu-Bold", "Ubuntu", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          237, "Ubuntu-BoldItalic", "Ubuntu", "BoldItalic", false));
      _fontInformationBox.add(
          new FontInformation(238, "Ubuntu-Italic", "Ubuntu", "Italic", false));
      _fontInformationBox.add(
          new FontInformation(239, "Ubuntu-Light", "Ubuntu", "Light", false));
      _fontInformationBox.add(new FontInformation(
          240, "Ubuntu-LightItalic", "Ubuntu", "LightItalic", false));
      _fontInformationBox.add(
          new FontInformation(241, "Ubuntu-Medium", "Ubuntu", "Medium", false));
      _fontInformationBox.add(new FontInformation(
          242, "Ubuntu-MediumItalic", "Ubuntu", "MediumItalic", false));
      _fontInformationBox
          .add(new FontInformation(243, "Ubuntu-Regular", "Ubuntu", "", false));
      _fontInformationBox.add(new FontInformation(
          244, "WorkSans-Black", "WorkSans", "Black", false));
      _fontInformationBox.add(new FontInformation(
          245, "WorkSans-BlackItalic", "WorkSans", "BlackItalic", false));
      _fontInformationBox.add(
          new FontInformation(246, "WorkSans-Bold", "WorkSans", "Bold", false));
      _fontInformationBox.add(new FontInformation(
          247, "WorkSans-BoldItalic", "WorkSans", "BoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          248, "WorkSans-ExtraBold", "WorkSans", "ExtraBold", false));
      _fontInformationBox.add(new FontInformation(249,
          "WorkSans-ExtraBoldItalic", "WorkSans", "ExtraBoldItalic", false));
      _fontInformationBox.add(new FontInformation(
          250, "WorkSans-ExtraLight", "WorkSans", "ExtraLight", false));
      _fontInformationBox.add(new FontInformation(251,
          "WorkSans-ExtraLightItalic", "WorkSans", "ExtraLightItalic", false));
      _fontInformationBox.add(new FontInformation(
          252, "WorkSans-Italic", "WorkSans", "Italic", false));
      _fontInformationBox.add(new FontInformation(
          253, "WorkSans-Light", "WorkSans", "Light", false));
      _fontInformationBox.add(new FontInformation(
          254, "WorkSans-LightItalic", "WorkSans", "LightItalic", false));
      _fontInformationBox.add(new FontInformation(
          255, "WorkSans-Medium", "WorkSans", "Medium", false));
      _fontInformationBox.add(new FontInformation(
          256, "WorkSans-MediumItalic", "WorkSans", "MediumItalic", false));
      _fontInformationBox.add(
          new FontInformation(257, "WorkSans-Regular", "WorkSans", "", false));
      _fontInformationBox.add(new FontInformation(
          258, "WorkSans-SemiBold", "WorkSans", "SemiBold", false));
      _fontInformationBox.add(new FontInformation(
          259, "WorkSans-SemiBoldItalic", "WorkSans", "SemiBoldItalic", false));
      _fontInformationBox.add(
          new FontInformation(260, "WorkSans-Thin", "WorkSans", "Thin", false));
      _fontInformationBox.add(new FontInformation(
          261, "WorkSans-ThinItalic", "WorkSans", "ThinItalic", false));

      print("FontList初期化処理 - 完了");
    }

    print("box設置完了" + _fontInformationBox.length.toString());
    print(this._fontInformationBox.getAt(0).fontName);
  }

  Future<void> store(String path, String filename) async {
    final url = DotEnv().env['FIND_FONT_SERVER_URL'];

    Dio dio = new Dio();

    FormData formData = new FormData.fromMap(
        {"photo": await MultipartFile.fromFile(path, filename: filename)});

    // 取得処理
    // try {
    //   print("送信開始?");
    //   final response = await dio.post(url, data: formData);
    //
    //   print("送信完了");
    //
    //   // 送信成功
    //   print(response.data['prediction']);
    //
    //   var prediction = response.data['prediction'];
    //
    //   // データの保存処理
    //   ScanResultFactory scanResultFactory = new ScanResultFactory();
    //   ScanResult scanResult = scanResultFactory.create();
    //
    //   scanResult.fontInformationList = HiveList(_fontInformationBox);
    //
    //   for (int a in prediction) {
    //     // 配列への問合せ
    //     print(_fontInformationBox.getAt(0));
    //     scanResult.fontInformationList.add(_fontInformationBox.getAt(a));
    //   }
    //
    //   print(scanResult.fontInformationList);
    //
    //   print("保存");
    //   _scan_result_box.add(scanResult);
    //
    // } on DioError catch (e) {
    //   throw e;
    //   print(e.message);
    //   print(e);
    //   print('送信できませんでした');
    // }

    Map<String, dynamic> test =
        json.decode('{"model":"VGG16","prediction":[45,68,72,95,174]}');

    var prediction = test['prediction'];

    // _scan_result_box.clear();

    // データの保存
    ScanResultFactory scanResultFactory = new ScanResultFactory();
    ScanResult scanResult = scanResultFactory.create();

    scanResult.fontInformationList = HiveList(_fontInformationBox);

    print("Info登録処理");
    for (int a in prediction) {
      // 配列への問合せ
      print(this._fontInformationBox.getAt(0));
      scanResult.fontInformationList.add(_fontInformationBox.getAt(a));
    }

    print(scanResult.fontInformationList);

    print("保存");
    _scan_result_box.add(scanResult);
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
    return this._scan_result_box.getAt(id);
  }

  edit(FontInformation fontInformation) {
    // FontInformation fontInformation = _fontInformationBox.get(fontInformation.id);
    _fontInformationBox.put(fontInformation.id, fontInformation);

    return true;
  }

  List getFavoriteFontList() {
    List _fontList = [];

    // Boxから取得
    for (var i = 0; i < _fontInformationBox.length; i++) {
      FontInformation fontInformation = _fontInformationBox.getAt(i);

      // お気に入り登録しているもののみ追加
      if (fontInformation.favorite) {
        _fontList.add(fontInformation);
      }
    }

    print("FontList Length");
    print(_fontList.length);

    return _fontList;
  }

  getFontInformationById(int id) {
    return _fontInformationBox.getAt(id);
  }
}
