# FetchRewards

This repo contains my take-home project for the iOS Developer / Intern position at Fetch Rewards.

The app is ready to go. I didn't use any external dependencies. It meets MVP, except for saving favorites.

<img width="300" alt="App screenshot" src="https://user-images.githubusercontent.com/438307/114626562-c163b100-9c68-11eb-9185-a68aac5170a8.png">


## Notes
* The `clientID` & `clientSecret` are stored in `Secrets.swift`, whose filename is in `.gitignore` to prevent it reaching GitHub
* I used extensions where it made sense, for DateFormatters and UIAlertController
* Also an extension `loadNetworkImage()` on `UIImageView` to load and cache network images
  * (Copied from one of my other projects. Heavily adapted/simplified by me at the time from StackOverflow)
* Custom decoding via Codable, which was challenging due to the deep nesting of the image URL
* Used XIB for TableView cell, since I've found it challenging to get dynamic cell height working from the storyboard

## Favorites

There are many ways to store the favorites, but I was planning on encoding a list of `Event`s to JSON and save it to the disk whenever the user added or removed a favorite event. This would enable the user to view their favorites even if offline, since the entire `Event` would be saved, not just the ID.

---

I look forward to hearing from you! Let me know if you have any comments or concerns:
[chad@chadparker.com](mailto:chad@chadparker.com)
