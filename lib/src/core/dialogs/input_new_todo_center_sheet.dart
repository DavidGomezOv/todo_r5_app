import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_r5_app/src/core/constants/constants.dart';
import 'package:todo_r5_app/src/home/view_model/home_view_model.dart';

class InputNewTodoCenterSheet extends StatelessWidget {
  final SheetRequest? request;
  final Function(SheetResponse)? completer;

  InputNewTodoCenterSheet({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, viewModel, child) => Wrap(children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        request?.title ?? '',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.close,
                          size: 30,
                        ),
                        color: Colors.black,
                        onPressed: () =>
                            completer?.call(SheetResponse(confirmed: false)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          request?.description ?? '',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: viewModel.controllerTitle,
                        decoration: const InputDecoration(
                            hintText: 'Enter the title of TODO'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: viewModel.controllerDescription,
                        decoration: const InputDecoration(
                            hintText: 'Enter the description of TODO'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        onPressed: () {
                          completer?.call(SheetResponse(
                            confirmed: true,
                            data: {
                              Constants.todoTitle:
                                  viewModel.controllerTitle.text,
                              Constants.todoDescription:
                                  viewModel.controllerDescription.text,
                            },
                          ));
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          child: Text(
                            'Create TODO',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
      );
}
