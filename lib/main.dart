import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_riverpod/services/data_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(trendingMovieProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 212, 129, 33),
          body: _data.when(
            data: (_data) {
              final trendingMoviesList = _data.map((e) => e).toList();
              print("trendingMoviesList inside the main file");
              print(trendingMoviesList[1].posterPath);
              return ListView.builder(
                itemCount: trendingMoviesList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      print('hello gulraiz');
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(trendingMoviesList[index].title),
                        subtitle: Text(trendingMoviesList[index].overview),
                        leading: Image.network(
                            'https://image.tmdb.org/t/p/w220_and_h330_face/${trendingMoviesList[index].posterPath}'),
                      ),
                    ),
                  );
                },
              );
            },
            error: (err, s) => Text(err.toString()),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 211, 214, 37),
            title: const Text("Trending"),
          )),
    );
  }
}
