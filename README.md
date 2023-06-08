

# Project Flutter with Clean Code and Unit Testing
![architecture-proposal](https://github.com/aldob-mohamed96/Flutter_clean_arc/assets/44900216/f41f6f17-c6e4-499a-8aa0-e3c097563ee3)

## Table of Contents
- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Clean Code Principles](#clean-code-principles)
- [Unit Testing](#unit-testing)
- [Getting Started](#getting-started)


## Introduction

The Flutter project described in this README aims to demonstrate how to write clean and maintainable code while incorporating<br>
unit testing for improved software quality. <br>
The principles of clean code ensure that the codebase is easy to understand, refactor, and extend, while unit testing allows for thorough testing of individual components.<br>


## Project Structure

The project structure follows a modular approach, separating different parts of the application into distinct directories.<br>
Here's an overview of the main directories:<br>
lib: Contains the Dart code for the application.<br>
freature that contain ( data ,domain ,presentation)<br>
data: Includes data sources and repositories for fetching and managing data ,reponse that contain models and convert response to models (mapper) to send data to domain without null values.<br>
domain: Contains the usecase ,repositery and  application entity .<br>
presentation: Consists of UI components their respective view models ,routes ,widget, bussines logic with bloc state managment a.<br>
core: Includes utility functions and classes that are used throughout the project.<br>
(errror,di,resorces,enums,services,validation,extenstion)<br>
test: Contains unit tests for different parts of the application.<br>
This structure allows for a clear separation of concerns and improves the overall organization of the codebase.<br>


## Clean Code Principles

The project adheres to the principles of clean code, which include:<br>
SOLID principles: The code is designed with a focus on Single Responsibility, Open-Closed, Liskov Substitution, Interface Segregation, and Dependency Inversion principles.<br>
Naming conventions: Meaningful and descriptive names are used for classes, functions, variables, and other components to enhance readability.<br>
Code formatting: Consistent code formatting is maintained throughout the project, following the recommended Dart style guide.<br>
Code comments: Inline comments are used to provide additional context and clarify complex sections of code.<br>
Separation of concerns: Different layers of the application (data, domain, presentation) are kept separate to improve maintainability and testability.<br>
By following these clean code principles, the project aims to improve code quality, readability, and maintainability.<br>


## Unit Testing
Unit testing is an integral part of this Flutter project.<br> 
The test directory contains unit tests for different parts of the application, including data sources,repositories,domain and presentation components.<br>

The project uses testing frameworks such as flutter_test and mockito to write and execute tests. <br>
These frameworks provide utilities for creating test cases, mocking dependencies, and asserting expected outcomes.<br>

By incorporating unit tests, the project ensures that individual components work as expected in isolation and helps catch bugs or regressions early in the development cycle.<br>

## Getting Started
To get started with the project, follow these steps:
1-<br>
Clone the project repository:<br>
git clone https://github.com/aldob-mohamed96/Flutter_clean_arc.git
2-<br>
cd project-directory<br>
flutter pub get<br>

3-<br>
Run the application on an emulator or physical device:<br>
flutter run<br>

4-Run the unit tests:<br>
flutter test<br>

