# index_manager

## Overview
This package manages multiple indexes identified by name and supports serialization and deserialization.
It's essentially just a wrapper around Map, which is only slightly useful in if serialization is required.

## Usage
Call getIndex method with name will internally create a new object if not yet created, or return the previously created one if already created.

```dart
import 'package:index_manager/index_manager.dart';

final IndexManager _im = IndexManager();
final int? index = _im.getIndex("first", initialValue:0);
_im.setIndex("first", 1);
Map<String, dynamic> _map = _im.toDict();
final IndexManager _imRestored = IndexManager();
_imRestored.fromDict(_map);

```

## Support
Basically no support.  
Please file an issue if you have any problems.  
This package is low priority, but may be fixed.

## About version control
The C part will be changed at the time of version upgrade.
- Changes such as adding variables, structure change that cause problems when reading previous files.
    - C.X.X
- Adding methods, etc.
    - X.C.X
- Minor changes and bug fixes.
    - X.X.C

If the version is less than 1, there may be major corrections and changes regardless of the above.

## License
This software is released under the MIT License, see LICENSE file.

## Copyright notice
The "Dart" name and "Flutter" name are trademarks of Google LLC.  
*The developer of this package is not Google LLC.