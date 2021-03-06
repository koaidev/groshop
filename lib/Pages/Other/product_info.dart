import 'package:flutter/material.dart';
import 'package:groshop/Components/custom_button.dart';
import 'package:groshop/Locale/locales.dart';
import 'package:groshop/Pages/Other/reviews.dart';
import 'package:groshop/Pages/Other/seller_info.dart';
import 'package:groshop/Pages/Search/search_result.dart';
import 'package:groshop/Routes/routes.dart';

import '../../models/product.dart';
import '../../screen/ConfirmOrder.dart';
import '../../widgets/rating/rating.dart';
import 'category_products.dart';

class ProductInfo extends StatefulWidget {
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    List<Product> sellerProducts = [
      Product(
          image: "assets/ProductImages/comfor.png",
          name: "Nước xả",
          type: "Nước xả",
          price: "\$7.0",
          seller: "Cửa hàng Ánh Kim"),
      Product(
          image: "assets/ProductImages/washing.png",
          name: "Máy giặt lồng ngang",
          type: "Máy giặt",
          price: "\$300.0",
          seller: "CTY TNHH Kim Khánh"),
      Product(
          image: "assets/ProductImages/comfor.png",
          name: "Nước xả",
          type: "Nước xả",
          price: "\$7.0",
          seller: "Cửa hàng Ánh Kim"),
      Product(
          image: "assets/ProductImages/washing.png",
          name: "Máy giặt lồng ngang",
          type: "Máy giặt",
          price: "\$300.0",
          seller: "CTY TNHH Kim Khánh"),
      Product(
          image: "assets/ProductImages/comfor.png",
          name: "Nước xả",
          type: "Nước xả",
          price: "\$7.0",
          seller: "Cửa hàng Ánh Kim"),
      Product(
          image: "assets/ProductImages/washing.png",
          name: "Máy giặt lồng ngang",
          type: "Máy giặt",
          price: "\$300.0",
          seller: "CTY TNHH Kim Khánh"),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                //Container(),
                Image.asset("assets/ProductImages/washing.png",
                    fit: BoxFit.fill),
                Positioned.directional(
                    textDirection: Directionality.of(context),
                    top: 40,
                    start: 5,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios))),
                Positioned.directional(
                    textDirection: Directionality.of(context),
                    top: 40,
                    end: 5,
                    child: IconButton(
                        onPressed: () {
                          //todo
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConfirmOrderPage(()=>Navigator.popAndPushNamed(context, PageRoutes.productsScreen))));
                        },
                        icon: ImageIcon(AssetImage('assets/ic_cart.png')))),
                Positioned.directional(
                    textDirection: Directionality.of(context),
                    top: 90,
                    end: 5,
                    child: IconButton(
                        onPressed: () {

                        }, icon: Icon(Icons.favorite_border))),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Máy giặt",
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nguyễn Kim Khánh Store",
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.grey[600],
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      //SizedBox(width: 180,),
                      buildRating(context),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text("3.200.000 VNĐ",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20)),
                      Spacer(),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Reviews()));
                          },
                          child: Text(
                            "Đánh giá" + ' ',
                            style: TextStyle(
                                color: Color(
                                  0xffa9a9a9,
                                ),
                                fontSize: 13),
                          )),
                      Icon(Icons.arrow_forward_ios,
                          size: 10, color: Color(0xffa9a9a9)),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Demo giao diện mặt hàng chưa đầy đủ...",
                    softWrap: true,
                    style: TextStyle(
                      color: Color(0xff585858),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              // onTap: () => Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => CheckOutNavigator())),
              height: 60,
              iconGap: 12,
              prefixIcon: ImageIcon(
                AssetImage('assets/ic_cart.png'),
                color: Colors.white,
                size: 16,
              ),
              label: "Thêm vào giỏ hàng",
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SellerInfo()));
                },
                child: RichText(
                  text: TextSpan(
                      text: "Sản phẩm cùng cửa hàng" + ' ',
                      style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Chủ cửa hàng",
                            style: TextStyle(fontWeight: FontWeight.w500)),
                      ]),
                ),
              ),
              trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CategoryProduct("Xem tất cả")));
                  },
                  child: Text(
                    "Xem tất cả",
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: buildGridView(sellerProducts),
            ),
          ],
        ),
      ),
    );
  }
}
