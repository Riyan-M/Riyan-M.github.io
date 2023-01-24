import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:provider/provider.dart';

import '../Providers/form_manager.dart';

class TagCheck {
  static bool tagIsEmpty = true;
}

class HistoryForm extends StatefulWidget {
  const HistoryForm({Key? key}) : super(key: key);

  @override
  State<HistoryForm> createState() => _HistoryFormState();
}

class _HistoryFormState extends State<HistoryForm> {
  @override
  Widget build(BuildContext context) {
    // TagFields diagnosisTags = TagFields(hint: "LOL", defaultOptions: []);
    // List fluoxetine = ;


    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "I've been diagnosed with",
                    style: TextStyle(fontSize: 20),
                  )),
              SizedBox(height: 10,),
              TagFields(
                hint: "Enter diagnosis...",
                defaultOptions: [],
              ),

              SizedBox(
                height: 30,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "I'm currently taking",
                    style: TextStyle(fontSize: 20),
                  )),
              SizedBox(height: 10,),
              Consumer<FormManager>(builder: (context, model, child){
                print('rebuild');
                return TagFields(
                  hint: "Enter medications...",
                  // defaultOptions: autoTag(),
                  defaultOptions: context.watch<FormManager>().tags,

                );

              }),

              SizedBox(
                height: 30,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (){
                    print("lol");
                    Navigator.pop(context);

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Complete",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(width: 10,),
                      Container(
                          decoration: BoxDecoration(
                            color: Color(0xff00C7A8),
                            borderRadius: BorderRadius.circular(4)
                          ),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 20,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50,)

            ],
          ),
        ),
    );
  }
}

class TagFields extends StatefulWidget {
  final String hint;
  final List<String> defaultOptions;

  const TagFields({Key? key, required this.hint, required this.defaultOptions})
      : super(key: key);

  @override
  State<TagFields> createState() => _TagFieldsState();
}

class _TagFieldsState extends State<TagFields> {
  late double _distanceToField;
  late TextfieldTagsController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
  }

  static const List<String> _pickLanguage = <String>['Depression'];

  String text = '';




  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration.zero,(){
      if(text.contains('depression')){
        print("beans");
        context.read<FormManager>().tags = ['Fluoxetine'];
      }
    });


    return Autocomplete<String>(
      optionsViewBuilder: (context, onSelected, options) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Material(
              elevation: 4.0,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final dynamic option = options.elementAt(index);
                    return TextButton(
                      onPressed: () {
                        onSelected(option);
                      },
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '$option',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 74, 137, 92),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _pickLanguage.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selectedTag) {
        _controller.addTag = selectedTag;
      },
      fieldViewBuilder: (context, ttec, tfn, onFieldSubmitted) {
        return TextFieldTags(
          textEditingController: ttec,
          focusNode: tfn,
          textfieldTagsController: _controller,
          initialTags: widget.defaultOptions,
          textSeparators: const [' ', ','],
          letterCase: LetterCase.normal,
          validator: (String tag) {
            if (tag == 'php') {
              return 'No, please just no';
            } else if (_controller.getTags!.contains(tag)) {
              return 'you already entered that';
            }
            return null;
          },
          inputfieldBuilder: (context, tec, fn, error, onChanged, onSubmitted) {
            return ((context, sc, tags, onTagDelete) {

              // context.read<FormManager>().tags = ['Fluoxetine'];
              print(tags);
              print(context.watch<FormManager>().tags);
              if (tags.isNotEmpty) {
                TagCheck.tagIsEmpty = false;
              }
              return Stack(
                children: [
                  Container(
                    color: Color(0xffE8E8E9),
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: TextField(
                      onChanged: onChanged,
                      // onChanged: (value) => setState(() => text = value),
                      controller: tec,
                      keyboardType: TextInputType.multiline,
                      focusNode: fn,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // helperText: 'Enter language...',
                        helperStyle: const TextStyle(
                          color: Color.fromARGB(255, 74, 137, 92),
                        ),
                        hintText: _controller.hasTags ? '' : widget.hint,
                        errorText: error,
                        prefixIconConstraints:
                            BoxConstraints(maxWidth: _distanceToField * 0.74),
                        prefixIcon: tags.isNotEmpty
                            ? SingleChildScrollView(
                                controller: sc,
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    children: tags.map((String tag) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff00C7A8).withOpacity(0.1),
                                    ),
                                    margin: const EdgeInsets.only(right: 10.0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              '$tag',
                                              style: const TextStyle(
                                                  color: Color(0xff5D6569)),
                                            ),
                                          ),
                                          onTap: () {
                                            //print("$tag selected");
                                          },
                                        ),
                                        const SizedBox(width: 5.0),
                                        InkWell(
                                          child: const Icon(
                                            Icons.close,
                                            size: 14.0,
                                            color: Color(0xff5D6569),
                                          ),
                                          onTap: () {
                                            onTagDelete(tag);
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                }).toList()),
                              )
                            : null,
                      ),
                      onSubmitted: onSubmitted,
                      // onSubmitted: (value) => setState(() => text = value),

                    ),
                  ),
                ],
              );
            });
          },
        );
      },
    );

  }

}
