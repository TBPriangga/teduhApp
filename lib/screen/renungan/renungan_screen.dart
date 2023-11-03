// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:teduh_app/screen/renungan/audio_screen.dart';
import 'package:teduh_app/screen/renungan/bacaan_screen.dart';
import 'package:teduh_app/widgets/bottom_nav_bar.dart';
import 'package:teduh_app/widgets/image_network_container.dart';

import '../../model/audio_model.dart';
import '../../model/renungan_model.dart';
import '../../widgets/image_assets_container.dart';

class renunganScreen extends StatefulWidget {
  const renunganScreen({Key? key}) : super(key: key);

  static String routeName = '/renunganscreen';
  @override
  State<renunganScreen> createState() => _renunganScreenState();
}

class _renunganScreenState extends State<renunganScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['Bacaan', 'Audio'];

    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 24.0,
              ),
            ),
          ),
          bottomNavigationBar: const BottomNavBar(index: 1),
          body: ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              const _DiscoverRenunganHarian(),
              _PilihanCategoryRenungan(tabs: tabs),
            ],
          )),
    );
  }
}

class _PilihanCategoryRenungan extends StatelessWidget {
  const _PilihanCategoryRenungan({
    super.key,
    required this.tabs,
  });

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    final renungan = Renungan.renungans;
    final audio = Audio
        .audios; // Assuming you have an Audio model with a static list of audios
    return Column(
      children: [
        TabBar(
          indicatorColor: Colors.black,
          tabs: tabs
              .map(
                (tab) => Tab(
                  icon: Text(
                    tab,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: TabBarView(
              children: tabs
                  .map(
                    (tab) => ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          tab == 'Audio' ? audio.length : renungan.length,
                      itemBuilder: ((context, index) {
                        if (tab == 'Audio') {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                audioScreen.routeName,
                                arguments: audio[index],
                              );
                            },
                            child: Row(
                              children: [
                                ImageAssetsContainer(
                                    width: 80,
                                    height: 80,
                                    margin: const EdgeInsets.all(10.0),
                                    borderRadius: 5,
                                    coverUrl: audio[index].coverUrl),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        audio[index].title,
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.book,
                                            size: 18.0,
                                          ),
                                          const SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            audio[index].description,
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                bacaanScreen.routeName,
                                arguments: renungan[index],
                              );
                            },
                            child: Row(
                              children: [
                                ImageNetworkContainer(
                                    width: 80,
                                    height: 80,
                                    margin: const EdgeInsets.all(10.0),
                                    borderRadius: 5,
                                    imageUrl: renungan[index].imageUrl),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        renungan[index].title,
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.schedule,
                                            size: 18.0,
                                          ),
                                          const SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            '${DateTime.now().difference(renungan[index].createdAt).inHours} jam yang lalu',
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      }),
                    ),
                  )
                  .toList()),
        ),
      ],
    );
  }
}

class _DiscoverRenunganHarian extends StatelessWidget {
  const _DiscoverRenunganHarian({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Renungan Harian',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            "Baca renungan harian untuk memulai harimu",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Cari renungan',
              fillColor: Colors.grey[200],
              filled: true,
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              suffixIcon: const RotatedBox(
                  quarterTurns: 1, child: Icon(Icons.tune, color: Colors.grey)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none),
            ),
          )
        ],
      ),
    );
  }
}
