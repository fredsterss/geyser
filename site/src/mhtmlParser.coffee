class @MhtmlParser

  parse: (file) ->
    file = file.slice(13)
    file = atob(file)

    # Split out header into JSON
    header = {}
    header.end = file.indexOf('"', file.indexOf('NextPart'))
    header.raw = file.slice(0, header.end + 3)

    for line in header.raw.split('\n')
      if line.indexOf(':') isnt -1
        l = line.split(': ')
        header[l[0]] = l[1]
      else if line.indexOf('="') isnt -1
        l = line.split('="')
        header[l[0]] = l[1].substring(0, l[1].length - 3)

    console.log header

    # console.log end
    # console.log file.substr(0,end)
    file

    # file.split('_NextPart_')
    # file.split("\n")