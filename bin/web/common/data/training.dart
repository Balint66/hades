// ignore_for_file: non_constant_identifier_names

class Training
{
  final String Code;
  final String Description;
  final int Id;
  const Training({required this.Code, required this.Description, required this.Id, });

  void toJson(Map<String, dynamic> object)
  {
    object["Code"] = Code;
    object["Description"] = Description;
    object["Id"] = Id;
  }

}
