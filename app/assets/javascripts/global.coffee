@ready = ->
  false

$(document).ready(ready)
$(document)
  .on('page:load', ready)
