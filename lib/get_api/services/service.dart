import 'package:bmc_guide/get_api/responsitories/responsitory.dart';

class ServiceApi {

  Repository _repository;

  ServiceApi(){
    _repository = Repository();
  }

  getAllTravelApi() async {
    return await _repository.httpGet('travel-api');
  }
}