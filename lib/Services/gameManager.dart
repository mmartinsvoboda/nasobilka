import 'dart:math';

int num1 = 0;
int num2 = 0;
List<int> multi = [];
int result = 0;

int counter = 0;
int correctCounter = 0;
int errorCounter = 0;
int streakCounter = 0;

double successRate = 100;

int _switch = 0;

bool isCorrect = false;
bool answered = false;

String lastAnswer = "";

var rng = Random();

nextExample() {
  if (isCorrect) {
    lastAnswer = "Správně! $num1 x $num2 = $result";
  }

  try {
    successRate = (correctCounter / (counter)) * 100;
  } catch (e) {
    print(e);
    successRate = 0;
  }

  answered = false;
  isCorrect = false;
  counter++;

  num1 = rng.nextInt(10 + 1);
  num2 = multi[rng.nextInt(multi.length)];
  result = num1 * num2;

  if (rng.nextInt(1) == 1) {
    _switch = num1;
    num1 = num2;
    num2 = _switch;
  }
}

bool check(num answer) {
  if (answer == result) {
    //correct
    isCorrect = true;
    streakCounter++;
    if (answered == false) correctCounter++;
    answered = true;
    return true;
  } else {
    isCorrect = false;
    streakCounter = 0;
    if (answered == false) errorCounter++;
    answered = true;
    return false;
  }
}

restart() {
  multi.sort();
  num1 = 0;
  num2 = 0;
  result = 0;

  counter = 0;
  correctCounter = 0;
  errorCounter = 0;
  streakCounter = 0;

  successRate = 100;

  _switch = 0;

  isCorrect = false;
  answered = false;

  lastAnswer = "";
}
