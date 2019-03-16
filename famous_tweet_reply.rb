# -*- coding: utf-8 -*-
Plugin.create(:famous_tweet_reply) do
  command(:famous_tweet_reply,
          name: "このツイートめっちゃ伸びてる",
          condition: Plugin::Command[:CanReplyAll],
          visible: true,
          role: :timeline ) do |m|
    m.messages.map do |msg|
      famous_tweet_reply(msg.message)
    end
  end

  def famous_tweet_reply(message)
    str = [
      "いいねとリツイートやばw",
      "めっちゃリツイート来てんじゃん笑った笑笑",
      "おまえのツイートめっちゃ伸びてるじゃんwwwwもう有名人やなwwwww",
      "RT伸びすぎｗｗｗｗｗｗ有名人じゃんｗｗｗｗｗｗｗｗ",
      "めっちゃいいねついてるｗｗｗｗどこまで伸びるん？ｗｗｗｗ",
      "ツイート伸びすぎワロタｗｗｗｗ",
      "めっちゃリツイートされてるやん！有名人やな！笑",
      "RTやばいえぐいな！！笑",
      "お前有名人じゃんwwwwwwwwwwwwww"
    ]
    id = message.user.idname
    msg = "@#{id} #{str.sample}"
    world, = Plugin.filtering(:world_current, nil)
    if world.slug.include?("worldon")
      msg = msg.gsub(/リツイート/, "ブースト")
      msg = msg.gsub(/ツイート/, "トゥート")
      msg = msg.gsub(/いいね/, "ふぁぼ")
      msg = msg.gsub(/RT/, "BT")
    end
    compose(world, message, body: msg)
  end

end
