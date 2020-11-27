import 'dart:io';
import 'dart:math';

void main() {
  Game game = Game(max: 100);

  int guess;
  Result result;

  do {
    stdout.write('Enter number between 1 to 100: ');
    String input = stdin.readLineSync();
    guess = int.parse(input);

    result = game.guess(guess);
  } while (result != Result.correct);
}

enum Result {
  tooLow,
  tooHigh,
  correct,
}

class Game {
  int answer;
  int max;

  // Game({@required this.max}) {
  Game({this.max = 100}) {
    Random random = Random();
    answer = random.nextInt(max) + 1;
  }

  Result guess(int number) {
    print('max = $max');
    if (number > answer) {
      print('To high');
      return Result.tooHigh;
    }

    if (number < answer) {
      print('To low');
      return Result.tooLow;
    }

    print('Correct!');
    return Result.correct;
  }
}
