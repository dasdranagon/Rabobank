## Assessment

Create an app that is capable of visualizing the attached csv file on the screen. parse it on a background thread.

## About Application

This application was developed as a test assignment for Rabobank and aims to show my development skills, knowledge of the architecture approaches and ability to develop a big enterprise project.  
Although such complicated enterprise architecture is not suitable for small one screen application, I developed it with idea of possible extension and as example how in my opinion proper implementation of clean architecture should look like.

## Focus points:
 * Clean architecture
 * Code quality
 * Ability to test
 * Ability to extend
 * Ability to support

# Architecture
Although there are a number of different architectural approaches I decide to use **VIPER** because it provides the best testability and separation of objects with different functionality (single responsibility principle). Of course, it is always subject for discussion which architecture to choose and it depends on concrete project and goals you want to achieve. Important is to follow the same approach in the whole application.

## Project structure
Project structure reflects the used architecture approach.
In the root of the project, there are two folders: **Common** and **Screens**.  
**Common** project contains all solution which could be used through the whole application.
**Screens** contains folders with specific screens. Each screen folder has the same structure. It contains *<Screen name>Assembly* file which defines all dependencies within a specific screen and two folders: **AppLogic** and **UI**.
**UI** folder contains View, Presenter, and Router implementation, **AppLogic** contains interactor and services.

## Unit Testing

# Author

**Dennis Skokov**  
<tel:+31633319874>  
<dennis@splendo.com>  
