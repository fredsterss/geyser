
# TODO: show iMessage-like progress bar across top of page?
# TODO: right click to show designs

class @Geyser
  firebaseRef: 'https://geyser.firebaseio.com'

  savePage: ->
    @getFile()
    @getUrl (tab) =>
      chrome.pageCapture.saveAsMHTML tabId: tab.id,
        (mhtml) =>
          @reader.readAsDataURL(mhtml)

  getFile: ->
    @reader = new FileReader()
    @reader.onload = (file) =>
      dt = new Date().getTime()
      f = new Firebase("#{@firebaseRef}/users/fred/captures/#{dt}")
      @setIconState('pending')

      @getUrl (tab) =>
        f.set { file: file.target.result, url: tab.url }, =>
          @setIconState('success')
          setTimeout => 
            @setIconState('normal')
          , 10000

  setIconState: (state) ->
    chrome.browserAction.setIcon({path: "assets/sandwich-128-#{state}.png"})

  getUrl: (callback) ->
    chrome.tabs.query {active: true, lastFocusedWindow: true}, (tabs) =>
      callback(tabs[0])