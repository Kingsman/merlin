path = require 'path'
{msgVariables, stringElseRandomKey} = require path.join '..', 'node_modules', 'hubot-tellbot', 'lib', 'common.coffee'

class tell
  constructor: (@interaction) ->
  process: (msg) =>
    messageType = @interaction.messageType?.toLowerCase() or 'tell'
    switch messageType
      when 'action', 'emote'
        messageType = 'emote'
      else
        messageType = 'send'

    message = stringElseRandomKey @interaction.message

    message = msgVariables message, msg
    msg[messageType] message

module.exports = tell
