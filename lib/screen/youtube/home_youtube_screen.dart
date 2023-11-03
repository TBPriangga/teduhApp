// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, avoid_print, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:teduh_app/model/video_list.dart';
import 'package:teduh_app/model/youtube_model.dart';
import 'package:teduh_app/screen/youtube/video_player_screen.dart';

import '../../utils/services.dart';

class HomeYoutubeScreen extends StatefulWidget {
  const HomeYoutubeScreen({Key? key}) : super(key: key);
  static String routeName = '/HomeYoutubeScreen';

  @override
  State<HomeYoutubeScreen> createState() => _HomeYoutubeScreenState();
}

class _HomeYoutubeScreenState extends State<HomeYoutubeScreen> {
  late ChannelInfo _channelInfo;
  late Item _item;
  late bool _isLoading;
  late String _playListId;
  late VideosList _videosList;
  late String _nextPageToken;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _nextPageToken = '';
    _scrollController = ScrollController();
    _videosList = VideosList(
        kind: '', etag: '', nextPageToken: '', videos: [], pageInfo: null);
    _videosList.videos = List.empty(growable: true);
    _getChannelInfo();
  }

  _getChannelInfo() async {
    _channelInfo = await Services.getChannelInfo();
    _item = _channelInfo.items[0];
    _playListId = _item.contentDetails.relatedPlaylists.uploads;
    print('_playListId $_playListId');
    await _loadVideos();
    setState(() {
      _isLoading = false;
    });
  }

  _loadVideos() async {
    VideosList tempVideoList = await Services.getVideosList(
      playListId: _playListId,
      pageToken: _nextPageToken,
    );
    _nextPageToken = tempVideoList.nextPageToken;
    _videosList.videos.addAll(tempVideoList.videos);
    print('videos: ${_videosList.videos}');
    print('_nextPageToken $_nextPageToken');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _buildInfoView(),
              // _buildVideoList(),
              NotificationListener<ScrollEndNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification.metrics.pixels ==
                      notification.metrics.maxScrollExtent) {
                    _loadVideos();
                  }
                  return true;
                },
                child: ListView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _videosList.videos.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        VideoItem videoItem = _videosList.videos[index];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                VideoPlayerScreen(videoItem: videoItem),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: _videosList
                                  .videos[index].video.thumbnails.medium.url,
                              width: 150,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Text(
                                _videosList.videos[index].video.title,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
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
      ),
    );
  }

  _buildInfoView() {
    return _isLoading
        ? CircularProgressIndicator()
        : Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        _item.snippet.thumbnails.medium.url,
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Text(
                        _item.snippet.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(_item.statistics.videoCount),
                    const SizedBox(
                      width: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
