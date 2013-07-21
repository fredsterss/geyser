class @GeyserSite
  firebaseRef: 'https://geyser.firebaseio.com'

  constructor: ->
    parser = new @MhtmlParser()
    f = new Firebase("#{@firebaseRef}/users/fred/captures/")
    f.on 'value', (snapshot) =>
      if snapshot.val()?
        for key, val of snapshot.val()
          parser.parse val.file
      
      else
        console.log '#fail'

    @reader = new FileReader()
    console.log 'HAI'

new GeyserSite