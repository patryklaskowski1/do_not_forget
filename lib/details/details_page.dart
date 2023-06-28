import 'package:do_not_forget/auth/page/user_profile.dart';
import 'package:do_not_forget/details/cubit/details_cubit.dart';
import 'package:do_not_forget/models/item_model.dart';
import 'package:do_not_forget/repositories/items_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 114, 113, 113),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 3, 253, 241),
          size: 28,
        ),
        title: const Text(
          'Details',
          style: TextStyle(
            color: Color.fromARGB(255, 3, 253, 241),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(MediaQuery.of(context).size.width, 80.0),
          ),
        ),
        toolbarHeight: 120,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(129, 41, 37, 37),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const UserProfile(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.account_circle_rounded,
                  color: Color.fromARGB(255, 3, 253, 241),
                  size: 38,
                )),
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => DetailsCubit(ItemsRepository())..getItemWithID(id),
        child: BlocBuilder<DetailsCubit, DetailsState>(
          builder: (context, state) {
            final itemModel = state.itemModel;
            if (itemModel == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              children: [
                _ListViewItem(
                  itemModel: itemModel,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ListViewItem extends StatelessWidget {
  const _ListViewItem({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title:',
                    style: styleTextHeading(),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 80,
                    ),
                    child: Text(
                      itemModel.title,
                      style: styleReceivedData(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description:',
                    style: styleTextHeading(),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 80,
                    ),
                    child: Text(
                      itemModel.description,
                      style: styleReceivedData(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Data:',
                    style: styleTextHeading(),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 80,
                    ),
                    child: Text(
                      itemModel.dateFormatted(),
                      style: styleReceivedData(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Time to event:',
                    style: styleTextHeading(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 80,
                        ),
                        child: Text(
                          itemModel.daysLeft(),
                          style: styleReceivedData(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'days left',
                        style: styleReceivedData(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextStyle styleReceivedData() {
    return const TextStyle(
      color: Color.fromARGB(255, 3, 253, 241),
      fontSize: 24,
    );
  }

  TextStyle styleTextHeading() {
    return const TextStyle(
      fontSize: 20,
      color: Colors.transparent,
      shadows: [Shadow(offset: Offset(0, -10), color: Colors.white)],
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.wavy,
      decorationColor: Colors.white,
      decorationThickness: 3,
    );
  }
}
