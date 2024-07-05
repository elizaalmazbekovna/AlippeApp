import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LivingMeet extends StatefulWidget {
  @override
  _AlippeMeetState createState() => _AlippeMeetState();
}

class _AlippeMeetState extends State<LivingMeet> {
  int _currentCarouselIndex = 0;
  final List<String> carouselItems = [
    'https://example.com/image1.jpg',
    'https://example.com/image2.jpg',
    'https://example.com/image3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alippe Meet'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Алдыдагы түз эфирлер',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Сулуу кол жазма китебинин презентациясы'),
                      Text('7 окт: 21:00'),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Ата-энелерге семинар өтүүнүн 5 эрежеси'),
                      Text('15 ноя: 20:00'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Азыр эфирде'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text('Сакталган эфирлер'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.teal),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 20),
            // CarouselSlider.builder(
            //   itemCount: carouselItems.length,
            //   options: CarouselOptions(
            //     height: 200,
            //     aspectRatio: 16 / 9,
            //     viewportFraction: 0.8,
            //     initialPage: 0,
            //     enableInfiniteScroll: true,
            //     enlargeCenterPage: true,
            //     onPageChanged: (index, reason) {
            //       setState(() {
            //         _currentCarouselIndex = index;
            //       });
            //     },
            //   ),
            //   itemBuilder: (BuildContext context, int index, int realIndex) {
            //     return ClipOval(
            //       child: Image.network(
            //         carouselItems[index],
            //         fit: BoxFit.cover,
            //         width: double.infinity,
            //         height: double.infinity,
            //       ),
            //     );
            //   },
            // ),
            SizedBox(height: 20),
            _buildLiveSession(),
          ],
        ),
      ),
    );
  }

  Widget _buildLiveSession() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Азыркы балдардын табияты',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'lib/assets/images/podcast.png',
                width: 150,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Спикер: Мээрим Арзыкул кызы',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
