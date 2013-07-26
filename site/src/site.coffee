class @GeyserSite
  firebaseRef: 'https://geyser.firebaseio.com'

  constructor: ->
    parser = new MhtmlParser()
    f = new Firebase("#{@firebaseRef}/users/fred/captures/")
    f.once 'value', (snapshot) =>
      if snapshot.val()?
        i = 0
        for key, val of snapshot.val()
          unless i > 0
            $('#main').html parser.parse(val.file)
          i++
      
      else
        console.log '#fail'

    @reader = new FileReader()

new GeyserSite