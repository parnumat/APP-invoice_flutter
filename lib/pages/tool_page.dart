import 'package:flutter/material.dart';
import 'package:invoice/animations/fade_animation.dart';
import 'package:invoice/pages/widget/custom_card_tool.dart';

class ToolsPage extends StatelessWidget {
  ToolsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8ECEF),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: FadeXAnimation(
                    delay: 0.3,
                    child: Container(
                      child: Align(
                        alignment: Alignment(-0.65, 1.0),
                        child: Text(
                          "Invoice Tools",
                          style: TextStyle(
                              fontSize: 44, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    // color: Colors.amber,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(100, 20, 100, 50),
                        child: Container(
                          // color: Colors.cyan,
                          child: GridView.count(
                            primary: false,
                            // padding: EdgeInsets.all(20),
                            mainAxisSpacing: 32,
                            crossAxisCount: 4,
                            children: [
                              ToolCard(
                                assetImage: "assets/images/WG6.png",
                                message: "เวลโกรว์ ซอย6",
                                code: "SI005",
                              ),
                              ToolCard(
                                assetImage: "assets/images/LKB.png",
                                message: "ลาดกระบัง",
                                code: "SI002",
                              ),
                              ToolCard(
                                assetImage: "assets/images/B1.png",
                                message: "เป่าฟิล์ม (B1)",
                                code: "SI010",
                              ),
                              ToolCard(
                                assetImage: "assets/images/B2.png",
                                message: "เป่าฟิล์ม (B2)",
                                code: "SI015",
                              ),
                              ToolCard(
                                assetImage: "assets/images/WG6OUT.png",
                                message: "เวลโกรว์ ต่างประเทศ",
                                code: "EXPF",
                              ),
                              ToolCard(
                                assetImage: "assets/images/LKBOUT.png",
                                message: "ลาดกระบัง ต่างประเทศ",
                                code: "EXPF",
                              ),
                              ToolCard(
                                assetImage: "assets/images/LAP.png",
                                message: "เบิก แอล.เอ.พี",
                                code: "SI005",
                              ),
                              ToolCard(
                                assetImage: "assets/images/KPP.png",
                                message: "เบิก เค.พี.พี",
                                code: "SI005",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
