// Student: Mohamemd Moussa hmad Mohammed
// Reg no:  26421
const String regNo = '26421';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by M.M.H.M
  String lower = text.toLowerCase();
  int total = 0;
  for (int i = 0; i < lower.length; i++) {
    if ('aeiou'.contains(lower[i])) {
      total++;
    }
  }
  return total;
}

void main() {
  // by M.M.H.M
  print('Reg no: $regNo | D = $d | T = $t');

  String myName = 'Mohamemd Moussa hmad Mohammed';
  print('$myName has ${countVowels(myName)} vowels');
