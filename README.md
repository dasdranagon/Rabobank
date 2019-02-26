# Assessment

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
**Screens** contains folders with specific screens. Each screen folder has the same structure. It contains *Assembly* file which defines all dependencies within a specific screen and two folders: **AppLogic** and **UI**.
**UI** folder contains View, Presenter, and Router implementation, **AppLogic** contains interactor and services.

## About **Router**

**Router** is an important part of **VIPER** architecture and other implements as a separate entity. In current implementation I have split **Router** in two parts with different responsibilities: **Navigator** and **Wireframe** (see Common/Routing folder).  
**Navigator** is responsible for all types of navigation, but it doesn't know anything about navigation between concrete screens.
**Wireframe** is responsible for navigation on concrete screen. It implements methods *activate* and *deactivate* which show or dismiss the concrete screen. It also may contain references to other wireframes and activate it by request from *Presenter*.  
In a current implementation, there is no navigation between screens so **ListWireframe** is just type alias for BaseWireframe which has a default implementation of *activate* and *deactivate* methods. The presenter doesn't have a reference to Wireframe because it doesn't initiate any navigation. 
In case if navigation to another screen should be implemented, ListWireframe should inherit BaseWireframe and contain a reference to the wireframe of the target screen. ListPresenter should contain the reference to Wireframe and initiate navigation if needed.

## Unit Testing

For the unit testing purpose in this project was implemented BDD approach using [Quick/Nimble](<https://github.com/Quick/Nimble>) framework. I have chosen this technique because it provides a human-readable code and clear test file structure. 

# Author

**Dennis Skokov**  
<tel:+31633319874>  
<dennis@splendo.com>  
