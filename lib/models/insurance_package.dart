class InsurancePackage {
  final String? id;
  final String? company;
  final int? premium;
  final int? outpatient;
  final int? inpatient;
  final int? dental;
  final int? optical;
  final int? specialist;
  final int? total;

  InsurancePackage({
    this.id,
    this.company,
    this.premium,
    this.outpatient,
    this.inpatient,
    this.dental,
    this.optical,
    this.specialist,
    this.total,
  });

  factory InsurancePackage.fromJson(Map<String, dynamic> json) {
    return InsurancePackage(
      id: json['id'],
      company: json['company'],
      premium: json['premium'] != null ? int.parse(json['premium']) : null,
      outpatient:
          json['outpatient'] != null ? int.parse(json['outpatient']) : null,
      inpatient:
          json['inpatient'] != null ? int.parse(json['inpatient']) : null,
      dental: json['dental'] != null ? int.parse(json['dental']) : null,
      optical: json['optical'] != null ? int.parse(json['optical']) : null,
      specialist:
          json['specialist'] != null ? int.parse(json['specialist']) : null,
      total: json['total'] != null ? int.parse(json['total']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company': company,
      'premium': premium,
      'outpatient': outpatient,
      'inpatient': inpatient,
      'dental': dental,
      'optical': optical,
      'specialist': specialist,
      'total': total,
    };
  }
}
