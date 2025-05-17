import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ostad Responsive Course UI',
      theme: ThemeData(
        fontFamily: 'Sans',
        useMaterial3: true,
      ),
      home: CourseGridPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CourseGridPage extends StatelessWidget {
  final List<Map<String, String>> courses = [
    {
      'title': 'Full Stack Web Development with JavaScript (MERN)',
      'duration': '৩ সিট বাকি',
      'duration2': '১৯ দিন বাকি',
      'flag': 'lib/image/1js.jpg',
    },
    {
      'title': 'Full Stack Web Development with Python, Django & React',
      'duration': '৬ সিট বাকি',
      'duration2': '৪৫ দিন বাকি',
      'flag': 'lib/image/2python.jpg',
    },
    {
      'title': 'App Development with Flutter',
      'duration': '২ সিট বাকি',
      'duration2': '০ দিন বাকি',
      'flag': 'lib/image/3flutter.jpg',
    },
    {
      'title': 'Full Stack Web Development with PHP, Laravel & Vue Js',
      'duration': '৭ সিট বাকি',
      'duration2': '৪৫ দিন বাকি',
      'flag': 'lib/image/4web.jpg',
    },
    {
      'title': 'Full Stack Web Development with ASP.Net Core',
      'duration': '৫ সিট বাকি ·',
      'duration2': '৩৭ দিন বাকি',
      'flag': 'lib/image/5web.jpg',
    },
    {
      'title': 'SQA: Manual & Automated Testing',
      'duration': '৫ সিট বাকি',
      'duration2': '০ দিন বাকি',
      'flag': 'lib/image/6sqa.jpg',
    },
    {
      'title': 'Mastering DevOps: From Fundamentals to Advanced Practices',
      'duration': '৮৮ সিট বাকি',
      'duration2': '৪১ দিন বাকি',
      'flag': 'lib/image/7devops.jpg',
    },
    {
      'title': 'Coding Interview Preparation (Local+Remote Job)',
      'duration': '৬৭ সিট বাকি',
      'duration2': '৪৭ দিন বাকি',
      'flag': 'lib/image/8coding.jpg',
    },

  ];

  int getCrossAxisCount(double width) {
    if (width > 1024) return 4; // Desktop
    if (width > 768) return 3;  // Tablet
    return 2;                   // Mobile
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = getCrossAxisCount(width);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: courses.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) {
            final course = courses[index];
            return CourseCard(details: course);
          },
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final Map<String, String> details;

  const CourseCard({required this.details});

  double getFontSize(double width, {double desktop = 20, double tablet = 16, double mobile = 12}) {
    if (width > 1024) return desktop;
    if (width > 768) return tablet;
    return mobile;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final titleFontSize = getFontSize(width, desktop: 24, tablet: 19, mobile: 12);
    final durationFontSize = getFontSize(width, desktop: 16, tablet: 13, mobile: 8);
    final buttonFontSize = getFontSize(width, desktop: 18, tablet: 15, mobile: 10);
    final imageHeight = getFontSize(width, desktop: 200, tablet: 160, mobile: 100);

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              details['flag']!,
              height: imageHeight,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Wrap(
              spacing: 5,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.groups, size: 14, color: Colors.grey[700]),
                    SizedBox(width: 4),
                    Text(
                      details['duration']!,
                      style: TextStyle(color: Colors.grey[700], fontSize: durationFontSize),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.schedule, size: 14, color: Colors.grey[700]),
                    SizedBox(width: 4),
                    Text(
                      details['duration2']!,
                      style: TextStyle(color: Colors.grey[700], fontSize: durationFontSize),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Text(
              details['title']!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: titleFontSize),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                padding: EdgeInsets.symmetric(vertical: 5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'বিস্তারিত দেখি',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: buttonFontSize,
                    ),
                  ),
                  Icon(Icons.arrow_forward_outlined, color: Colors.black),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
