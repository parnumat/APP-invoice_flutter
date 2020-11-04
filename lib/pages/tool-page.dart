import 'package:flutter/material.dart';
import 'package:invoice/pages/widget/custom-card-tool.dart';

class ToolsPage extends StatelessWidget {
  ToolsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8ECEF),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Align(
                    alignment: Alignment(-0.7, 0.8),
                    child: Text(
                      "Invoice Tools",
                      style:
                          TextStyle(fontSize: 54, fontWeight: FontWeight.w700),
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
                              assetImage: "assets/images/WG6.png",
                              message: "ลาดกระบัง",
                              code: "SI002",
                            ),
                            ToolCard(
                              assetImage: "assets/images/WG6.png",
                              message: "เป่าฟิล์ม (B1)",
                              code: "SI010",
                            ),
                            ToolCard(
                              assetImage: "assets/images/WG6.png",
                              message: "เป่าฟิล์ม (B2)",
                              code: "SI015",
                            ),
                            ToolCard(
                              assetImage: "assets/images/WG6.png",
                              message: "เวลโกรว์ ต่างประเทศ",
                              code: "EXPF",
                            ),
                            ToolCard(
                              assetImage: "assets/images/WG6.png",
                              message: "ลาดกระบัง ต่างประเทศ",
                              code: "EXPF",
                            ),
                            ToolCard(
                              assetImage: "assets/images/WG6.png",
                              message: "เบิก แอล.เอ.พี",
                              code: "SI005",
                            ),
                            ToolCard(
                              assetImage: "assets/images/WG6.png",
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
    );
  }
}
