import 'package:flutter/material.dart';
import 'package:groshop/Pages/Other/add_review.dart';
import 'package:groshop/models/product.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    List<Product> myOrders = [
      Product(
          image: 'assets/ProductImages/comfor.png',
          seller: "Khánh đẹp chai",
          price: "100",
          name: "Nước xả Comfor",
          type: ""),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            decoration: new BoxDecoration(
              color: Colors.green,
              boxShadow: [new BoxShadow(blurRadius: 15.0)],
              borderRadius: new BorderRadius.vertical(
                  bottom: new Radius.elliptical(
                      MediaQuery.of(context).size.width, 60.0)),
            ),
            child: AppBar(
              backgroundColor: Colors.green,
              title: Text("Đơn Hàng của Tôi"),
              centerTitle: true,
            ),
          )),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Card(
            elevation: 3,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            color: Colors.white,
            child: Column(
              children: [
                buildItem(context, 'assets/seller1.png', "Cửa hàng số 1",
                    '2 Đơn hàng'),
                buildOrderInfoRow(
                    context, '2.900.000', "Khi giao hàng", "Đang vận chuyển",
                    borderRadius: 0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildStatusIcon(Icons.done_all),
                          Text('------'),
                          buildStatusIcon(Icons.assignment_returned),
                          Text('------'),
                          buildStatusIcon(Icons.directions_bike),
                          Text('------'),
                          buildStatusIcon(Icons.navigation),
                          Text('------'),
                          buildStatusIcon(Icons.home, disabled: true),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey[100],
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sản phẩm:",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      buildAmountRow("Xà bông", '100.000'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Q1', style: Theme.of(context).textTheme.subtitle2),
                      Text(
                        "Sản phẩm:",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      buildAmountRow("Máy giặt", '3.000.000 VNĐ'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Q1', style: Theme.of(context).textTheme.subtitle2),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8, bottom: 10, top: 5),
                  child: Column(
                    children: [
                      buildAmountRow("Phí vận chuyển", '100.000 VNĐ'),
                      buildAmountRow("Mã giảm giá", '- 200.000 VNĐ'),
                      buildAmountRow("Tổng thanh toán", '2.900.000 VNĐ',
                          fontWeight: FontWeight.w700),
                    ],
                  ),
                )
              ],
            ),
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: myOrders.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return buildCompleteCard(context, myOrders[index].image,
                    myOrders[index].name, '02 mặt hàng');
              }),
        ],
      ),
    );
  }

  CircleAvatar buildStatusIcon(IconData icon, {bool disabled = false}) =>
      CircleAvatar(
          backgroundColor: !disabled ? Color(0xff222e3e) : Colors.grey[300],
          child: Icon(
            icon,
            size: 20,
            color: !disabled
                ? Theme.of(context).primaryColor
                : Theme.of(context).scaffoldBackgroundColor,
          ));

  GestureDetector buildCompleteCard(
      BuildContext context, String img, String item, String category) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddReviewPage()));
      },
      child: Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        color: Colors.white,
        elevation: 1,
        child: Column(
          children: [
            buildItem(context, img, item, category),
            buildOrderInfoRow(
                context, '300.000', "Thanh toán tiền mặt", "Đã giao"),
          ],
        ),
      ),
    );
  }

  Container buildOrderInfoRow(BuildContext context, String price,
      String paymentMode, String orderStatus,
      {double borderRadius = 8}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(borderRadius)),
        color: Colors.grey[100],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 12),
      child: Row(
        children: [
          buildGreyColumn(context, "Số tiền thanh toán", price),
          Spacer(),
          buildGreyColumn(context, "Phương thức thanh toán", paymentMode),
          Spacer(),
          buildGreyColumn(context, "Trạng thái đặt hàng", orderStatus,
              text2Color: Theme.of(context).primaryColor),
        ],
      ),
    );
  }

  Padding buildItem(
      BuildContext context, String img, String name, String category) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    img,
                    height: 70,
                    width: 70,
                    fit: BoxFit.fill,
                  )),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(height: 6),
                  Text(
                    category,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(height: 16),
                  Text('11:40 - 21/4/2022',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(fontSize: 10.5)),
                ],
              ),
            ],
          ),
          Positioned.directional(
            textDirection: Directionality.of(context),
            end: 0,
            bottom: 0,
            child: Text(
              "ID" + ' 2254126',
              textAlign: TextAlign.right,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(fontSize: 10.5),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildAmountRow(String name, String price,
      {FontWeight fontWeight = FontWeight.w500}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: fontWeight),
          ),
          Spacer(),
          Text(
            price,
            style: TextStyle(fontWeight: fontWeight),
          ),
        ],
      ),
    );
  }

  Column buildGreyColumn(BuildContext context, String text1, String text2,
      {Color text2Color = Colors.black}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text1,
            style:
                Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 11)),
        SizedBox(height: 8),
        LimitedBox(
          maxWidth: 100,
          child: Text(text2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: text2Color)),
        ),
      ],
    );
  }
}
