# Url Shortener

## Installation

```
flutter pub get
```
## Usage 

```
flutter run
```

If you get this error : Cannot run with sound null safety because dependencies don't support null safety ,

```
flutter run --no-sound-null-safety
```

## pubspec.yaml add 

```
dependencies:
  flutter:
    sdk: flutter

  http: ^0.12.2
  flutter_clipboard_manager: ^0.0.2

  cupertino_icons: ^1.0.3
  flutter_svg: ^0.22.0

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^1.0.0
flutter:
  uses-material-design: true

  assets:
    - assets/del.svg
    - assets/illustration.svg
    - assets/logo.svg
    - assets/shape.svg
```

## Packages used in the project :
```
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_clipboard_manager/flutter_clipboard_manager.dart';
import 'package:http/http.dart' as http;
```

## What has been done in this project :

API used for link shortening in the project --> https://shrtco.de/docs/

## Screenshots of the project :

![url_shortener](https://user-images.githubusercontent.com/48391281/132995715-7e3d4d69-c6a1-491e-ae1b-565366496471.jpeg)


## License
```

MIT License

Copyright (c) 2021 Nisa Efendioğlu

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

