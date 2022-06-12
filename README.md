# THETA X Bloc App

This application utilizes Bloc to handle state management. The connection to the camera is 
handled by the http package inside of the Bloc. The camera shows the use of [listFiles](https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.list_files/) from THETA Web API. 

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

When accessing the `listFiles` command on the THETA X, the `startPosition` parameter needs to be assigned a value in order for `entryCount` to work. The documentation does not list `startPosition` as a requirement for `entryCount`. 

For the THETA X, the `thumbnail` does not appear unless the `_detail` is set to true. The thumbnail only works for a single file. If we need to get multiple thumbnails, then the `startPosition` needs to be changed to a different number and run multiple times. 

Another technique is to get the list of file urls and pass it `fileUrl = fileUrl + "?type=thumb";`. This technique will also show the thumbnail. 