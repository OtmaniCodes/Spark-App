import 'package:anas_cars/src/models/ongoing_offer.dart';
import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/utils/url_lancher.dart';
import 'package:anas_cars/src/view/global_widgets/custom_button.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:anas_cars/src/view/screens/offers/local_widgets/upper_section.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OngoingQuotesScreen extends StatelessWidget {
  final OngoingOfferModel data;
  OngoingQuotesScreen({Key? key, required this.data}) : super(key: key);
  final pictures = [
    KEngine1Img,
    KEngine2Img,
    KEngine3Img,
    KEngine4Img,
    KEngine1Img
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: MyText(
              txt: 'Ongoing quotes',
              fSize: 20,
              charSpacing: -0.48,
              boldness: FontWeight.w500,
            ),
            elevation: 3.0,
            backgroundColor: Palette.kDarkPurpleClr,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Palette.kWhiteClr,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            leading: Container(
                              child: MyText(
                                txt: '?',
                                fSize: 24,
                                boldness: FontWeight.w500,
                                alignment: TextAlign.center,
                              ),
                              height: 43,
                              width: 43,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Palette.kPurpleClr,
                                    Palette.kblueClr
                                  ],
                                  stops: [0.0, 1.0],
                                ),
                              ),
                            ),
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: MyText(
                                    txt: "car dealer one ",
                                    fSize: 16,
                                    txtClr: Palette.kBlackClr,
                                    boldness: FontWeight.w500,
                                    txtHeight: 1.5,
                                  ),
                                ),
                                Image.asset(
                                  KAboutIco,
                                  color: Color(0xFFAEB0B1),
                                ),
                              ],
                            ),
                            subtitle: MyText(
                              txt: '05:30 pm . 03/04/2021',
                              fSize: 16,
                              txtClr: const Color(0x59000000),
                              txtHeight: 1.5,
                            ),
                          ),
                          MEDIUM_VSPACING,
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: KScaffoldClr,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 6,
                                    offset: Offset(1, 2),
                                    color: Palette.kBlackClr.withOpacity(0.09))
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(KAboutIco),
                                SizedBox(width: 5.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      txt:
                                          'You can view this offer provider and all other \noffers within this quote only after payment ',
                                      fSize: 14,
                                      txtClr: Palette.kBlackClr,
                                      alignment: TextAlign.left,
                                    ),
                                    MyText(
                                      txt: 'Pay to view full info >',
                                      fSize: 14,
                                      txtClr: const Color(0xFFFF4F29),
                                      boldness: FontWeight.w500,
                                      txtHeight: 1.71,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          MEDIUM_VSPACING,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  txt: 'Part info ',
                                  fSize: 16,
                                  txtClr: Palette.kBlackClr,
                                  boldness: FontWeight.w500,
                                  txtHeight: 1.5,
                                ),
                                TINY_VSPACING,
                                MyText(
                                  txt: data.description!,
                                  fSize: 16,
                                  txtClr: const Color(0x59000000),
                                  txtHeight: 1.5,
                                ),
                                MEDIUM_VSPACING,
                                Text.rich(
                                  TextSpan(
                                    style: defaulTS.copyWith(
                                      fontSize: 16,
                                      color: const Color(0xff050505),
                                      height: 1.5,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Condition : ',
                                      ),
                                      TextSpan(
                                        text: data.isUsed! ? "used" : 'new',
                                        style: defaulTS.copyWith(
                                          color: data.isUsed!
                                              ? Color(0xffff8f52)
                                              : Color(0xff16792a),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          MEDIUM_VSPACING,
                          SizedBox(
                            height: 90,
                            child: ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              scrollDirection: Axis.horizontal,
                              itemCount: pictures.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: Image.asset(
                                    pictures[index],
                                    height: 90,
                                  ),
                                );
                              },
                            ),
                          ),
                          MEDIUM_VSPACING,
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: MyText(
                                txt: 'View all part pictures ( 21 ) >  ',
                                fSize: 16,
                                txtClr: const Color(0xff0b5da5),
                                charSpacing: -0.384,
                              ),
                            ),
                          ),
                          MEDIUM_VSPACING,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: MyCustomButton(
                              kiddo: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyText(
                                      txt: 'Quote amount :',
                                      fSize: 16,
                                      txtClr: const Color(0xd1ffffff),
                                      boldness: FontWeight.w500,
                                      txtHeight: 1.5,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        style: defaulTS.copyWith(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: data.price!.toString(),
                                          ),
                                          TextSpan(
                                            text: "  OMR",
                                            style: defaulTS.copyWith(
                                              fontSize: 13,
                                              color: const Color(0x8affffff),
                                              height: 1.84,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onPressed: () {
                                print("clicked");
                              },
                              buttonShadow: [
                                BoxShadow(
                                  color: const Color(0x8c0482ff),
                                  offset: Offset(0, 3),
                                  blurRadius: 6,
                                ),
                              ],
                              gradientColors: [
                                Palette.kLightBlueClr,
                                const Color(0xff6755ff),
                                Palette.kPurpleClr,
                              ],
                              gradientStops: [0.0, 0.334, 1.0],
                              gradientStart: Alignment(-0.75, 0.0),
                              gradientEnd: Alignment(2.78, 1.0),
                            ),
                          ),
                          SMALL_VSPACING
                        ],
                      ),
                    ),
                    MEDIUM_VSPACING,
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Palette.kWhiteClr,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            txt: 'Contact info',
                            fSize: 16,
                            txtClr: Palette.kBlackClr,
                            boldness: FontWeight.w500,
                            txtHeight: 1.5,
                          ),
                          MEDIUM_VSPACING,
                          ListTile(
                            onTap: () async {
                              final tellNum = 'tel:'+'+968 96777444';
                              if(await canLaunch(tellNum)){
                                try{
                                  await launchUrl(tellNum);
                                }catch(e){
                                  print(e);
                                }
                              }else{
                                print('can\'t launch');
                              }
                            },
                            leading: Image.asset(KPhoneIco),
                            title: MyText(
                              txt: '+968 96777444',
                              fSize: 16,
                              txtClr: Palette.kBlackClr,
                              boldness: FontWeight.w500,
                              txtHeight: 1.5,
                            ),
                            trailing: const Icon(
                              Icons.keyboard_arrow_right_outlined,
                              size: 30,
                              color: const Color(0xFF848A94),
                            ),
                          ),
                          ListTile(
                            onTap: () async {
                              final url = 'mailto:'+'Car.Garage@gmail.com';
                              if (await canLaunch(url)) {
                                try{
                                await launch(url);
                                }catch(e){
                                  print(e);
                                }
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            leading: Image.asset(KMailIco),
                            title: MyText(
                              txt: 'Car.Garage@gmail.com',
                              fSize: 16,
                              txtClr: Palette.kBlackClr,
                              boldness: FontWeight.w500,
                              txtHeight: 1.5,
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right_outlined,
                              size: 30,
                              color: const Color(0xFF848A94),
                            ),
                          )
                        ],
                      ),
                    ),
                    MEDIUM_VSPACING,
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Palette.kWhiteClr,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            txt: 'Work days / time',
                            fSize: 16,
                            txtClr: Palette.kBlackClr,
                            boldness: FontWeight.w500,
                            txtHeight: 1.5,
                          ),
                          MEDIUM_VSPACING,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 30),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    MyText(
                                      txt: 'Sunday - Thursday',
                                      fSize: 14,
                                      txtClr: const Color(0xff848a94),
                                      charSpacing: -0.224,
                                    ),
                                    TINY_VSPACING,
                                    MyText(
                                      txt: '8:00 AM - 9:00 PM',
                                      fSize: 14,
                                      txtClr: Palette.kBlackClr,
                                      charSpacing: -0.224,
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: const Color(0xfff3f3f4),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 30),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    MyText(
                                      txt: 'Friday - Saturday',
                                      fSize: 14,
                                      txtClr: const Color(0xff848a94),
                                      charSpacing: -0.224,
                                    ),
                                    TINY_VSPACING,
                                    MyText(
                                      txt: '4:00 PM - 8:00 PM',
                                      fSize: 14,
                                      txtClr: Palette.kBlackClr,
                                      charSpacing: -0.224,
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: const Color(0xfff3f3f4),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    MEDIUM_VSPACING,
                    Container(
                      padding: const EdgeInsets.only(
                          top: 20.0, right: 20.0, left: 20.0, bottom: 40.0),
                      decoration: BoxDecoration(color: Palette.kWhiteClr),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyText(
                            txt: 'Location',
                            fSize: 16,
                            txtClr: Palette.kBlackClr,
                            boldness: FontWeight.w500,
                            txtHeight: 1.5,
                          ),
                          MEDIUM_VSPACING,
                          Container(
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 170,
                                  child: Image.asset(KMarkerIco),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(KMapImg),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -(52 / 2),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Row(
                                      children: [
                                        Image.asset(KMarker2Ico),
                                        const SizedBox(width: 10.0),
                                        MyText(
                                          txt:
                                              'Wadi al kabeer , saltant of Oman',
                                          fSize: 15,
                                          txtClr: const Color(0xff2b2c2e),
                                          charSpacing: 0.15,
                                          txtHeight: 1.4,
                                        ),
                                      ],
                                    ),
                                    width: 351,
                                    height: 52,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 40.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: Palette.kWhiteClr,
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0x2401274c),
                                          offset: Offset(0, 8),
                                          blurRadius: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                            ),
                          ),
                          MEDIUM_VSPACING
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
