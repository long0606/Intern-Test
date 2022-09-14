
class Data {
  String? _minimum;
  String? _maximum;
  String? _numberApproval;
  String? _feature;
  String? _matrixName;

  // getter
  String? get minimum => _minimum;
  String? get maximum => _maximum;
  String? get number  => _numberApproval;
  String? get feature => _feature;
  String? get name => _matrixName;
  // setter
  set newMinimum(String minimum) {
    _minimum = minimum;
  }
  set newMaximum(String maximum) {
    _maximum = maximum;
  }
  set newNumber(String number) {
    _numberApproval = number;
  }
  set newFeature(String feature) {
    _feature = feature;
  }
  set newName(String name) {
    _matrixName = name;
  }

  // Constructor
  Data(
      {
        String minimum = '',
        String maximum = '',
        String number = '',
        String feature = '',
        String name = '',
        }) {
    newMinimum = minimum;
    newMaximum = maximum;
    newNumber = number;
    newFeature = feature;
    newName = name;
  }

}