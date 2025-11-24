# ABN Amro Assignment

The changes to the Wikipedia app can be seen [here](https://github.com/RRUIZ5/wikipedia-ios/tree/assignment)

Note: There is an issue with the Wikipedia app where the app needs to already be in the `Places` tab before navigating to it from the assignment app,
otherwise it crashes.

## Assignment app

The assignment app uses a `TabView` with two tabs.
The first one is `Recommended locations` which is the json list downloaded through a network request. Tapping a row navigates to Wikipedia.

The second one is `Custom location` where a marker on the map needs to be set in order to then be able to navigate to the Wikipedia app.

As requested, this app was built using SwiftUI, I also took the opportunity to experiment with approachable concurrency.
I added a couple of unit tests and made a tiny improvement in accessibility by updating the text that voice over reads for a location that has no name.

Looking forward to hearing the feedback.
