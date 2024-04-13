class PackageModel {
  var id;
  var company;
  var premium;
  var outpatient;
  var inpatient;
  var dental;
  var optical;
  var specialist;
  var total;
  PackageModel(
      {this.id,
      this.company,
      this.premium,
      this.outpatient,
      this.inpatient,
      this.dental,
      this.optical,
      this.specialist,
      this.total});
  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
        id: json['id'],
        company: json['company'],
        premium: json['premium'],
        outpatient: json['outpatient'],
        inpatient: json['inpatient'],
        dental: json['dental'],
        optical: json['optical'],
        specialist: json['specialist'],
        total: json['total']);
  }
}
