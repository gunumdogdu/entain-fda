import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hacker_news/features/stories/presentation/widgets/story_card.dart';

import '../../../../core/models/story.dart';

class StoryList extends StatelessWidget {
  final List<Story> stories;

  const StoryList({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            // Handle refresh
          },
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          sliver: AnimationLimiter(
            child: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: StoryCard(story: stories[index]),
                    ),
                  ),
                ),
                childCount: stories.length,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SliverAnimationBuilder extends StatelessWidget {
  final Widget child;

  const SliverAnimationBuilder({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: child,
    );
  }
}
