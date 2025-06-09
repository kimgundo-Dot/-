import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MemoryAddScreen extends StatefulWidget {
  final DateTime selectedDate;

  const MemoryAddScreen({super.key, required this.selectedDate});

  @override
  State<MemoryAddScreen> createState() => _MemoryAddScreenState();
}

class _MemoryAddScreenState extends State<MemoryAddScreen> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _images = [];
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _pickImages() async {
    if (_images.length >= 3) return;

    final picked = await _picker.pickMultiImage();
    if (picked.isNotEmpty) {
      setState(() {
        _images.addAll(picked.take(3 - _images.length));
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dateStr =
        "${widget.selectedDate.year}.${widget.selectedDate.month.toString().padLeft(2, '0')}.${widget.selectedDate.day.toString().padLeft(2, '0')} (${_weekdayToKor(widget.selectedDate.weekday)})";

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      dateStr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "아이와 함께한 사진과 그때 상황을 함께 담아주세요",
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 사진 추가 박스
              GestureDetector(
                onTap: _pickImages,
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F3F3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.camera_alt_outlined, size: 48, color: Colors.grey),
                      SizedBox(height: 12),
                      Text("사진을 최대 3장 선택해주세요", style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // 선택한 이미지 썸네일
              if (_images.isNotEmpty)
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(_images.length, (i) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(_images[i].path),
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => _removeImage(i),
                            child: const CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.black54,
                              child: Icon(Icons.close, size: 14, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),

              const SizedBox(height: 24),

              // 설명 입력
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "사진에 대한 설명을 남겨주세요",
                  ),
                ),
              ),

              const Spacer(),

              // 완료 버튼
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // 저장 로직은 나중에 붙이면 됨
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB800),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "완료",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _weekdayToKor(int weekday) {
    const days = ['월', '화', '수', '목', '금', '토', '일'];
    return days[weekday - 1];
  }
}
