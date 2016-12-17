# Description
#   A hubot script that does the things
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot hello - <what the respond trigger does>
#   orly - <what the hear trigger does>
#
# Author:
#   aki

module.exports = (robot) ->

#redisに保存するためのキー
  key = 'jikanwari'

  #明日の時間割を入力
  robot.respond /明日の([1-5])限は(.*)/, (msg) ->
    gen = msg.match[1]
    jugyo = (robot.brain.get key) or {}
    jugyo[gen] = msg.match[2]

    robot.brain.set key, jugyo

#時間割を返答
  robot.respond /明日の([1-5])限は何？/, (msg) ->
    whgen = msg.match[1]
    jugyo = (robot.brain.get key) or {}
    msg.send "#{jugyo[whgen]}"
