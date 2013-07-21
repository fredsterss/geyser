
# TODO: change icon status when running
# TODO: show iMessage-like progress bar across top of page?

class @Geyser
  firebaseRef: 'https://geyser.firebaseio.com'

  savePage: ->
    @getFile()

    chrome.tabs.getSelected null, (tab) =>
      chrome.pageCapture.saveAsMHTML tabId: tab.id,
        (mhtml) =>
          @reader.readAsDataURL(mhtml)

  getFile: ->
    @reader = new FileReader()
    @reader.onload = (file) =>
      dt = new Date().getTime()
      f = new Firebase("#{@firebaseRef}/users/fred/captures/#{dt}")
      @setIconState('pending')
      f.set file.target.result, =>
        @setIconState('success')

        setTimeout =>
          @setIconState('normal')
        , 10000

  setIconState: (state) ->
    chrome.browserAction.setIcon({path: "assets/sandwich-128-#{state}.png"})

