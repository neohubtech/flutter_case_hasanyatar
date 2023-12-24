#!/bin/bash
set -e

cd ..
dart pub global activate flutter_gen
fluttergen -c pubspec.yaml
