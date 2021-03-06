import 'package:flutter/material.dart';
import 'package:groshop/Components/custom_button.dart';

import 'my_orders.dart';

class ConfirmOrderPage extends StatefulWidget {
  final VoidCallback onOrderCompleted;

  ConfirmOrderPage(this.onOrderCompleted);

  @override
  _ConfirmOrderPageState createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/header.png',
                height: 200,
                fit: BoxFit.fitHeight,
              ),
              IconButton(
                  padding: EdgeInsets.only(top: 70),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    widget.onOrderCompleted();
                  }),
              Positioned.directional(
                  textDirection: Directionality.of(context),
                  top: 70,
                  start: MediaQuery.of(context).size.width / 3.5,
                  child: Text(
                    "Xác Nhận Đơn Hàng",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Theme.of(context).scaffoldBackgroundColor),
                  )),
              Positioned.directional(
                top: 130,
                width: MediaQuery.of(context).size.width,
                textDirection: Directionality.of(context),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    Text(
                      '......',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    Icon(
                      Icons.credit_card,
                      color: Colors.white,
                    ),
                    Text(
                      '......',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    Image.asset(
                      'assets/ic_check.png',
                      height: 22,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
          Spacer(
            flex: 4,
          ),
          Image.asset(
            'assets/ordercomplete.png',
            scale: 3,
          ),
          Spacer(
            flex: 2,
          ),
          Text(
            "Đơn hàng của bạn đã được đặt thành công",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
              "Bạn có thể kiểm tra quy trình đặt hàng của bạn trong phần Đơn hàng.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color(0xff646464),
                  letterSpacing: 0.2,
                  fontSize: 16)),
          Spacer(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyOrders()));
              },
              child: Text(
                "ĐƠN HÀNG CỦA TÔI",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )),
          Spacer(
            flex: 4,
          ),
          CustomButton(
            label: "Tiếp tục mua sắm",
            onTap: widget.onOrderCompleted,
            /*() {
              Navigator.popAndPushNamed(context, PageRoutes.homePage);
            },*/
          ),
        ],
      ),
    );
  }
}
