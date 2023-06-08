

# Project Flutter with Clean Code and Unit Testing

## Table of Contents
- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Clean Code Principles](#clean-code-principles)
- [Unit Testing](#unit-testing)
- [Getting Started](#getting-started)


## Introduction

The Flutter project described in this README aims to demonstrate how to write clean and maintainable code while incorporating unit testing for improved software quality. The principles of clean code ensure that the codebase is easy to understand, refactor, and extend, while unit testing allows for thorough testing of individual components.


## Project Structure

The project structure follows a modular approach, separating different parts of the application into distinct directories. Here's an overview of the main directories:
lib: Contains the Dart code for the application.
data: Includes data sources and repositories for fetching and managing data.
domain: Contains the business logic and core application models.
presentation: Consists of UI components and their respective view models.
utils: Includes utility functions and classes that are used throughout the project.
test: Contains unit tests for different parts of the application.
This structure allows for a clear separation of concerns and improves the overall organization of the codebase.


## Clean Code Principles

The project adheres to the principles of clean code, which include:
SOLID principles: The code is designed with a focus on Single Responsibility, Open-Closed, Liskov Substitution, Interface Segregation, and Dependency Inversion principles.
Naming conventions: Meaningful and descriptive names are used for classes, functions, variables, and other components to enhance readability.
Code formatting: Consistent code formatting is maintained throughout the project, following the recommended Dart style guide.
Code comments: Inline comments are used to provide additional context and clarify complex sections of code.
Separation of concerns: Different layers of the application (data, domain, presentation) are kept separate to improve maintainability and testability.
By following these clean code principles, the project aims to improve code quality, readability, and maintainability.


## Unit Testing
Unit testing is an integral part of this Flutter project. The test directory contains unit tests for different parts of the application, including data sources, repositories, domain logic, and presentation components.

The project uses testing frameworks such as flutter_test and mockito to write and execute tests. These frameworks provide utilities for creating test cases, mocking dependencies, and asserting expected outcomes.

By incorporating unit tests, the project ensures that individual components work as expected in isolation and helps catch bugs or regressions early in the development cycle.

## Getting Started
To get started with the project, follow these steps:
1-
Clone the project repository:

2-
cd project-directory
flutter pub get

3-
Run the application on an emulator or physical device:
flutter run

4-Run the unit tests:
flutter test

