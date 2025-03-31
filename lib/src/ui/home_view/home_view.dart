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
      floatingActionButton: FloatingActionButton(
        onPressed: controllerScore.resetScore,
        backgroundColor: Color(0xFF202020),
        elevation: 0,
        child: Icon(
          Icons.cleaning_services_outlined,
          color: AppColors().colorText,
        ),
      ),
      backgroundColor: AppColors().colorBg,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
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
                          height: 2.5,
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
                  Expanded(
                    child: Column(
                      children: [
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
                          height: 2.5,
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
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: -15,
            right: -15,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      ButtonActWidget(
                        onTap: controllerScore.decrementScoreCasa,
                        icon: Icons.remove,
                        bgColor: AppColors().timeDeFora2,
                        iconColor: AppColors().colorText,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ButtonActWidget(
                        onTap: controllerScore.incrementScoreCasa,
                        icon: Icons.add,
                        bgColor: AppColors().colorGreen,
                        iconColor: AppColors().colorText,
                      ),
                    ],
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
                        width: 20,
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
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 36, 36, 36),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    'Vôlei da Orla',
                    style: GoogleFonts.arimo(
                      color: AppColors().colorText,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Icon(
              Icons.close_rounded,
              size: 82,
              color: AppColors().colorText,
            ),
          ),
        ],
      ),
    );
  }
}
