import 'package:flutter/material.dart';

class MemoryAlbumScreen extends StatefulWidget {
  const MemoryAlbumScreen({super.key});

  @override
  State<MemoryAlbumScreen> createState() => _MemoryAlbumScreenState();
}

class _MemoryAlbumScreenState extends State<MemoryAlbumScreen> {
  DateTime selectedDate = DateTime(2025, 5, 28);
  DateTime focusedMonth = DateTime(2025, 5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBEA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('추억 앨범', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                '아이와 함께한 사진과 그때 상황을 함께 담아주세요',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 24),
              _buildCalendar(),
              const SizedBox(height: 32),
              Center(
                child: Text(
                  '${selectedDate.year}.${_pad(selectedDate.month)}.${_pad(selectedDate.day)} (${_getWeekdayKor(selectedDate.weekday)})',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Column(
                  children: [
                    const Icon(Icons.image, size: 48, color: Colors.grey),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        // 이 날의 추억 기록하기 동작
                      },
                      child: const Text('이 날의 추억 기록하기'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    ); // <- ✅ Scaffold 닫는 괄호!!
  }


  Widget _buildCalendar() {
    int daysInMonth = DateTime(focusedMonth.year, focusedMonth.month + 1, 0).day;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 상단: 연/월 + 이동 버튼
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${focusedMonth.year}년 ${_pad(focusedMonth.month)}월',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    setState(() {
                      focusedMonth = DateTime(focusedMonth.year, focusedMonth.month - 1);
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    setState(() {
                      focusedMonth = DateTime(focusedMonth.year, focusedMonth.month + 1);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),

        // 요일 헤더
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('일', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('월', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('화', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('수', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('목', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('금', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('토', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 8),

        // 날짜 그리드
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          itemCount: daysInMonth,
          itemBuilder: (context, index) {
            final date = DateTime(focusedMonth.year, focusedMonth.month, index + 1);
            final isSelected = selectedDate.year == date.year &&
                selectedDate.month == date.month &&
                selectedDate.day == date.day;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDate = date;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? Colors.lightBlue[100] : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.black : Colors.black87,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }


  String _pad(int number) => number.toString().padLeft(2, '0');

  String _getWeekdayKor(int weekday) {
    const days = ['월', '화', '수', '목', '금', '토', '일'];
    return days[weekday - 1];
  }
}
