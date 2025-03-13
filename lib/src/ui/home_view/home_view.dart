import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placar_volei/src/ui/home_view/controller/home_view_controller.dart';
import 'package:placar_volei/src/ui/home_view/widgets/button_act_widget.dart';
import 'package:placar_volei/src/ui/home_view/widgets/placar_widget.dart';
import 'package:placar_volei/src/util/color/app_colors.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewController controllerScore;

  @override
  void initState() {
    super.initState();
    controllerScore = Provider.of<HomeViewController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF202020),
        centerTitle: true,
        title: Text(
          'VÔLEI DA ORLA',
          style: GoogleFonts.quicksand(
            color: AppColors().colorText,
            fontSize: 32,
          ),
        ),
      ),
      backgroundColor: AppColors().colorBg,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF202020),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 50, horizontal: 30),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(22),
                              decoration: BoxDecoration(
                                color: AppColors().timeDaCasa,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 6,
                                      spreadRadius: 4,
                                      color:
                                          AppColors().timeDaCasa.withAlpha(200))
                                ],
                              ),
                              child: Icon(
                                Icons.sports_volleyball,
                                color: AppColors().colorText,
                                size: 52,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'TIME DA CASA',
                              style: GoogleFonts.quicksand(
                                  color: AppColors().timeDaCasa,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            Consumer<HomeViewController>(
                              builder: (context, controllerScore, child) {
                                return PlacarWidget(
                                  text: '${controllerScore.scoreCasa}',
                                  alignment: Alignment.topCenter,
                                  color: AppColors().timeDaCasa2,
                                );
                              },
                            ),
                            SizedBox(
                              height: 1.5,
                            ),
                            Consumer<HomeViewController>(
                              builder: (context, controllerScore, child) {
                                return PlacarWidget(
                                  text: '${controllerScore.scoreCasa}',
                                  alignment: Alignment.bottomCenter,
                                  color: AppColors().timeDaCasa2,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(22),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColors().timeDeFora,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 6,
                                      spreadRadius: 4,
                                      color:
                                          AppColors().timeDeFora.withAlpha(200))
                                ],
                              ),
                              child: Icon(
                                Icons.sports_volleyball,
                                color: AppColors().colorText,
                                size: 52,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'TIME DE FORA',
                              style: GoogleFonts.quicksand(
                                  color: AppColors().timeDeFora,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            Consumer<HomeViewController>(
                              builder: (context, controllerScore, child) {
                                return PlacarWidget(
                                  text: '${controllerScore.scoreFora}',
                                  alignment: Alignment.topCenter,
                                  color: AppColors().timeDeFora2,
                                );
                              },
                            ),
                            SizedBox(
                              height: 1.5,
                            ),
                            Consumer<HomeViewController>(
                              builder: (context, controllerScore, child) {
                                return PlacarWidget(
                                  text: '${controllerScore.scoreFora}',
                                  alignment: Alignment.bottomCenter,
                                  color: AppColors().timeDeFora2,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'TIME A',
                        style: GoogleFonts.quicksand(
                            color: AppColors().colorText,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          ButtonActWidget(
                            onTap: controllerScore.decrementScoreCasa,
                            icon: Icons.remove,
                            bgColor: AppColors().timeDeFora2,
                            iconColor: AppColors().colorText,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          ButtonActWidget(
                            onTap: controllerScore.incrementScoreCasa,
                            icon: Icons.add,
                            bgColor: AppColors().colorGreen,
                            iconColor: AppColors().colorText,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'TIME B',
                        style: GoogleFonts.quicksand(
                            color: AppColors().colorText,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          ButtonActWidget(
                            onTap: controllerScore.decrementScoreFora,
                            icon: Icons.remove,
                            bgColor: AppColors().timeDeFora2,
                            iconColor: AppColors().colorText,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          ButtonActWidget(
                            onTap: controllerScore.incrementScoreFora,
                            icon: Icons.add,
                            bgColor: AppColors().colorGreen,
                            iconColor: AppColors().colorText,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
