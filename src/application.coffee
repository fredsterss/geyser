class @Geyser extends Backbone.View

  firebaseRef: 'https://geyser.firebaseio.com/'

  initialize: (@options) ->
    @reader = new FileReader()
    @reader.onload = (file) =>
      f = new Firebase(@firebaseRef + 'users/fred/captures/filePayload')
      f.set file.target.result, =>
        console.log 'saved to firebase'

    @savePage()
      
  savePage: ->
    chrome.tabs.getSelected null, (tab) =>
      chrome.pageCapture.saveAsMHTML tabId: tab.id,
        (mhtml) =>
          @reader.readAsDataURL(mhtml)