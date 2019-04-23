# flutter_todo

# this app is not complete

Todo VIPER Style

This Todo app will be a full reference implementation for VIPER written with Flutter. It demonstrates many of the tasks you would do on a daily basis in a VIPER based project such as:

- routing, 
- data validation and capture, 
- saving of captured data, 
- localization, 
- the use of view and presentation models
- ViewController parameter passing, 
- data cache injection, 
- output sub-protocols organized by event,
- returning results from sibling Presenters,
- separation of Entity Models from source models

The are two Routers:
* A Navigation Controller acts as a root router managing a list and a detail scene. 
* A custom router manages the Editing and Display modes of the detail scene.

No attempt has been made to make the scenes aesthetically pleasing - its all about the code. 

## Demo Modes

The demo has two modes: *test* and *coreData*. `test` mode uses an in-memory datastore. `coreData` mode uses CoreData! You can flip between the two modes by changing the value of the `gatewayImplementation`  in the `EntityGatewayFactory` .


