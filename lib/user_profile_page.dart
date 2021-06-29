import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

String urlWhatsApp = "https://wa.me/6282235401113";
String urlLinkedIn = "https://www.linkedin.com/in/dyas-irvan-masruri-680002135";
String urlTwitter = "https://twitter.com/dyas_irvan";

class UserProfilePage extends StatelessWidget{

  void _launchWhatsApp() async =>
      await canLaunch(urlWhatsApp) ? await launch(urlWhatsApp) : throw 'Could not launch $urlWhatsApp';

  void _launchLinkedIn() async =>
      await canLaunch(urlLinkedIn) ? await launch(urlLinkedIn) : throw 'Could not launch $urlLinkedIn';

  void _launchTwitter() async =>
      await canLaunch(urlTwitter) ? await launch(urlTwitter) : throw 'Could not launch $urlTwitter';

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: itemWidth <= 600
        ? AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
          elevation: 0,
          backgroundColor: Color(0xFF227093)
          )
        : null,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: itemWidth,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(itemWidth / 2, 90),
                    bottomRight: Radius.elliptical(itemWidth / 2, 20)),
                color: Color(0xFF227093)
              ),
              child: CircleAvatar(
                child: ClipOval(
                  child: Image.asset("images/me.jpg", height: 150, width: 150,),
                ),
                backgroundColor: Colors.transparent,
              )
            ),
            SizedBox(height: 36,),
            Text(
                "Dyas Irvan Masruri",
                style: TextStyle(
                  fontFamily: 'Poppins'
                ),
            ),
            SizedBox(height: 8,),
            Text(
                "Jln Candi VI C Kota Malang",
                style: TextStyle(
                  fontFamily: 'Poppins'
                ),
            ),
            SizedBox(height: 8,),
            Text(
                "+6282235401113",
                style: TextStyle(
                  fontFamily: 'Poppins'
                ),
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    onPressed: (){
                      _launchWhatsApp();
                    },
                    icon: Image.asset("images/whatsapp.png")
                ),
                IconButton(
                    onPressed: (){
                      String? encodeQueryParameters(Map<String, String> params) {
                        return params.entries
                            .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            .join('&');
                      }

                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'dyas.mail@gmail.com',
                        query: encodeQueryParameters(<String, String>{
                          'subject': 'Feedback'
                        }),
                      );
                      launch(emailLaunchUri.toString());
                    },
                    icon: Image.asset("images/gmail.png")
                ),
                IconButton(
                    onPressed: (){
                      _launchLinkedIn();
                    },
                    icon: Image.asset("images/linkedin.png")
                ),
                IconButton(
                    onPressed: (){
                      _launchTwitter();
                    },
                    icon: Image.asset("images/twitter.png")
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  
}