import 'package:flutter/material.dart';
import 'package:tennis_app/theme/app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:faker/faker.dart';
import 'package:tennis_app/widgets/buttons.dart';
import 'package:tennis_app/widgets/headers.dart';
import 'package:qr_flutter/qr_flutter.dart';  // for QR generation
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  Future<PermissionStatus> _getCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
        final result = await Permission.camera.request();
        return result;
    } else {
      return status;
    }
  }

  void _scanQR() async {
    PermissionStatus status = await _getCameraPermission();

    if (status.isGranted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('QR Code Scanner'),
                toolbarHeight: 60,
                centerTitle: true,
                backgroundColor: AppTheme.colors.grassGreen,
              ),
              body: Column(
                children: <Widget>[
                  Expanded(
                    // child: Text('Permission Granted'),
                    child: QRView(
                      key: qrKey,
                      overlay: QrScannerOverlayShape(
                        borderWidth: 10,
                        borderRadius: 10,
                        borderColor: AppTheme.colors.tennisBall,
                        cutOutSize: MediaQuery.of(context).size.width * 0.8,
                      ),
                      onQRViewCreated: (QRViewController controller) {
                        this.controller = controller;
                        controller.scannedDataStream.listen((scanData) {
                          setState(() {
                            result = scanData;
                          });
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }
    
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {

                },
                child: const Icon(Icons.edit),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 3,
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    child: Image.asset(
                      "assets/avatar.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ), 
              ),
              Expanded(
                flex: 4,
                child: Container(
                  height: 150,
                  margin: const EdgeInsets.only(left: 10),
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: const Color(0xFFFF0000)),
                  // ),
                  child: ProfileInfoContainer(
                    firstName: faker.person.firstName(),
                    lastName: faker.person.lastName(),
                    phone: faker.phoneNumber.us(),
                    email: faker.internet.email(),
                  )
                ),
              ),
            ],
          ),
          // SOCIAL ICONS
          const SizedBox(height: 15,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              const SizedBox(width: 5),
              Icon(
                FontAwesomeIcons.whatsapp, 
                color: AppTheme.colors.totallyBlack, 
                size: 30.0),
              const SizedBox(width: 25),
              Icon(
                FontAwesomeIcons.instagram, 
                color: AppTheme.colors.totallyBlack, 
                size: 30.0),
              const SizedBox(width: 25),
              Icon(
                FontAwesomeIcons.facebookF, 
                color: AppTheme.colors.totallyBlack, 
                size: 25.0),
            ],
          ),
          const SizedBox(height: 15,),
          Column(
            children: [
              const SectionHeader(
                header: "Level"
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  const SizedBox(width: 10,),
                  Icon(
                    Icons.star,
                    color: AppTheme.colors.totallyBlack,
                    size: 26,
                  ),
                  const SizedBox(width: 15,),
                  Icon(
                    Icons.star,
                    color: AppTheme.colors.totallyBlack,
                    size: 26,
                  ),
                  const SizedBox(width: 15,),
                  Icon(
                    Icons.star,
                    color: AppTheme.colors.totallyBlack,
                    size: 26,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      child: Image.asset(
                        "assets/QR_code.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SimpleButton(
                    fillcolor: AppTheme.colors.grassGreen, 
                    textcolor: AppTheme.colors.totallyBlack, 
                    text: "SCAN ME", 
                    width: 200, 
                    height: 40,
                    onClick: _scanQR,
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}

class ProfileInfoContainer extends StatelessWidget {

  final String firstName;
  final String lastName;
  final String? phone;
  final String? email;

  const ProfileInfoContainer({
    Key? key,
    required this.firstName,
    required this.lastName,
    this.phone,
    this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Name : ",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: AppTheme.colors.amazonGreen,
          ),
        ),
        Text(
          firstName + " " + lastName,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10,),
        Text(
          "Phone : ",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: AppTheme.colors.amazonGreen,
          ),
        ),
        Text(
          (phone ?? " "),
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10,),
        Text(
          "Email : ",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: AppTheme.colors.amazonGreen,
          ),
        ),
        Text(
          (email ?? " "),
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}