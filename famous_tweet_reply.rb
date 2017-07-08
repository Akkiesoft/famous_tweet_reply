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
    id=message.idname
    message.post(:message => "@#{id} #{str.sample}")
  end

end
