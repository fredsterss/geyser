class @Geyser

  firebaseRef: 'https://geyser.firebaseio.com'

  constructor: (@options) ->
    @reader = new FileReader()
    @reader.onload = (file) =>
      dt = new Date().getTime()
      f = new Firebase("#{@firebaseRef}/users/fred/captures/#{dt}")
      f.set file.target.result, =>
        console.log 'saved to firebase'

    @savePage()

  savePage: ->
    chrome.tabs.getSelected null, (tab) =>
      chrome.pageCapture.saveAsMHTML tabId: tab.id,
        (mhtml) =>
          @reader.readAsDataURL(mhtml)


chrome.browserAction.onClicked.addListener (tab) =>
  new Geyser()