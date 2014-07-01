## McDowell Sonoran Conservancy Web Site

### Running the application
Things to note for running the application:
* Currently you need MySQL running and a database named "mscmsc" created for the development environment. This is not necessary for the test environment, which is configured to use in-memory H2.
* There are config properties in an external file that isn't in the repository. You will need this file for the application to run properly.
* Parts of the application use the Spring Security plugin's secure channel, so you need to run the application with the `-https` argument: `grails run-app -https`
* The application makes use of the "simple-cms" project. Do not point to the simple-cms project that is located at the root of this repository (TODO: can we remove this?). Instead you should use the version of the project that is in its own repository (TODO: link to it).