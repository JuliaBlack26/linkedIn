import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:linkedin1/data/data.dart';
import 'package:linkedin1/widgets/constants.dart';
import 'package:linkedin1/widgets/custom_appbar.dart';
import 'package:linkedin1/widgets/custom_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _post = Data.postList;
  bool _showAppNavBar = true;
  late ScrollController _scrollController;
  bool _isScrollDown = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _initialScroll();
  }

  void _initialScroll() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!_isScrollDown) {
          _isScrollDown = true;
          _hideAppNavBar();
        }
      }
      if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (_isScrollDown) {
          _isScrollDown = false;
          _showAppNavBarState();
        }
      }
    });
  }

  void _hideAppNavBar() {
    setState(() {
      _showAppNavBar = false;
    });
  }

  void _showAppNavBarState() {
    setState(() {
      _showAppNavBar = true;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Container(
          color: Colors.black12,
          child: Column(
            children: [
              _showAppNavBar
                  ? CustomAppBar(sizingInformation: sizingInformation)
                  : const SizedBox(height: 0, width: 0),
              _listPostWidget(sizingInformation),
            ],
          ),
        );
      },
    );
  }

  Widget _listPostWidget(SizingInformation sizingInformation) {
    return Expanded(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _post.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              margin: const EdgeInsets.only(bottom: 0, top: 8),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.black54, width: 0.50),
                  bottom: BorderSide(color: Colors.black54, width: 0.50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(_post[index].ProfileUrl!),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _post[index].name!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _post[index].headline!,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _post[index].description!,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _post[index].tags!,
                      style: const TextStyle(color: kPrimaryColor),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: sizingInformation.screenSize.width,
                    child: Image.asset(
                      _post[index].image!,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: Image.asset("assets/icons/like_icon.png"),
                          ),
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: Image.asset("assets/icons/celebrate_icon.png"),
                          ),
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: Image.asset("assets/icons/love_icon.png"),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            _post[index].likes!,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(_post[index].comments!),
                          const SizedBox(width: 3),
                          const Text("comments"),
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 0.50,
                    color: Colors.black26,
                  ),
                  _rowButtons(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget _rowButtons() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: (){},
          child: columnSinglebutton(
            color: const Color(0xFF666666),
            name: "Like",
            iconImage: "assets/icons/like_icon_white.png"
          ),
        ),
        InkWell(
          onTap: (){},
          child: columnSinglebutton(
            color: const Color(0xFF666666),
            name: "Comment",
            iconImage: "assets/icons/comment-bubble-icon.png"
          ),
        ),
        InkWell(
          onTap: (){},
          child: columnSinglebutton(
            color: const Color(0xFF666666),
            name: "Repost",
            iconImage: "assets/icons/repost.png"
          ),
        ),
        InkWell(
          onTap: (){},
          child: columnSinglebutton(
            color: const Color(0xFF666666),
            name: "Repost",
            iconImage: "assets/icons/send-icon.png"
          ),
        ),
      ],
    ),
  );
}
