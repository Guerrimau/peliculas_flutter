import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {

  String _apiKey = '0ddd1b89f1973a6003c4bbe712a8f81c';
  String _url = 'api.themoviedb.org';
  String _languaje = 'es-ES';

  Future<List<Pelicula>> getEnCines () async {

    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key'  :  _apiKey,
      'languaje' :  _languaje
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    
    final peliculas = new Peliculas.fromJsonList( decodedData['results'] );

    return peliculas.items;

  }

  Future<List<Pelicula>> getPopulares () async {

    final url = Uri.https(_url, '3/movie/popular', {
      'api_key'  :  _apiKey,
      'languaje' :  _languaje
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    
    final peliculas = new Peliculas.fromJsonList( decodedData['results'] );

    return peliculas.items;

  }


}