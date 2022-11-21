import 'package:flutter/material.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'whoareyou.dart';

class wallet extends StatefulWidget {
  @override
  _walletState createState() => _walletState();
}

class _walletState extends State<wallet> {

  var connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
          name: 'My App',
          description: 'An app for converting pictures to NFT',
          url: 'https://pamplnet.org',
          icons: [
            'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ]));

  var _session, _uri, _signature;

  loginUsingMetamask(BuildContext context) async {
    if (!connector.connected) {
      try {
        var session = await connector.createSession(onDisplayUri: (uri) async {
          _uri = uri;
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
        });
        print(session.accounts[0]);
        print(session.chainId);
        setState(() {
          _session = session;
        });
      } catch (exp) {
        print(exp);
      }
    }
  }
  @override
  Widget build(BuildContext context) {

    connector.on(
        'connect',
            (session) => setState(
              () {
            _session = _session;
          },
        ));
    connector.on(
        'session_update',
            (payload) => setState(() {
          _session = payload;
          print(_session.accounts[0]);
          print(_session.chainId);
        }));
    connector.on(
        'disconnect',
            (payload) => setState(() {
          _session = null;
        }));

    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth / standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight / standardDeviceHeight;

    bool isconnected = false;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 29 * Factor_Height,
              ),
              Container(
                height: 52 * Factor_Height,
              ),
              Container(
                // 사진
                height: 205 * Factor_Height,
                width: 312 * Factor_Height,
                child: Image.asset(
                  'assets/wallet.png',
                  height: 205 * Factor_Height,
                  width: 312 * Factor_Height,
                ),
              ),
              Container(
                // 공백
                height: 47 * Factor_Height,
              ),
              Container(
                // '가상 지갑 연동' 텍스트
                height: 35 * Factor_Height,
                child: Text(
                  '가상 지갑 연동',
                  style: TextStyle(
                    fontSize: 32 * Factor_Height,
                    fontFamily: 'Spoqa-Bold',
                    color: Color(0xFF3C3C3C),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                // 공백
                height: 19 * Factor_Height,
              ),
              Container(
                height: 46 * Factor_Height,
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        'NFT 서비스를 이용하기 위해서는',
                        style: TextStyle(
                          fontSize: 18 * Factor_Height,
                          fontFamily: 'Spoqa-Medium',
                          color: Color(0xFF797979),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'NFT를 보관할 지갑이 필요합니다!',
                        style: TextStyle(
                          fontSize: 18 * Factor_Height,
                          fontFamily: 'Spoqa-Medium',
                          color: Color(0xFF797979),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // 공백
                height: 63 * Factor_Height,
              ),
              Container(
                // MetaMask 버튼
                height: 53 * Factor_Height,
                child: GestureDetector(

                  onTap: () {
                    if(_session == null) {
                      print("_session: null");
                      loginUsingMetamask(context);
                    }// metamask 웹 페이지로 넘어가도록 추후 구현
                    else print("_session: !null");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Color(0xFFD9D9D9),
                    ),
                    width: 300 * Factor_Width,
                    child: Row(
                      children: <Widget>[
                        Container(width: 7 * Factor_Width),
                        Container(
                          //MetaMask 연동 이미지
                          // 사진
                          height: 25 * Factor_Height,
                          width: 25 * Factor_Height,
                          child: Image.asset(
                            'assets/metamask_logo.png',
                            height: 25 * Factor_Height,
                            width: 25 * Factor_Height,
                          ),
                        ),
                        Container(width: 10 * Factor_Width),
                        Container(
                          child: Center(
                            child: Text(
                              'MetaMask',
                              style: TextStyle(
                                fontSize: 15 * Factor_Height,
                                fontFamily: 'Spoqa-Bold',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                height: 13 * Factor_Height,
              ),

              Container(
                // MetaMask 지갑이 없다면? 버튼
                height: 53 * Factor_Height,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                whoareyou())); // metamask 웹 페이지로 넘어가도록 추후 구현
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Color(0xFFD9D9D9),
                    ),
                    width: 300 * Factor_Width,
                    child: Row(
                      children: <Widget>[
                        Container(width: 7 * Factor_Width),
                        Container(
                          //MetaMask 연동 이미지
                          // 사진
                          height: 25 * Factor_Height,
                          width: 25 * Factor_Height,
                          child: Image.asset(
                            'assets/metamask_connect.png',
                            height: 25 * Factor_Height,
                            width: 25 * Factor_Height,
                          ),
                        ),
                        Container(width: 10 * Factor_Width),
                        Container(
                          child: Center(
                            child: Text(
                              'MetaMask 지갑이 없다면?',
                              style: TextStyle(
                                fontSize: 15 * Factor_Height,
                                fontFamily: 'Spoqa-Bold',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                // 공백
                height: 61 * Factor_Height,
              ),

              Container(
                // 다음으로 버튼

                height: 53 * Factor_Height,
                child: Container(
                  height: 53 * Factor_Height,
                  width: 300 * Factor_Width,
                  child: GestureDetector(
                    onTap: () {

                      _session = true; //디버깅용, 추후 삭제 바람

                      if(_session!=null)
                        Navigator.push( // 연동된 경우 true를 return하는 isconnected가 true일 경우 다음으로 버튼을 눌렀을 때 다음 페이지로 넘어가고, false일 경우 버튼을 눌렀을 때 반응이 없도록 설계
                            context,
                            MaterialPageRoute(
                                builder: (context) => whoareyou()));
                      // whoareyou 페이지로 넘어감
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: Opacity(
                            opacity: 0.73,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFCD0051),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              width: 300 * Factor_Width,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            '다음으로',
                            style: TextStyle(
                              fontSize: 17 * Factor_Width,
                              fontFamily: 'Spoqa-Bold',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 83 * Factor_Height,
              ),
            ],
          ),
        ),
      ),
    );
  }
}