import 'package:flutter/material.dart';
import 'package:new_test/my_page_screen.dart';
import 'package:new_test/anniversary_screen.dart';
import 'package:new_test/memory_album_screen.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBEA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // 로고 + 프로필 아이콘
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/icon.png', height: 32),
                  IconButton(
                    icon: const Icon(Icons.person_outline, size: 28),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyPageScreen()),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 프로필 카드
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFDF4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 이름 + 진행률
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('이석현님', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text('(진행률: 45%)'),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // 프로그레스 바
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: 0.45,
                        backgroundColor: const Color(0xFFF9EAB8),
                        color: const Color(0xFFF8A928),
                        minHeight: 8,
                      ),
                    ),

                    const SizedBox(height: 8),
                    const Text('챗봇 완성까지 45% 완성했어요'),

                    const SizedBox(height: 20),

                    // 오늘의 질문 카드
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                '오늘의 질문',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Chip(
                                label: Text('작성법', style: TextStyle(color: Colors.white, fontSize: 12)),
                                backgroundColor: Color(0xFFFFC107),
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Center(
                            child: Text(
                              '“오늘 아이가 무언가 잘했을 때,\n나는 어떻게 반응했나요?”',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.circle, size: 8, color: Colors.grey),
                              SizedBox(width: 6),
                              Icon(Icons.circle, size: 8, color: Colors.orange),
                              SizedBox(width: 6),
                              Icon(Icons.circle, size: 8, color: Colors.grey),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // 작성하기 버튼
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFA800),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        ),
                        child: const Text('작성하기', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // 기록 버튼들
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 200,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE2F2E6),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            const Text('추억 앨범', style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            const Expanded(
                              child: Text('아이와의 소중한\n추억을 남겨주세요', textAlign: TextAlign.center),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const MemoryAlbumScreen()),
                                );
                              },
                              child: const Text('작성하기'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SizedBox(
                      height: 200,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE7E5FA),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            const Text('기념일 기록', style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            const Expanded(
                              child: Text('특정 기념일에\n전달하고 싶은 말을\n전달해요', textAlign: TextAlign.center),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const AnniversaryScreen()),
                                );
                              },
                              child: const Text('작성하기'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 하단 안내 말풍선
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF4E8),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: const Text('(앱 이름) 기록방법'),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}