command: "date +\"%l:%M %_p\""

refreshFrequency: 10000 # ms

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #458588
  font: 9px Hack
  right: 10px
  top: 7px
"""
