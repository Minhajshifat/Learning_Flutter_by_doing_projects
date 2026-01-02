class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> mcqshuffle (){
    var changedlist=List.of(answers);
    changedlist.shuffle();
    return changedlist;
  }
}