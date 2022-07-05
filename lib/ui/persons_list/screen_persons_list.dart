import 'package:flutter/material.dart';
import 'package:rick_morty_app/constants/app_colors.dart';
import 'package:rick_morty_app/constants/app_styles.dart';
import 'package:rick_morty_app/dto/person.dart';
import 'package:rick_morty_app/generated/l10n.dart';

import 'widgets/person_grid_tile.dart';
import 'widgets/person_list_tile.dart';
import 'widgets/search_field.dart';
import '../../widgets/app_nav_bar.dart';

// part 'widgets/_list_view.dart';
class _ListView extends StatelessWidget {
  const _ListView({
    Key? key,
    required this.personsList,
  }) : super(key: key);

  final List<Person> personsList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(
        top: 12.0,
        left: 12.0,
        right: 12.0,
      ),
      itemCount: personsList.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: PersonListTile(personsList[index]),
          onTap: () {},
        );
      },
      separatorBuilder: (context, _) => const SizedBox(height: 26.0),
    );
  }
}

// part 'widgets/_grid_view.dart';
class _GridView extends StatelessWidget {
  const _GridView({
    Key? key,
    required this.personsList,
  }) : super(key: key);

  final List<Person> personsList;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 20.0,
      crossAxisSpacing: 8.0,
      childAspectRatio: 0.8,
      crossAxisCount: 2,
      padding: const EdgeInsets.only(
        top: 12.0,
        left: 12.0,
        right: 12.0,
      ),
      children: personsList.map((person) {
        return InkWell(
          child: PersonGridTile(person),
          onTap: () {},
        );
      }).toList(),
    );
  }
}

class PersonsList extends StatefulWidget {
  const PersonsList({Key? key}) : super(key: key);

  @override
  State<PersonsList> createState() => _PersonsListState();
}

class _PersonsListState extends State<PersonsList> {
  var isListView = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const AppNavBar(current: 0),
        body: Column(
          children: [
            const SearchField(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      S
                          .of(context)
                          .personsTotal(_personsList.length)
                          .toUpperCase(),
                      style: AppStyles.s10w500.copyWith(
                        letterSpacing: 1.5,
                        color: AppColors.neutral2,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(isListView ? Icons.list : Icons.grid_view),
                    iconSize: 28.0,
                    color: AppColors.neutral2,
                    onPressed: () {
                      setState(() {
                        isListView = !isListView;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: isListView
                  ? _ListView(personsList: _personsList)
                  : _GridView(personsList: _personsList),
            ),
          ],
        ),
      ),
    );
  }
}

final _list = [
  const Person(
    name: 'Рик Санчез',
    species: 'Человек',
    status: 'Alive',
    gender: 'Мужской',
  ),
  const Person(
    name: 'Алан Райс',
    species: 'Человек',
    status: 'Dead',
    gender: 'Мужской',
  ),
  const Person(
    name: 'Саммер Смит',
    species: 'Человек',
    status: 'Alive',
    gender: 'Женский',
  ),
  const Person(
    name: 'Морти Смит',
    species: 'Человек',
    status: 'Alive',
    gender: 'Мужской',
  ),
];

final _personsList = [
  ..._list,
  ..._list,
  ..._list,
  ..._list,
];
