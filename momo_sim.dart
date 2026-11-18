// Student: Mohamemd Moussa hmad Mohammed
// Reg no:  26421
const String regNo = '26421';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  // by M.M.H.M
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String formatRwf(int amount) {
  // by M.M.H.M
  bool negative = amount < 0;
  String digits = amount.abs().toString();
  String result = '';
  int count = 0;
  int i = digits.length - 1;
  while (i >= 0) {
    result = digits[i] + result;
    count++;
    if (count % 3 == 0 && i > 0) {
      result = ',' + result;
    }
    i--;
  }
  if (negative) result = '-' + result;
  return '$result RWF';
}

bool isValidPin(String pin) {
  // by M.M.H.M
  if (pin.length != 5) return false;
  if (pin == '12345') return false;

  bool allSame = true;
  int i = 0;
  while (i < pin.length) {
    if (!'0123456789'.contains(pin[i])) return false;
    if (pin[i] != pin[0]) allSame = false;
    i++;
  }
  return !allSame;
}

int sendMoney(int balance, int amount) {
  // by M.M.H.M
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
      'New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by M.M.H.M
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }
  if (amount > balance) {
    print('Failed: balance is too low');
    return balance;
  }
  int newBalance = balance - amount;
  print('Airtime ${formatRwf(amount)} bought. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {
  // by M.M.H.M
  print('Reg no: $regNo | D = $d | T = $t');

  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('4821$d'));

  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  int k = 1;
  while (k <= 3) {
    balance = sendMoney(balance, (d + 1) * 3000);
    k++;
  }
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  print(formatRwf(-999));    // -999 RWF  (might break: a comma before the first digit)
  print(formatRwf(1000000)); // 1,000,000 RWF
  print(formatRwf(100000));  // 100,000 RWF
  print(isValidPin(' 4821')); // false (starts with a space)
  print(isValidPin(''));     // false (empty PIN, might break)
  print(isValidPin('00000')); // false (five equal digits)
}
