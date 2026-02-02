import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/course_model.dart';

import 'widgets/banner_section.dart';
import 'widgets/title_section.dart';
import 'widgets/instructor_section.dart';
import 'widgets/stats_section.dart';
import 'widgets/curriculum_tab.dart';
import 'widgets/rating_section.dart';
import 'widgets/price_section.dart';

class CourseDetailScreen extends StatefulWidget {
  final int courseId;
  const CourseDetailScreen({super.key, required this.courseId});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen>
    with SingleTickerProviderStateMixin {
  CourseModel? course;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    loadCourse();
  }

  @override
  void didUpdateWidget(CourseDetailScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.courseId != widget.courseId) {
      loadCourse();
    }
  }

  Future<void> loadCourse() async {
    final data = await rootBundle.loadString('lib/data/common.json');
    final jsonData = json.decode(data);
    final courses = jsonData['courseCatalog']['allCourses'] as List;

    final selected = courses.firstWhere(
      (e) => e['id'] == widget.courseId,
      orElse: () => null,
    );

    if (selected == null) return;

    setState(() {
      course = CourseModel.fromJson(selected);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (course == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerSection(image: course!.image),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleSection(course: course!),
                  InstructorSection(course: course!),
                  const SizedBox(height: 20),
                  StatsSection(course: course!),
                  const SizedBox(height: 24),

                  TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: "Curriculum"),
                      Tab(text: "Reviews"),
                    ],
                  ),

                  SizedBox(
                    height: 250,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        CurriculumTab(),
                        const Center(child: Text("Reviews here")),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  const RatingSection(),
                  const SizedBox(height: 20),
                  PriceSection(course: course!),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
