import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviepedia/common/widgets/empty_list.dart';
import 'package:moviepedia/common/widgets/error_snackbar.dart';
import 'package:moviepedia/common/widgets/movie_list_item.dart';
import 'package:moviepedia/pages/search_movie/bloc/search_movie_bloc.dart';
import 'package:moviepedia/pages/search_movie/bloc/search_movie_event.dart';
import 'package:moviepedia/pages/search_movie/bloc/search_movie_state.dart';

class SearchMoviePage extends StatefulWidget {
  @override
  State<SearchMoviePage> createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  final TextEditingController searchBarEditor = TextEditingController();
  final debouncer = Debouncer<String>(
    Duration(milliseconds: 500),
    initialValue: '',
  );

  late List<Widget> _resultList;

  late ScrollController controller;
  final scrollDebouncer = Debouncer<double>(
    Duration(milliseconds: 500),
    initialValue: 0.0,
  );

  @override
  void initState() {
    super.initState();
    _resultList = [];
    searchBarEditor.addListener(() => debouncer.value = searchBarEditor.text);
    debouncer.values.listen((search) {
      _resultList.clear();
      BlocProvider.of<SearchMovieBloc>(context)
          .add(SearchEvent(search: search, page: 1));
    });

    controller = ScrollController()..addListener(_scrollListener);

    scrollDebouncer.values.listen((extentAfter) {
      if (extentAfter == 0) {
        BlocProvider.of<SearchMovieBloc>(context).add(FetchNextPageEvent());
      }
    });
  }

  void _scrollListener() {
    print(controller.position.extentAfter);
    scrollDebouncer.value = controller.position.extentAfter;
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
              floating: true,
              pinned: true,
              title: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                  child: TextField(
                    controller: searchBarEditor,
                    decoration: InputDecoration(
                      hintText: 'Search for movies',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => searchBarEditor.clear(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BlocConsumer<SearchMovieBloc, SearchMovieState>(
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
