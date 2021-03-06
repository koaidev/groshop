import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:groshop/Components/entry_field.dart';
import 'package:groshop/Pages/Other/product_info.dart';

class AddReviewPage extends StatefulWidget {
  @override
  _AddReviewPageState createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
              ),
              Image.asset(
                'assets/header.png',
                height: 200,
                fit: BoxFit.fitHeight,
              ),
              Positioned.directional(
                  top: 70,
                  textDirection: TextDirection.ltr,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  )),
              Positioned.directional(
                top: 90,
                start: MediaQuery.of(context).size.width / 3,
                textDirection: TextDirection.ltr,
                child: Text(
                  "Thêm đánh giá",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.7),
                ),
              ),
              Positioned.directional(
                  top: 150,
                  start: MediaQuery.of(context).size.width / 2.8,
                  textDirection: TextDirection.ltr,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductInfo()));
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/ProductImages/comfor.png',
                          height: 110,
                          fit: BoxFit.fitHeight,
                        )),
                  ))
            ],
          ),
          Text(
            "Cửa hàng  Giặt ủi Kim Khánh",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Theme.of(context).backgroundColor),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Nguyễn Kim Khánh',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Spacer(),
          Text(
            "Trải nghiệm của bạn như thế nào?",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.grey[500], fontSize: 18),
          ),
          Spacer(),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: Colors.red,
                  );
                case 1:
                  return Icon(
                    Icons.sentiment_dissatisfied,
                    color: Colors.redAccent,
                  );
                case 2:
                  return Icon(
                    Icons.sentiment_neutral,
                    color: Colors.amber,
                  );
                case 3:
                  return Icon(
                    Icons.sentiment_satisfied,
                    color: Colors.lightGreen,
                  );
                default:
                  return Icon(
                    Icons.sentiment_very_satisfied,
                    color: Colors.green,
                  );
              }
            },
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Spacer(),
          Divider(
            color: Colors.grey[200],
            thickness: 5,
          ),
          Spacer(),
          EntryField(
            labelFontWeight: FontWeight.w300,
            labelFontSize: 18,
            label: "Đánh giá",
            hint: "Nhập feedback của bạn",
          ),
          Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: Text("Gửi"),
              onPressed: () {
                //todo
              },
            ),
          ),
          Spacer(
            flex: 6,
          ),
        ],
      ),
    );
  }
}
