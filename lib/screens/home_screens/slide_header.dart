import 'package:bmc_guide/app/plugins/p_network_image.dart';
import 'package:bmc_guide/screens/destination_screen/destination_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<dynamic> imgList = [
  {
    'img':
        "https://media-cdn.tripadvisor.com/media/daodao/photo-w/14/51/dc/67/caption.jpg",
    'title': 'Angkor Wat SeimReap',
    'gallary': [
      'https://1.bp.blogspot.com/-0axRt7Ur7Iw/W3463x5bOoI/AAAAAAAALeg/b8XTdNJrtCcdSlHCHd4vKK54o1cKzYX_gCLcBGAs/s1600/19250394_1367538133315435_2244393463311273186_o.jpg',
      'https://2.bp.blogspot.com/-WLZbOABrgto/W3469ZRtMHI/AAAAAAAALgE/B3aWBDsZf6cqBgcmlBXz_1lhfiM_vmH6QCLcBGAs/s1600/19453238_1367527169983198_7530598145979411585_o.jpg',
      'https://fileqt.qdnd.vn/data/images/27/2018/05/11/vandiep_kh/11052018_vd_09.jpg?w=500',
      'https://2.bp.blogspot.com/-p_SA_Ce-I00/W4B_ERwtXmI/AAAAAAAAACw/_pF_pcPMtegwFRm0CK4UNFI7w-MzHVFVwCLcBGAs/s640/1137.jpg',
    ]
  },
  {
    'img':
        "https://twocantravel.com/wp-content/uploads/2016/07/Koh-Rong-Samloem-Tropicalife.net_.jpg",
    'title': 'ឆ្នេសមុទ្រ កំពុងសោម',
    'gallary': [
      'https://1.bp.blogspot.com/-0axRt7Ur7Iw/W3463x5bOoI/AAAAAAAALeg/b8XTdNJrtCcdSlHCHd4vKK54o1cKzYX_gCLcBGAs/s1600/19250394_1367538133315435_2244393463311273186_o.jpg',
      'https://2.bp.blogspot.com/-WLZbOABrgto/W3469ZRtMHI/AAAAAAAALgE/B3aWBDsZf6cqBgcmlBXz_1lhfiM_vmH6QCLcBGAs/s1600/19453238_1367527169983198_7530598145979411585_o.jpg',
      'https://fileqt.qdnd.vn/data/images/27/2018/05/11/vandiep_kh/11052018_vd_09.jpg?w=500',
      'https://2.bp.blogspot.com/-p_SA_Ce-I00/W4B_ERwtXmI/AAAAAAAAACw/_pF_pcPMtegwFRm0CK4UNFI7w-MzHVFVwCLcBGAs/s640/1137.jpg',
    ]
  },
  {
    'img':
        "https://www.touropia.com/gfx/d/ten-wonders-of-the-world/angkor.jpg?v=1",
    'title': 'ប្រាសាទបាយយ័ន សៀមរាប',
    'gallary': [
      'https://i.pinimg.com/originals/f5/32/c1/f532c15d32a543804f0f1b412faf5679.jpg',
      'https://ttnotes.com/images/bayon-angkor-thom-7.jpg ',
      'https://media.gadventures.com/media-server/dynamic/blogs/posts/Lauren-Marinigh/2016/07/bayon.jpg',
    ]
  },
];

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class SlideHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Object child = map<Widget>(
      imgList,
      (index, i) {
        return GestureDetector(
//            onTap: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) =>
//                  AboutThisPlace(
//                    i['img'], i['title'],'Good luck', i['gallary']
//                  )
//                )
//              );
//            },
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                child: Stack(children: <Widget>[
                  PNetworkImage(
                    i['img'],
                    fit: BoxFit.cover,
                    width: 1000,
                  ),
                  // Image.network(i, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                      child: Text(
                        i['title'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ));
      },
    ).toList();
//Manually operated Carousel
    final CarouselSlider manualCarousel = CarouselSlider(
      items: child,
      autoPlay: true,
      enlargeCenterPage: true,
      viewportFraction: 0.9,
      aspectRatio: 2.0,
    );
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Column(children: [
          manualCarousel, //Header slide
        ]));
  }
}
