import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_instagram/themes/app_colors.dart';

import '../stateful/expanded_text_widget.dart';

class ItemRow extends StatelessWidget {
  const ItemRow({
    Key? key,
    this.avatarUrl,
    this.sizeAvatar = 36,
    this.title,
    this.subtitle,
    this.avatarWidget,
    this.bodyWidget,
    this.rightWidget,
    this.onTap,
    this.maxLines = 1,
    this.isCmt = false,
  }) : super(key: key);

  final String? avatarUrl;
  final double sizeAvatar;
  final String? title;
  final String? subtitle;
  final int maxLines;
  final Widget? avatarWidget;
  final Widget? bodyWidget;
  final Widget? rightWidget;
  final bool isCmt;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildAvatar(context),
              const SizedBox(width: 8),
              buildBodyWidget(context),
            ],
          ),
        ),
        rightWidget ?? const SizedBox(),
      ],
    );
  }

  Widget buildAvatar(BuildContext context) {
    Widget? built = avatarWidget;

    if (built == null && avatarUrl != null) {
      built = CircleAvatarBorder(avatarUrl: avatarUrl, size: sizeAvatar);
    }

    if (built != null && onTap != null) {
      built = GestureDetector(child: built, onTap: onTap);
    }

    return built ?? const SizedBox.shrink();
  }

  Widget buildBodyWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(context),
        ExpandedTextWidget(
          isCmt: isCmt,
          text: subtitle!,
        ),
      ],
    );
  }

  Widget buildTitle(BuildContext context) {
    Widget? built;

    if (title != null) {
      built = SizedBox(
        width: MediaQuery.of(context).size.width - 108,
        child: Text(
          title!,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.white,
              ),
        ),
      );
    }

    if (built != null && onTap != null) {
      built = GestureDetector(child: built, onTap: onTap);
    }

    if (built != null) {
      built = Flexible(child: built);
    }

    return built ?? const SizedBox.shrink();
  }

  Widget buildSubtitle(BuildContext context) {
    if (subtitle == null) {
      return const SizedBox();
    }
    if (!isCmt) {
      return Container(
        margin: const EdgeInsets.only(top: 2),
        child: Text(
          subtitle!,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: AppColors.slate),
          maxLines: 1,
          overflow: TextOverflow.clip,
          softWrap: false,
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 2),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.80,
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.transparent,
          borderRadius: BorderRadius.circular(15),
          // boxShadow: [
          //   BoxShadow(
          //     color: AppColors.grey.withOpacity(0.5),
          //     spreadRadius: 2,
          //     blurRadius: 5,
          //   ),
          // ],
        ),
        child: Text(
          subtitle!,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: AppColors.white92),
        ),
      ),
    );
  }
}

class CircleAvatarBorder extends StatelessWidget {
  final String? avatarUrl;
  final double size;

  const CircleAvatarBorder({Key? key, this.avatarUrl, this.size = 32})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: CachedNetworkImage(
          imageUrl: avatarUrl!,
          errorWidget: (ctx, str, obj) => Container(
            child: Icon(
              Icons.person,
              size: size - 10,
              color: AppColors.white,
            ),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightBlueGrey,
            ),
          ),
        ),
      ),
    );
  }
}
