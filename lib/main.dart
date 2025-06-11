import 'package:flutter/material.dart';
import 'child_info_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const NeverlandApp());
}

class NeverlandApp extends StatelessWidget {
  const NeverlandApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '네버랜드',
      debugShowCheckedModeBanner: false,

      locale: const Locale('ko'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko'), // 한국어 지원
        Locale('en'), // 영어도 같이 넣자
      ],

      home: const LoginScreen(),// <- 여기로 변경!
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBEA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 60),

              // 네버랜드 이미지
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/logo_neverland.png'),
              ),

              const SizedBox(height: 24),

              // 제목
              const Text(
                '아이와의 소중한 기록을 남겨보세요',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              // 부제목
              const Text(
                '당신의 말이 아이의 챗봇에 담깁니다',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const Spacer(),// 🔥 이거 덕분에 아래로 밀림!

              // 카카오 로그인 버튼
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const ChildInfoScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFEE500),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/kakao_icon.png', height: 24),
                      const SizedBox(width: 8),
                      const Text('카카오 로그인'),
                    ],
                  ),
                ),
              ),


              const SizedBox(height: 12),

              // 구글 로그인 버튼
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      side: const BorderSide(color: Colors.black26),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/google_icon.png', height: 24),
                        const SizedBox(width: 8),
                        const Text('구글로 계속하기', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),


              const SizedBox(height: 12),

              // 애플 로그인 버튼
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/apple_icon.png', height: 24, color: Colors.white),
                      const SizedBox(width: 8),
                      const Text('Apple로 계속하기'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
