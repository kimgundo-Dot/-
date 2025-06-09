import 'package:flutter/material.dart';

class AnniversaryListScreen extends StatefulWidget {
  final String title;
  final String date;
  final bool repeat;
  final String message;

  const AnniversaryListScreen({
    super.key,
    required this.title,
    required this.date,
    required this.repeat,
    required this.message,
  });

  @override
  State<AnniversaryListScreen> createState() => _AnniversaryListScreenState();
}

class _AnniversaryListScreenState extends State<AnniversaryListScreen> {
  late List<Map<String, dynamic>> anniversaries;

  @override
  void initState() {
    super.initState();
    anniversaries = [
      {
        'title': widget.title,
        'date': widget.date,
        'repeat': widget.repeat,
        'message': widget.message,
      }
    ];
  }

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
        title: const Text('등록된 기념일', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '아이에게 전달할 특별한 날들을 관리할 수 있어요',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _sortButton('날짜순', true),
                const SizedBox(width: 12),
                _sortButton('최신순', false),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: anniversaries.length,
                itemBuilder: (context, index) {
                  final item = anniversaries[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    color: const Color(0xFFFFF9D7),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(item['title'].toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(item['date'].toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                                  Text(item['repeat'] == true ? '(매년 반복)' : '(올해만)', style: const TextStyle(fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(item['message'].toString()),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlinedButton(
                                onPressed: () async {
                                  final result = await showDialog<Map<String, dynamic>>(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: const Text('기념일 수정'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: TextEditingController(text: item['title']),
                                            decoration: const InputDecoration(labelText: '제목'),
                                            onChanged: (value) => item['title'] = value,
                                          ),
                                          TextField(
                                            controller: TextEditingController(text: item['message']),
                                            decoration: const InputDecoration(labelText: '메시지'),
                                            onChanged: (value) => item['message'] = value,
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, item),
                                          child: const Text('저장'),
                                        ),
                                      ],
                                    ),
                                  );
                                  if (result != null) {
                                    setState(() {
                                      anniversaries[index] = result;
                                    });
                                  }
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  side: const BorderSide(color: Colors.grey),
                                ),
                                child: const Text('수정'),
                              ),
                              const SizedBox(width: 8),
                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    anniversaries.removeAt(index);
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.red,
                                  side: const BorderSide(color: Colors.red),
                                ),
                                child: const Text('삭제'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFFA800),
        onPressed: () {
          // 새 기념일 등록 페이지 이동
        },
        child: const Icon(Icons.edit),
      ),
    );
  }

  Widget _sortButton(String label, bool isActive) {
    return ElevatedButton(
      onPressed: () {
        // 정렬 로직
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive ? const Color(0xFFFFD34E) : Colors.grey.shade300,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        padding: const EdgeInsets.symmetric(horizontal: 24),
      ),
      child: Text(label),
    );
  }
}
