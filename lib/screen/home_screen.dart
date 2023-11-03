// ignore_for_file: unused_element, must_be_immutable

import 'package:flutter/material.dart';
import 'package:teduh_app/model/renungan_model.dart';
import 'package:teduh_app/screen/note/home_note_screen.dart';
import 'package:teduh_app/screen/openai/home_openai_screen.dart';
import 'package:teduh_app/screen/renungan/renungan_screen.dart';
import 'package:teduh_app/screen/youtube/home_youtube_screen.dart';
import 'package:teduh_app/widgets/custom_tag.dart';
import '../widgets/image_network_container.dart';

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    Renungan renungan = Renungan.renungans[0];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _RenunganHariIni(renungan: renungan),
          _RenunganHarian(renungans: Renungan.renungans),
        ],
      ),
    );
  }
}

class _RenunganHarian extends StatelessWidget {
  _RenunganHarian({
    super.key,
    required this.renungans,
  });

  final List<Renungan> renungans;
  List<String> menu = ['Renungan', 'Youtube WCM', 'ChatAI', 'Note'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Menu",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.0 / 0.3,
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: menu.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var item = menu[index];
              return InkWell(
                onTap: () {
                  if (item == 'Renungan') {
                    Navigator.pushNamed(
                      context,
                      renunganScreen.routeName,
                    );
                  } else if (item == 'Youtube WCM') {
                    Navigator.pushNamed(context, HomeYoutubeScreen.routeName);
                  } else if (item == 'ChatAI') {
                    Navigator.pushNamed(
                      context,
                      HomeOpenAiScreen.routeName,
                    );
                  } else if (item == 'Note') {
                    Navigator.pushNamed(
                      context,
                      noteHomeScreen.routeName,
                    );
                  }
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          size: 24.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Renungan Harian',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text('Lainnya', style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: renungans.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: const EdgeInsets.only(right: 10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        renunganScreen.routeName,
                        arguments: renungans[index],
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageNetworkContainer(
                          width: MediaQuery.of(context).size.width * 0.5,
                          imageUrl: renungans[index].imageUrl,
                        ),
                        Text(
                          renungans[index].title,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold, height: 1.5),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                            '${DateTime.now().difference(renungans[index].createdAt).inHours} jam yang lalu',
                            maxLines: 2,
                            style: Theme.of(context).textTheme.bodySmall!),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text('by ${renungans[index].author}',
                            maxLines: 2,
                            style: Theme.of(context).textTheme.bodySmall!),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _RenunganHariIni extends StatelessWidget {
  const _RenunganHariIni({
    super.key,
    required this.renungan,
  });

  final Renungan renungan;

  @override
  Widget build(BuildContext context) {
    return ImageNetworkContainer(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      imageUrl: renungan.imageUrl,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTag(
            backgroudColor: Colors.grey.withAlpha(150),
            children: [
              Text(
                "Renungan Hari Ini",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            renungan.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1.25,
                  color: Colors.white,
                ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Row(
              children: [
                Text(
                  'Baca lebih lanjut ',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
