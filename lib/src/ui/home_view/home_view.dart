import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placar_volei/src/util/color/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _counterCasa = 0;
  final int _counterFora = 0;

  void _incrementScore() {
    setState(() {
      _counterCasa++;
    });
  }

  void _decrementScore() {
    setState(() {
      if (_counterCasa > 0) _counterCasa--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: _decrementScore),
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
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF202020),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
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
                                  color: AppColors().timeDaCasa.withAlpha(200))
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
                          'Time da Casa',
                          style: GoogleFonts.quicksand(
                              color: AppColors().colorText,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder: (child, animation) {
                            final rotate =
                                Tween(begin: 1.0, end: 0.0).animate(animation);
                            return AnimatedBuilder(
                              animation: rotate,
                              builder: (context, child) {
                                final isReverse = rotate.value < 0.5;
                                return Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationX(isReverse
                                      ? 3.14 * rotate.value
                                      : -3.14 * rotate.value),
                                  child: child,
                                );
                              },
                              child: child,
                            );
                          },
                          child: Text(
                            '$_counterCasa',
                            key: ValueKey<int>(_counterCasa),
                            style: const TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
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
                                  color: AppColors().timeDeFora.withAlpha(200))
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
                          'Time de Fora',
                          style: GoogleFonts.quicksand(
                              color: AppColors().colorText,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
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
    );
  }
}
