command: "echo \"[\"$(/usr/local/bin/chunkc tiling::query --desktop mode)\"] \"
          $(/usr/local/bin/chunkc tiling::query --window tag) | awk 'length > 90{$0=substr($0,0,90)\"...\"}1'"

refreshFrequency: 1000 # ms

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #D6E7EE
  font: 9px Hack
  height: 16px
  left: 10px
  overflow: hidden
  text-overflow: ellipsis
  top: 7px
  width: 500px
"""
