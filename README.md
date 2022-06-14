# THETA X Bloc App

![demo of app](docs/images/theta_new_gif.gif)

This application utilizes Bloc to handle state management. The connection to the camera is 
handled by the http package inside of the Bloc. The application shows the use of commands such as [listFiles](https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.list_files/) from the THETA Web API. 

```dart
var url = Uri.parse('http://192.168.1.1/osc/commands/execute');
    var header = {'Content-Type': 'application/json;charset=utf-8'};
    var bodyMap = {
    'name': 'camera.listFiles',
    'parameters': {
        'fileType': 'image',
        'startPosition': 0,
        'entryCount': 1,
        'maxThumbSize': 0
    }
    };
    var bodyJson = jsonEncode(bodyMap);
    var response = await http.post(url, headers: header, body: bodyJson);
    var thetaFiles = jsonDecode(response.body);
    var fileUrl = thetaFiles['results']['entries'][0]['fileUrl'];
    emit(ThetaState(message: fileUrl));
```

## Workarounds



For the THETA X, the `thumbnail` does not appear unless the `_detail` is set to true. The thumbnail only works for a single file. If we need to get multiple thumbnails, then the `startPosition` needs to be changed to a different number and run multiple times. 

Another technique is to get the list of file urls and pass it `fileUrl = fileUrl + "?type=thumb";`. This technique will also show the thumbnail. 

## Bloc Structure

The Bloc structure helps to manage the state across an application and handle events. Previously, I created an application using `setState()`, however, this approach is not very scalable as our application becomes more complex. With the use of Bloc, we can separate out the events and ensure that every file can access the state. The Bloc state management comes from the flutter [package](https://pub.dev/packages/flutter_bloc). 

### Event

Events in Bloc are executed when an action occurs. For each separate button in the application, I created a specific event. The `GetInfoEvent` below connects to the Info button.

```dart
class GetInfoEvent extends ThetaEvent {}
```
### State

The State is emitted in the Bloc file and holds information in parameters. The State extends [Equatable](https://pub.dev/packages/equatable). When the state changes, the screen updates.

### Bloc

Inside of the Bloc file, I have a series of `on` methods that pair an Event with the State. Basically, when an Event occurs, such as tapping on the Info button, the app will get the response from the camera. Next, it passes the response into the State, therefore displaying our text.

```dart
    on<GetInfoEvent>((event, emit) async {
      var url = Uri.parse('http://192.168.1.1/osc/info');
      var response = await http.get(url);
      var encoder = JsonEncoder.withIndent('  ');
      var formattedResponse = encoder.convert(jsonDecode(response.body));
      emit(ThetaState(message: formattedResponse));
    });
```

<img src="docs/images/response.png" width= 55%>

## ListView

The Show List Images button displays a list of thumbnail images. I created a `ListView` widget that uses the `urlList` to create the images. The list of urls can be accessed once we wrap our widget with a `BlocBuilder`. For the `ListView` widget, I assigned the length to be the length of the `urlList`. Additionally, an Image is created from each item inside of the urlList.

```dart
   return ListView.builder(
    itemCount: state.urlList.length,
    itemBuilder: ((context, index) {
    return Image.network('${state.urlList[index]}?type=thumb');
    }));
```

<img src="docs/images/thumbnails.png" width=55%>