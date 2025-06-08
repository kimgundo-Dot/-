// lib/my_page_screen.dart
import 'package:flutter/material.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마이페이지'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(radius: 30, backgroundColor: Colors.grey),
                  const SizedBox(height: 10),
                  const Text('이석현님\n(진행률 : 45%)'),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: 0.45,
                    color: Colors.orange,
                    backgroundColor: Colors.orange[100],
                  ),
                  const SizedBox(height: 10),
                  const Text('챗봇 완성까지 45% 진행했어요'),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text("프로필 보기"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text('오늘의 질문 관리'),
            const SizedBox(height: 10),
            const Text('추억의 앨범 관리'),
            const SizedBox(height: 10),
            const Text('기념일 관리'),
            const Divider(height: 40),
            const Text('공지사항'),
            const Text('약관 및 정책'),
            const Text('문의하기'),
            const Text('로그아웃'),
          ],
        ),
      ),
    );
  }
}
