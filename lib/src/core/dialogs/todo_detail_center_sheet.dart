import 'package:flutter/material.dart';
import 'package:todo_r5_app/src/home/model/todo_model.dart';

class TodoDetailCenterSheet extends StatelessWidget {
  final TodoModel todoModel;

  const TodoDetailCenterSheet({Key? key, required this.todoModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                todoModel.title ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                todoModel.description ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 16),
              todoModel.translatedTitle != null
                  ? Text(
                      todoModel.translatedTitle ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 2),
              todoModel.translatedDescription != null
                  ? Text(
                      todoModel.translatedDescription ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 30),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4, bottom: 2),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      'Accept',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
