import 'package:football_stats/data/datasources/local_data_source/database.dart';
import 'package:football_stats/data/repositories/player_repository_impl.dart';
import 'package:football_stats/domain/repositories/player_repository.dart';
import 'package:football_stats/domain/usecases/get_players_usecase.dart';
import 'package:football_stats/presentation/bloc/player_bloc.dart';
import 'package:get_it/get_it.dart';

import 'domain/usecases/add_player_usecase.dart';
import 'domain/usecases/remove_player_usecase.dart';
import 'domain/usecases/update_player_usecase.dart';

final injector = GetIt.instance;

Future<void> initDependencies() async{

  //database
  final database = await $FloorAppDatabase.databaseBuilder('database.db').build();
  injector.registerSingleton(database);

  //bloc
  injector.registerFactory<PlayerBloc>(() => PlayerBloc(injector(), injector(), injector(), injector()));

  //repository
  injector.registerSingleton<PlayerRepository>(PlayerRepositoryImpl(injector()));

  //usecases
  injector.registerSingleton<GetPlayers>(GetPlayers(injector()));
  injector.registerSingleton<AddPlayer>(AddPlayer(injector()));
  injector.registerSingleton<RemovePlayer>(RemovePlayer(injector()));
  injector.registerSingleton<UpdatePlayer>(UpdatePlayer(injector()));
}