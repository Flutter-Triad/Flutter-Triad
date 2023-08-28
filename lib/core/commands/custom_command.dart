import 'dart:io';
import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:args/args.dart';
import 'package:path/path.dart' as path;

void main(List<String> arguments) {
  final ArgParser argParser = ArgParser()
    ..addOption('feature', abbr: 'f', help: 'Specify the feature name')
    ..addOption('file', abbr: 'n', help: 'Specify the file name');

  final ArgResults args = argParser.parse(arguments);

  final String featureName = args['feature'].toString().onNull();
  final String fileName = args['file'].toString().onNull();

  CustomCommand customCommand = CustomCommand();
  customCommand.generateFeatureFiles(featureName, fileName);
}

class CustomCommand {
  void generateFeatureFiles(String featureName, String fileName) {
    createFeatureDirectory(featureName);
    createDataLayerDirectories(featureName);
    createPresentationLayerDirectories(featureName);
    createDomainLayerDirectories(featureName);
    createViewFile(featureName, fileName);

    print('Feature "$featureName" created successfully.');
  }

  void createFeatureDirectory(String featureName) {
    final featureDir = Directory('lib/features/$featureName');
    if (featureDir.existsSync()) {
      print('Feature "$featureName" already exists.');
      return;
    }
    featureDir.createSync(recursive: true);
  }

  void createDataLayerDirectories(String featureName) {
    createSubDirectory(featureName, 'data');
    createSubDirectory(featureName, 'data/data_source');
    createSubDirectory(featureName, 'data/mapper');
    createSubDirectory(featureName, 'data/repository_implementation');
    createSubDirectory(featureName, 'data/response');
    createSubDirectory(featureName, 'data/request');
  }

  void createPresentationLayerDirectories(String featureName) {
    createSubDirectory(featureName, 'presentation');
    createSubDirectory(featureName, 'presentation/model');
    createSubDirectory(featureName, 'presentation/view');
    createSubDirectory(featureName, 'presentation/controller');
  }

  void createDomainLayerDirectories(String featureName) {
    createSubDirectory(featureName, 'domain');
    createSubDirectory(featureName, 'domain/model');
    createSubDirectory(featureName, 'domain/repository');
    createSubDirectory(featureName, 'domain/usecase');
  }

  void createSubDirectory(String featureName, String subDirPath) {
    final subDir = Directory('lib/features/$featureName/$subDirPath');
    subDir.createSync(recursive: true);
  }

  void createViewFile(String featureName, String fileName) {
    final viewDir = Directory('lib/features/$featureName/presentation/view');
    viewDir.createSync(recursive: true);

    final file = File(path.join(viewDir.path, fileName));
    if (!file.existsSync()) {
      file.writeAsStringSync('''
import 'package:flutter/material.dart';

class ${fileName.replaceAll('.dart', '').capitalize()}View extends StatelessWidget {
  const ${fileName.replaceAll('.dart', '').capitalize()}View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
''');
      print('View file "$fileName" created successfully.');
    } else {
      print('View file "$fileName" already exists.');
    }
  }
}

// fvm dart command_file_path -f feature_name -n dart_file_name.dart
// Ex: fvm dart lib/core/commands/custom_command.dart -f visit -n visit.dart