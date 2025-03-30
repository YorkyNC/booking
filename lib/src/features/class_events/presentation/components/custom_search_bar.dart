import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class CustomSearchBar extends StatefulWidget {
  final String hintText;
  final Function(String)? onChanged;
  final bool readOnly;
  final bool isExpanded;
  final String? heroTag;
  final VoidCallback? onTap;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    this.onChanged,
    this.readOnly = false,
    this.isExpanded = false,
    this.heroTag,
    this.onTap,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget searchBarContent = Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: context.colors.gray100,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            _isFocused = hasFocus;
          });
        },
        child: TextField(
          autofocus: false,
          controller: _controller,
          onTap: widget.onTap,
          onChanged: (value) {
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          readOnly: widget.readOnly,
          style: context.typography.typography2Medium.copyWith(
            color: context.colors.gray700,
          ),
          decoration: InputDecoration(
            suffixIcon: (_isFocused || _controller.text.isNotEmpty)
                ? IconButton(
                    icon: Icon(
                      context.icons.delete_1__remove_add_button_buttons_delete_cross_x_mathematics_multiply_math,
                      size: 16,
                      color: context.colors.black,
                    ),
                    onPressed: () {
                      _controller.clear();
                      if (widget.onChanged != null) {
                        widget.onChanged!('');
                      }
                    },
                  )
                : null,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                color: context.colors.gray500,
                size: 20,
              ),
            ),
            hintText: widget.hintText,
            hintStyle: context.typography.typography2Regular.copyWith(
              color: context.colors.gray500,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
          ),
        ),
      ),
    );

    if (widget.heroTag != null) {
      searchBarContent = Hero(
        tag: widget.heroTag!,
        child: searchBarContent,
      );
    }

    if (widget.isExpanded) {
      return Expanded(child: searchBarContent);
    } else {
      return searchBarContent;
    }
  }
}
