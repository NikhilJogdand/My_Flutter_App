import 'package:flutter/material.dart';

class ListCardView extends StatelessWidget {

  ListCardView(
      String this.tittle,
      String this.imgPath,
      bool this.isFavorite);

  final String tittle;
  final String imgPath;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return itemCard(tittle, imgPath, isFavorite);
  }
}

Widget itemCard(String title, String imgPath, bool isFavorite) {
  return Padding(
    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
    child: Container(
      height: 150.0,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            width: 140.0,
            height: 150.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgPath), fit: BoxFit.cover)),
          ),
          SizedBox(width: 4.0),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 45.0),
                  Material(
                    elevation: isFavorite ? 0.0 : 2.0,
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: isFavorite
                              ? Colors.grey.withOpacity(0.2)
                              : Colors.white),
                      child: Center(
                        child: isFavorite
                            ? Icon(Icons.favorite_border)
                            : Icon(Icons.favorite, color: Colors.red),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5.0),
              Container(
                width: 175.0,
                child: Text(
                  'The WAT-FB MSBS-5.56, also known as Grot, is a modular assault rifle currently developed and manufactured by FB "Łucznik" Radom to become the next service rifle of the Polish Armed Forces.',
                  textAlign: TextAlign.left,
                  maxLines: 3,
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.grey,
                      fontSize: 12.0),
                ),
              ),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  SizedBox(width: 35.0),
                  Container(
                    height: 40.0,
                    width: 50.0,
                    color: Color(getColorHexFromStr('#F9C335')),
                    child: Center(
                      child: Text(
                        '\$248',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: 40.0,
                    width: 100.0,
                    color: Color(getColorHexFromStr('#FEDD59')),
                    child: Center(
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}

int getColorHexFromStr(String colorStr) {
  colorStr = "FF" + colorStr;
  colorStr = colorStr.replaceAll("#", "");
  int val = 0;
  int len = colorStr.length;
  for (int i = 0; i < len; i++) {
    int hexDigit = colorStr.codeUnitAt(i);
    if (hexDigit >= 48 && hexDigit <= 57) {
      val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 65 && hexDigit <= 70) {
      // A..F
      val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 97 && hexDigit <= 102) {
      // a..f
      val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
    } else {
      throw new FormatException("An error occurred when converting a color");
    }
  }
  return val;
}