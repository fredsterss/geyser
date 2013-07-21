chrome.browserAction.onClicked.addListener (tab) =>
  geyser = new Geyser()
  geyser.savePage()