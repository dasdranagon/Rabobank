# Assessment

Create an app that is capable of visualizing the attached csv file on the screen. parse it on a background thread.

## About Application

This application was developed as a test assignment for Rabobank and aims to show my development skills, knowledge of the architecture approaches and design patterns.  

## Focus points:

 * Clean architecture
 * Code quality
 * Ability to test
 * Ability to support

# Architecture

This is an updated simplified implementation. Unlike the old version ( see [v1.0](https://github.com/dasdranagon/Rabobank/tree/v1.0)) which was using **VIPER** architecture, current version uses **MVP**, which is more suitable for single view application. 
This changes make a bit difficult to extend project and add for instance new screen, but reduces dramatically boilerplate code and helps reviewer to get insight on used approaches.

## Project structure

Project structure reflects the used architecture approach.
In the root of the project, there are three folders: **Model**, **View** and **Presenter** (**MVP**).  AppDelegate and ListAssembly (file with all dependencies) files also located in the root folder. 

## Unit Testing

For the unit testing purpose in this project was implemented BDD approach using [Quick/Nimble](<https://github.com/Quick/Nimble>) framework. I have chosen this technique because it provides a human-readable code and clear test file structure. 

# Author

**Dennis Skokov**  
<tel:+31633319874>  
<dennis@splendo.com>  
