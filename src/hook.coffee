chrome.extension.sendRequest message:"requestConfig", (response) ->
  app = new Geyser(el: $('#main'))