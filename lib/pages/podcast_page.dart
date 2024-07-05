import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PodcastPage extends StatefulWidget {
  @override
  _PodcastPageState createState() => _PodcastPageState();
}

class _PodcastPageState extends State<PodcastPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32.r),
                bottomRight: Radius.circular(32.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 22.w),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Подкаст',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTabButton('Подкаст тууралуy', 0),
                SizedBox(width: 16.w),
                _buildTabButton('Чыгарылыштар', 1),
              ],
            ),
          ),
          Expanded(
            child: _currentIndex == 0
                ? _buildPodcastDescription()
                : _buildEpisodes(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String text, int index) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _currentIndex = index;
        });
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: _currentIndex == index
            ? Colors.white
            : Color.fromARGB(255, 2, 68, 77),
        backgroundColor: _currentIndex == index
            ? Color.fromARGB(255, 2, 68, 77)
            : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
        side: BorderSide(
          color: Color.fromARGB(255, 2, 68, 77),
        ),
      ),
      child: Text(text),
    );
  }

  Widget _buildPodcastDescription() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '   Салам, достор! Назарыныздарда Alippe подкасты.',
            style: TextStyle(
              fontSize: 14.sp,
              color: Color.fromARGB(255, 2, 68, 77),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '   Бул подкасты балдарга, өспүрүмдөргө билим жана тарбия берүү багытында улам тармактын кыйын эксперттери, таанымал инсандары менен маек курабыз.',
            style: TextStyle(
              fontSize: 14.sp,
              color: Color.fromARGB(255, 2, 68, 77),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '   Билим жана тарбия берүүдө өлкөбүздөгү жүйөөлүү көйгөйлөрдү чечүү жолдору, тарбия берүүдөгү учурдагы актуалдуу кеңештер биздин подкастта орун алат.',
            style: TextStyle(
              fontSize: 14.sp,
              color: Color.fromARGB(255, 2, 68, 77),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '   Сизге жагымдуу көрүү каалайбыз!',
            style: TextStyle(
              fontSize: 14.sp,
              color: Color.fromARGB(255, 2, 68, 77),
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              image: DecorationImage(
                image: AssetImage('lib/assets/images/podcast.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEpisodes() {
    return ListView(padding: EdgeInsets.all(16.0.h), children: [
      _buildEpisodeCard('lib/assets/images/video_photo.jpeg',
          'Азыркы окуучулар башка', '44:34'),
    ]);
  }

  Widget _buildEpisodeCard(String assetPath, String title, String duration) {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              assetPath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(60),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  duration,
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

