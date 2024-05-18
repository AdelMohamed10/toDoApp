// import 'dart:developer';
import 'dart:typed_data';

class TaskModel {
  String? name;
  String? desc;
  int? done;
  int? missed;
  int? id;
  int? availableTimes;
  int? times;
  Uint8List? image;

  TaskModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['description'];
    image = json['image'] as Uint8List?;
    times = json['times'] as int?;
    availableTimes = json['availableTimes'] as int?;
    missed = json['missed'] as int?;
    done = json['done'] as int?;
    id = json['id'] as int?;
  }
}
