//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

import 'Priority.dart';

class Todo {

    String id;
    String title;
    String note;
    DateTime completeBy;
    Priority priority;
    bool completed;

    Todo({ @required this.id, @required this.title, this.note = "", this.completeBy, this.priority = Priority.none, this.completed = false});

    static final _inboundDateFormatter = DateFormat("yyyy'-'MM'-'dd");

     factory Todo.fromStringValueDictionary(Map<String, String> dictionary) {

        final id = dictionary["id"];
        assert(id != null, "Missing id");
        final title = dictionary["title"];
        final note = dictionary["note"];
        final completeBy = dictionary["completeBy"];
        final priority = dictionary["priority"] ?? "none";
        final completed = dictionary["completed"];

        return Todo(
            id: id,
            title: title,
            note: note,
            completeBy: (completeBy != null) ? _convert(dateString: completeBy) : null,
            priority: priorityFromString(priority),
            completed: (completed == "true")
        );
    }

    factory Todo.fromDynamicValueDictionary(Map<String, dynamic> dictionary) {

        final id = dictionary["id"];
        assert(id != null, "Missing id");
        final title = dictionary["title"];
        final note = dictionary["note"];
        final completeBy = dictionary["completeBy"] as int;
        final priority = dictionary["priority"] ?? "none";
        final completed = dictionary["completed"] as int;

        return Todo(
                id: id,
                title: title,
                note: note,
                completeBy: (completeBy != null) ? _convertSinceEpoch(date: completeBy) : null,
                priority: priorityFromString(priority),
                completed: (completed == 1)
        );
    }

    Map<String, dynamic> toDynamicValueMap() {
        return {
            'id': id,
            'title': title,
            'note': note,
            'completeBy': completeBy?.millisecondsSinceEpoch,
            'priority': (priority == Priority.none) ? null : priorityToString(priority),
            'completed': completed ? 1 : 0,

        };
    }



    static DateTime _convert({dateString: String}) {
        try {
            return _inboundDateFormatter.parse(dateString);
        }
        on FormatException {
            assert(false, "Format of date is incorrect");
        }
        return null;
    }

    static DateTime _convertSinceEpoch({date: int}) {
        return DateTime.fromMillisecondsSinceEpoch(date);
    }

}
