import 'package:flutter/material.dart';
import 'package:game_tv/models/user.dart';
import 'package:game_tv/pages/utils.dart';

class AppHeader extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => 100.0;

  final UserProfile user;
  const AppHeader({required this.user});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final percent = (maxExtent - shrinkOffset) / maxExtent;

    double sizeDynamic(double min, double max) {
      return min + (max - min) * percent;
    }

    double imageHeight = sizeDynamic(50, 100);

    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: sizeDynamic(8, 16), vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Image(
                  image:
                      NetworkImage('https://thispersondoesnotexist.com/image'),
                  width: imageHeight,
                  height: imageHeight,
                ),
              ),
              VS(2),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      user.name,
                      style: TextStyle(fontSize: sizeDynamic(20, 32)),
                      overflow: TextOverflow.ellipsis,
                    ),
                    HS(sizeDynamic(1, 4)),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          border: Border.all(
                              color: Colors.primaries.first, width: 2)),
                      child: Row(
                        children: [
                          Text(
                            user.rating.toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Colors.primaries.first),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Elo Rating',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
