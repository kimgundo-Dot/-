import 'package:flutter/material.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  Widget _buildMenuItem(String title) {
    return Column(
      children: [
        ListTile(
          title: Text(title, style: TextStyle(fontSize: 16)),
          contentPadding: EdgeInsets.zero,
          onTap: () {}, // 필요 시 콜백
        ),
        Divider(thickness: 1, color: Colors.black12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6F9), // 연핑크 배경
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '마이페이지',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상단 프로필 카드
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('이석현님', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text('(진행률 : 45%)'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: 0.45,
                      minHeight: 8,
                      backgroundColor: Color(0xFFFFEBC7),
                      color: Color(0xFFF8A928),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('챗봇 완성까지 45% 진행했어요'),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: 140,
                    height: 36,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        side: const BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text('프로필 보기'),
                    ),
                  ),
                ],
              ),
            ),

            _buildMenuItem('오늘의 질문 관리'),
            _buildMenuItem('추억의 앨범 관리'),
            _buildMenuItem('기념일 관리'),
            const SizedBox(height: 16),
            _buildMenuItem('공지사항'),
            _buildMenuItem('약관 및 정책'),
            _buildMenuItem('문의하기'),
            _buildMenuItem('로그아웃'),
          ],
        ),
      ),
    );
  }
}
