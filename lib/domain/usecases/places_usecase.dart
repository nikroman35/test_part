import 'package:test_part/data/repository/place_repository.dart';
import 'package:injectable/injectable.dart';

import '../../presentation/detail_data/models.dart';

abstract class PlaceUseCase {
  Future<PlaceScreenModel?> getPlace(int id);
}

@Injectable(as: PlaceUseCase)
class PlaceUseCaseImpl extends PlaceUseCase {
  final PlacesRepository placeRepository;

  PlaceUseCaseImpl(this.placeRepository);

  @override
  Future<PlaceScreenModel?> getPlace(int id) async {
    var result = await placeRepository.getPlace(id);
    if (result != null) {
      return PlaceScreenModel(
          id: result.id,
          title: result.title,
          description: result.description,
          contacts: result.contacts,
          workTime: result.workTime,
          imageUrl: result.imageUrl,
          images: result.images ?? [],
          fullAddress: result.address?.fullAddress,
          geoPoint: result.address?.geo,
          tags: result.tags ?? []);
    }
    return null;
  }
}
