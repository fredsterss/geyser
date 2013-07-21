class @GeyserSite
  firebaseRef: 'https://geyser.firebaseio.com'

  constructor: ->
    f = new Firebase("#{@firebaseRef}/users/fred/captures/") 
    @reader = new FileReader()
    console.log 'HAI'

new GeyserSite