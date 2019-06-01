// import 'package:flutter_hackathon_19/models/project.dart';

// class ProjectDB {
//   ProjectDB(this._db, this._store);

//   final Store _store;
//   final Database _db;

//   @override
//   Future<ApiResponse> add(Project item) async {
//     final Map<String, dynamic> values = convertItemToStorageMap(item);
//     final Record recordToAdd = Record(_store, values, item.objectId);
//     final Record recordFromDB = await _db.putRecord(recordToAdd);
//     return ApiResponse(
//         true, 200, <dynamic>[convertRecordToItem(record: recordFromDB)], null);
//   }

//   @override
//   Future<ApiResponse> addAll(List<Project> items) async {
//     final List<Project> itemsInDb = List<Project>();

//     for (final Project item in items) {
//       final ApiResponse response = await add(item);
//       if (response.success) {
//         final Project itemInDB = response.result;
//         itemsInDb.add(itemInDB);
//       }
//     }

//     if (itemsInDb.isEmpty) {
//       return errorResponse;
//     } else {
//       return ApiResponse(true, 200, itemsInDb, null);
//     }
//   }

//   @override
//   Future<ApiResponse> getAll() async {
//     final List<Project> foodItems = List<Project>();

//     final List<SortOrder> sortOrders = List<SortOrder>();
//     sortOrders.add(SortOrder(keyName));
//     final Finder finder = Finder(sortOrders: sortOrders);
//     final List<Record> records = await _store.findRecords(finder);

//     if (records.isNotEmpty) {
//       for (final Record record in records) {
//         final Project project = convertRecordToItem(record: record);
//         foodItems.add(project);
//       }
//     } else {
//       return errorResponse;
//     }

//     return ApiResponse(true, 200, foodItems, null);
//   }

//   @override
//   Future<ApiResponse> getById(String id) async {
//     final Record record = await _store.getRecord(id);
//     if (record != null) {
//       final Project project = convertRecordToItem(record: record);
//       return ApiResponse(true, 200, <dynamic>[project], null);
//     } else {
//       return errorResponse;
//     }
//   }

//   @override
//   Future<ApiResponse> getNewerThan(DateTime date) async {
//     final List<Project> foodItems = List<Project>();

//     final Finder finder = Finder(
//         filter:
//             Filter.greaterThan(keyVarUpdatedAt, date.millisecondsSinceEpoch));

//     final List<Record> records = await _store.findRecords(finder);

//     for (final Record record in records) {
//       final Project convertedProject = convertRecordToItem(record: record);
//       foodItems.add(convertedProject);
//     }

//     if (records == null) {
//       return errorResponse;
//     }

//     return ApiResponse(true, 200, foodItems, null);
//   }

//   @override
//   Future<ApiResponse> remove(Project item) async {
//     await _store.delete(item.objectId);
//     return ApiResponse(true, 200, null, null);
//   }

//   @override
//   Future<ApiResponse> updateAll(List<Project> items) async {
//     final List<Project> updatedItems = List<Project>();

//     for (final Project item in items) {
//       final ApiResponse response = await update(item);
//       if (response.success) {
//         final Project responseItem = response.result;
//         updatedItems.add(responseItem);
//       }
//     }

//     if (updatedItems == null) {
//       return errorResponse;
//     }

//     return ApiResponse(true, 200, updatedItems, null);
//   }

//   @override
//   Future<ApiResponse> update(Project item) async {
//     final Map<String, dynamic> values = convertItemToStorageMap(item);
//     final dynamic returnedItems = await _store.update(values, item.objectId);

//     if (returnedItems == null) {
//       return add(item);
//     }

//     return ApiResponse(true, 200, <dynamic>[convertRecordToItem(values: returnedItems)], null);
//   }

//   Map<String, dynamic> convertItemToStorageMap(Project item) {
//     final Map<String, dynamic> values = Map<String, dynamic>();
//     // ignore: invalid_use_of_protected_member
//     values['value'] = json.jsonEncode(item.toJson(full: true));
//     values[keyVarObjectId] = item.objectId;
//     if (item.updatedAt != null) {
//       values[keyVarUpdatedAt] = item.updatedAt.millisecondsSinceEpoch;
//     }

//     return values;
//   }

//   Project convertRecordToItem({Record record, Map<String, dynamic> values}) {
//     try {
//       values ??= record.value;
//       final Project item = Project.clone().fromJson(json.jsonDecode(values['value']));
//       return item;
//     } catch (e) {
//       return null;
//     }
//   }

//   static ApiError error = ApiError(1, 'No records found', false, '');
//   ApiResponse errorResponse = ApiResponse(false, 1, null, error);
// }