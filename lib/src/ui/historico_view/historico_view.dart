import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placar_volei/src/ui/home_view/controller/home_view_controller.dart';
import 'package:placar_volei/src/util/color/app_colors.dart';
import 'package:provider/provider.dart';

class HistoricoView extends StatefulWidget {
  const HistoricoView({super.key});

  @override
  State<HistoricoView> createState() => _HistoricoViewState();
}

class _HistoricoViewState extends State<HistoricoView> {
  late final HomeViewController controllerhistorico;

  @override
  void initState() {
    controllerhistorico =
        Provider.of<HomeViewController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF202020),
        foregroundColor: AppColors().colorText,
        title: Text(
          'PLACARES',
          style: GoogleFonts.quicksand(
              color: AppColors().colorText, fontSize: 32, letterSpacing: 4),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors().colorBg,
      body: Column(
        children: [
          Consumer<HomeViewController>(
            builder: (context, value, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: controllerhistorico.historico.length,
                  itemBuilder: (context, index) {
                    int reverseIndex =
                        controllerhistorico.historico.length - 1 - index;
                    return Column(
                      children: [
                        ListTile(
                          trailing: IconButton(
                            onPressed: () {
                              controllerhistorico.clearHistorico(index);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: AppColors().timeDeFora2,
                            ),
                          ),
                          title: Text(
                            controllerhistorico.historico[reverseIndex],
                            style: GoogleFonts.quicksand(
                              color: AppColors().colorText,
                              fontSize: 32,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        )
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
