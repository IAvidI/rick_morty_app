import 'package:flutter/material.dart';
import 'package:rick_morty_app/constants/app_colors.dart';
import 'package:rick_morty_app/constants/app_styles.dart';
import 'package:rick_morty_app/dto/person.dart';
import 'package:rick_morty_app/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_app/repo/repo_persons.dart';
import 'package:rick_morty_app/ui/persons_list/widgets/vmodel.dart';

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

class PersonsListScreen extends StatelessWidget {
  const PersonsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const AppNavBar(current: 0),
        body: ChangeNotifierProvider(
          create: (context) => PersonsListVModel(
            repo: Provider.of<RepoPersons>(context, listen: false),
          ),
          builder: (context, _) {
            final personsTotal =
                context.watch<PersonsListVModel>().filteredList.length;
            return Column(
              children: [
                SearchField(
                  onChanged: (value) {
                    Provider.of<PersonsListVModel>(context, listen: false)
                        .filter(
                      value.toLowerCase(),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          S
                              .of(context)
                              .personsTotal(personsTotal)
                              .toUpperCase(),
                          style: AppStyles.s10w500.copyWith(
                            letterSpacing: 1.5,
                            color: AppColors.neutral2,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.grid_view),
                        iconSize: 28.0,
                        color: AppColors.neutral2,
                        onPressed: () {
                          Provider.of<PersonsListVModel>(
                            context,
                            listen: false,
                          ).switchView();
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Consumer<PersonsListVModel>(
                    builder: (context, vmodel, _) {
                      if (vmodel.isLoading) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                          ],
                        );
                      }
                      if (vmodel.errorMessage != null) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(vmodel.errorMessage!),
                            ),
                          ],
                        );
                      }
                      if (vmodel.filteredList.isEmpty) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(S.of(context).personsListIsEmpty),
                            ),
                          ],
                        );
                      }
                      return vmodel.isListView
                          ? _ListView(
                              personsList: vmodel.filteredList,
                            )
                          : _GridView(
                              personsList: vmodel.filteredList,
                            );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// class PersonsList extends StatefulWidget {
//   const PersonsList({Key? key}) : super(key: key);

//   @override
//   State<PersonsList> createState() => _PersonsListState();
// }

// class _PersonsListState extends State<PersonsList> {
//   var isListView = true;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         bottomNavigationBar: const AppNavBar(current: 0),
//         body: Column(
//           children: [
//             const SearchField(),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       S
//                           .of(context)
//                           .personsTotal(_personsList.length)
//                           .toUpperCase(),
//                       style: AppStyles.s10w500.copyWith(
//                         letterSpacing: 1.5,
//                         color: AppColors.neutral2,
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(isListView ? Icons.list : Icons.grid_view),
//                     iconSize: 28.0,
//                     color: AppColors.neutral2,
//                     onPressed: () {
//                       setState(() {
//                         isListView = !isListView;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: isListView
//                   ? _ListView(personsList: _personsList)
//                   : _GridView(personsList: _personsList),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// final _list = [
//   const Person(
//     name: '?????? ????????????',
//     species: '??????????????',
//     status: 'Alive',
//     gender: '??????????????',
//   ),
//   const Person(
//     name: '???????? ????????',
//     species: '??????????????',
//     status: 'Dead',
//     gender: '??????????????',
//   ),
//   const Person(
//     name: '???????????? ????????',
//     species: '??????????????',
//     status: 'Alive',
//     gender: '??????????????',
//   ),
//   const Person(
//     name: '?????????? ????????',
//     species: '??????????????',
//     status: 'Alive',
//     gender: '??????????????',
//   ),
// ];

// final _personsList = [
//   ..._list,
//   ..._list,
//   ..._list,
//   ..._list,
// ];
