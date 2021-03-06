//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/foundation.dart';

import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Presenter/TodoItemRouterPresenter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Router/TodoItemRouterRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/UseCase/TodoItemRouterUseCase.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/UseCase/TodoItemUseCaseState.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/View/TodoItemRouterScene.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';

class TodoItemRouterAssembly {

    final TodoItemRouterScene scene;
    TodoItemRouterAssembly._({@required this.scene});

    factory TodoItemRouterAssembly(TodoItemRouterRouter router, TodoItemStartMode startMode) {

        final useCaseState = TodoItemUseCaseState();
        final useCase = TodoItemRouterUseCase(entityGateway: EntityGateway.entityGateway, useCaseState: useCaseState);
        final presenter = TodoItemRouterPresenter(useCase: useCase, router: router, startMode: startMode);
        final scene = TodoItemRouterScene(presenter: presenter, useCaseState: useCaseState);

        return TodoItemRouterAssembly._(scene: scene);
    }
}