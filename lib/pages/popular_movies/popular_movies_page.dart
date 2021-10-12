import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviepedia/common/configs/ui_configs.dart';
import 'package:moviepedia/common/widgets/empty_list.dart';
import 'package:moviepedia/common/widgets/error_snackbar.dart';
import 'package:moviepedia/common/widgets/movie_list_item.dart';
import 'package:moviepedia/pages/popular_movies/bloc/popular_movies_bloc.dart';
import 'package:moviepedia/pages/popular_movies/bloc/popular_movies_event.dart';
import 'package:moviepedia/pages/popular_movies/bloc/popular_movies_state.dart';
import 'package:moviepedia/pages/search_movie/search_movie_page.dart';

class PopularMoviesPage extends StatefulWidget {
  @override
  State<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  late List<Widget> _resultList;
  late ScrollController controller;
  final debouncer = Debouncer<double>(
    Duration(milliseconds: 500),
    initialValue: 0.0,
  );

  @override
  void initState() {
    super.initState();
    _resultList = [];
    controller = ScrollController()..addListener(_scrollListener);

    debouncer.values.listen((extentAfter) {
      if (extentAfter == 0) {
        BlocProvider.of<PopularMoviesBloc>(context).add(FetchNextPageEvent());
      }
    });
  }

  void _scrollListener() {
    print(controller.position.extentAfter);
    debouncer.value = controller.position.extentAfter;
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: CustomScrollView(
          controller: controller,
          slivers: [
            SliverAppBar(
              backgroundColor: UiConfigs.pageBackColor,
              floating: true,
              automaticallyImplyLeading: true,
              title: Row(
                children: [
                  Container(
                    width: 25.0,
                    height: 25.0,
                    margin: EdgeInsets.only(right: 15.0),
                    child: const Image(
                      image: ExactAssetImage('assets/images/mp_logo.png'),
                    ),
                  ),
                  Text(
                    'MoviePedia',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
              actions: [
                Container(
                    margin: EdgeInsets.only(right: 50.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SearchMoviePage()));
                      },
                      child: Icon(
                        Icons.search,
                        size: 26.0,
                      ),
                    )),
              ],
            ),
            BlocConsumer<PopularMoviesBloc, PopularMoviesState>(
              listener: (context, state) async {
                if (state is DataReceivedState) {
                  if (state.result.results!.isNotEmpty) {
                    state.result.results!.forEach((element) {
                      _resultList.add(MovieListItem(movieItem: element));
                    });
                  } else {
                    _clearResults();
                  }
                } else if (state is ClearListState) {
                  _clearResults();
                } else if (state is BusyState) {
                  Future.delayed(
                      Duration(milliseconds: 10),
                      () => controller
                          .jumpTo(controller.position.maxScrollExtent));
                } else if (state is ErrorState) {
                  ErrorSnackBar(
                          context: context,
                          statusCode: state.statusCode,
                          message: state.message)
                      .show();
                }
              },
              builder: (context, state) {
                if (state is DataReceivedState) {
                  return SliverList(
                      delegate: SliverChildListDelegate(_resultList));
                } else if (state is ClearListState) {
                  return EmptyList();
                } else if (state is BusyState) {
                  return SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ..._resultList,
                        Center(
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            margin: EdgeInsets.all(25.0),
                            padding: EdgeInsets.all(10.0),
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return EmptyList();
              },
            )
          ],
        ));
  }

  void _clearResults() {
    _resultList.clear();
    _resultList.add(Center(
      child: Text(
        'no result.',
      ),
    ));
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    controller.dispose();
    super.dispose();
  }
}
