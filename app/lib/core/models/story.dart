class Story {
  final int id;
  final String title;
  final String by;
  final int score;
  final String? url;
  final int time;
  final List<int> kids;

  const Story({
    required this.id,
    required this.title,
    required this.by,
    required this.score,
    this.url,
    required this.time,
    required this.kids,
  });
}
