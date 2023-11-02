// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:teduh_app/model/renungan_model.dart';
import 'package:teduh_app/widgets/image_network_container.dart';

import '../../widgets/custom_tag.dart';

class bacaanScreen extends StatefulWidget {
  const bacaanScreen({Key? key}) : super(key: key);
  static const routeName = '/bacaanscreen';

  @override
  State<bacaanScreen> createState() => _bacaanScreenState();
}

class _bacaanScreenState extends State<bacaanScreen> {
  @override
  Widget build(BuildContext context) {
    final renungan = ModalRoute.of(context)!.settings.arguments as Renungan;
    return ImageNetworkContainer(
      width: double.infinity,
      imageUrl: renungan.imageUrl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            _BacaanHeadline(
              renungan: renungan,
            ),
            _BacaanBody(renungan: renungan)
          ],
        ),
      ),
    );
  }
}

class _BacaanBody extends StatelessWidget {
  const _BacaanBody({
    super.key,
    required this.renungan,
  });

  final Renungan renungan;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomTag(
                backgroudColor: Colors.black,
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(
                      renungan.authorImageUrl,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    renungan.author,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10.0,
              ),
              CustomTag(
                backgroudColor: Colors.grey.shade200,
                children: [
                  const Icon(
                    Icons.timer,
                    size: 24.0,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                      '${DateTime.now().difference(renungan.createdAt).inHours} jam yang lalu',
                      style: Theme.of(context).textTheme.bodyMedium!),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            renungan.title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            renungan.body,
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _BacaanHeadline extends StatelessWidget {
  const _BacaanHeadline({
    super.key,
    required this.renungan,
  });

  final Renungan renungan;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
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
          const SizedBox(
            height: 10.0,
          ),
          Text(
            renungan.subtitle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          )
        ],
      ),
    );
  }
}
