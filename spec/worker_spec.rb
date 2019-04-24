require 'spec_helper'

describe 'perform push to queue for any worker' do

  class Klass
    include Sidekiq::Worker

    def perform(attributes)
      puts attributes
    end
  end

  it 'should add utf8 characters to the queue' do
    test = "<i>[Repost]</i> \xE2\x86\xBB button!</b>"
    expect {
      Klass.perform_async(test)
    }.not_to raise_error

    test_attributes = { test: test }
    expect {
      Klass.perform_async(test_attributes)
    }.not_to raise_error

    test_collection = [{ test: test }]
    expect {
      Klass.perform_async(test_collection)
    }.not_to raise_error
  end

  it 'production example' do
    test = "{\"class\":\"Aggregator::Workers::NodeWorker\",\"args\":[\"CAAHHZBahuow0BAInebmOqjxa55Rcv12PQW14zX30DxCF3GyTu8EVMPMyoTWbSZC1kIG6RLngnfSd9WvUxYZBvbm9aHdMHt6jMSp6yysqs65e1g5YadBGdWECkq105i1daaSTLOpZAhRCumJB328vNTZAuWSxccVod50WdSPZATY3qGTRLSZAW4wd0HhKwZCIQ25rXR0UK3ohmwZDZD\",\"1264937113\",[{\"id\":\"1264937113_10207095486806626\",\"name\":\"Miles Kane - Rearrange\",\"picture\":\"https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCzqXkfcF_Px05H&w=130&h=130&url=http%3A%2F%2Fi.ytimg.com%2Fvi%2F2SV422fSYE4%2Fhqdefault.jpg&cfs=1&sx=0&sy=0&sw=360&sh=360\",\"description\":\"Miles Kane's official music video for 'Rearrange'. Click to listen to Miles Kane on Spotify: http://smarturl.it/MilesKaneSpotify?IQid=MKR As featured on Colo...\",\"link\":\"https://www.youtube.com/attribution_link?a=iuwjsD1zJ6A&u=%2Fwatch%3Fv%3D2SV422fSYE4%26feature%3Dshare\",\"from\":{\"name\":\"Alexander Korsak\",\"id\":\"1264937113\"},\"created_time\":\"2015-08-29T20:18:09+0000\",\"application\":{\"category\":\"Utilities\",\"link\":\"http://www.youtube.com/?feature=fbr\",\"name\":\"YouTube\",\"namespace\":\"yt-fb-app\",\"id\":\"87741124305\"},\"likes\":{\"data\":[],\"summary\":{\"total_count\":0}},\"comments\":{\"data\":[],\"summary\":{\"order\":\"chronological\",\"total_count\":0}}},{\"id\":\"1264937113_10207089878266416\",\"name\":\"Jack Sparrow (feat. Michael Bolton)\",\"picture\":\"https://fbexternal-a.akamaihd.net/safe_image.php?d=AQC383FpXuRulSgZ&w=130&h=130&url=http%3A%2F%2Fi.ytimg.com%2Fvi%2FGI6CfKcMhjY%2Fhqdefault.jpg&cfs=1\",\"description\":\"Buy at iTunes: http://goo.gl/zv4o9. New album on sale now! http://turtleneckandchain.com\",\"link\":\"https://www.youtube.com/attribution_link?a=28znK6hWMJ8&u=%2Fwatch%3Fv%3DGI6CfKcMhjY%26feature%3Dshare\",\"from\":{\"name\":\"Alexander Korsak\",\"id\":\"1264937113\"},\"created_time\":\"2015-08-28T21:22:32+0000\",\"application\":{\"category\":\"Utilities\",\"link\":\"http://www.youtube.com/?feature=fbr\",\"name\":\"YouTube\",\"namespace\":\"yt-fb-app\",\"id\":\"87741124305\"},\"likes\":{\"data\":[{\"id\":\"834791393201302\",\"name\":\"Natallia Arkhipova\"}],\"paging\":{\"cursors\":{\"after\":\"ODM0NzkxMzkzMjAxMzAy\",\"before\":\"ODM0NzkxMzkzMjAxMzAy\"}},\"summary\":{\"total_count\":1}},\"comments\":{\"data\":[],\"summary\":{\"order\":\"chronological\",\"total_count\":0}}},{\"id\":\"1264937113_10207089134287817\",\"name\":\"1 HOUR of Best Female Vocal Dubstep Mix July 2015 | Dubstep Remix 2015\",\"picture\":\"https://fbexternal-a.akamaihd.net/safe_image.php?d=AQAxc4suo9APcfiL&w=130&h=130&url=http%3A%2F%2Fi.ytimg.com%2Fvi%2FXw-eiYT7B-U%2Fhqdefault.jpg&cfs=1&sx=120&sy=0&sw=360&sh=360\",\"description\":\"I hope you guys enjoyed this mix. If you did, be sure to leave a like and subscribe for more Perfect Music! Tracklist: 0:00 - Echos - The Haze 4:42 - Klaypex...\",\"link\":\"https://www.youtube.com/attribution_link?a=UKwS1f79XIE&u=%2Fwatch%3Fv%3DXw-eiYT7B-U%26feature%3Dshare\",\"from\":{\"name\":\"Alexander Korsak\",\"id\":\"1264937113\"},\"created_time\":\"2015-08-28T18:50:27+0000\",\"application\":{\"category\":\"Utilities\",\"link\":\"http://www.youtube.com/?feature=fbr\",\"name\":\"YouTube\",\"namespace\":\"yt-fb-app\",\"id\":\"87741124305\"},\"likes\":{\"data\":[{\"id\":\"10201972338495720\",\"name\":\"Polina Korsak\"}],\"paging\":{\"cursors\":{\"after\":\"MTAyMDE5NzIzMzg0OTU3MjA=\",\"before\":\"MTAyMDE5NzIzMzg0OTU3MjA=\"},\"next\":\"https://graph.facebook.com/v2.3/1264937113_10207089134287817/likes?limit=1&summary=true&access_token=CAAHHZBahuow0BAInebmOqjxa55Rcv12PQW14zX30DxCF3GyTu8EVMPMyoTWbSZC1kIG6RLngnfSd9WvUxYZBvbm9aHdMHt6jMSp6yysqs65e1g5YadBGdWECkq105i1daaSTLOpZAhRCumJB328vNTZAuWSxccVod50WdSPZATY3qGTRLSZAW4wd0HhKwZCIQ25rXR0UK3ohmwZDZD&after=MTAyMDE5NzIzMzg0OTU3MjA%3D\"},\"summary\":{\"total_count\":2}},\"comments\":{\"data\":[],\"summary\":{\"order\":\"chronological\",\"total_count\":0}}},{\"id\":\"1264937113_10207088011979760\",\"name\":\"2 HOURS of Best Female Vocal Dubstep Mix July 2015 | Dubstep Remix 2015\",\"picture\":\"https://fbexternal-a.akamaihd.net/safe_image.php?d=AQDiQvyPENBeE_Mg&w=130&h=130&url=http%3A%2F%2Fi.ytimg.com%2Fvi%2FmGdFi5gReHY%2Fhqdefault.jpg&cfs=1&sx=64&sy=0&sw=360&sh=360\",\"description\":\"I hope you enjoyed this mix! If you did, please leave a like and subscribe for more Perfect Music. Tracklist: 0:00 SirensCeol - 405 (ft. Aloma Steele, Alexa ...\",\"link\":\"https://www.youtube.com/attribution_link?a=5Hr4beZFn7M&u=%2Fwatch%3Fv%3DmGdFi5gReHY%26feature%3Dshare\",\"from\":{\"name\":\"Alexander Korsak\",\"id\":\"1264937113\"},\"created_time\":\"2015-08-28T15:37:01+0000\",\"application\":{\"category\":\"Utilities\",\"link\":\"http://www.youtube.com/?feature=fbr\",\"name\":\"YouTube\",\"namespace\":\"yt-fb-app\",\"id\":\"87741124305\"},\"likes\":{\"data\":[],\"summary\":{\"total_count\":0}},\"comments\":{\"data\":[],\"summary\":{\"order\":\"chronological\",\"total_count\":0}}},{\"id\":\"1264937113_10207086242935535\",\"name\":\"Three Days Grace - Never Too Late\",\"picture\":\"https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCgilYhJ5ZusDaN&w=130&h=130&url=http%3A%2F%2Fi.ytimg.com%2Fvi%2FlL2ZwXj1tXM%2Fmaxresdefault.jpg&cfs=1\",\"description\":\"Music video by Three Days Grace performing Never Too Late. (C) 2007 Zomba Recording, LLC\",\"link\":\"https://www.youtube.com/attribution_link?a=xGxkCqMaPbg&u=%2Fwatch%3Fv%3DlL2ZwXj1tXM%26feature%3Dshare\",\"from\":{\"name\":\"Alexander Korsak\",\"id\":\"1264937113\"},\"created_time\":\"2015-08-28T08:02:15+0000\",\"application\":{\"category\":\"Utilities\",\"link\":\"http://www.youtube.com/?feature=fbr\",\"name\":\"YouTube\",\"namespace\":\"yt-fb-app\",\"id\":\"87741124305\"},\"likes\":{\"data\":[{\"id\":\"834791393201302\",\"name\":\"Natallia Arkhipova\"}],\"paging\":{\"cursors\":{\"after\":\"ODM0NzkxMzkzMjAxMzAy\",\"before\":\"ODM0NzkxMzkzMjAxMzAy\"}},\"summary\":{\"total_count\":1}},\"comments\":{\"data\":[],\"summary\":{\"order\":\"chronological\",\"total_count\":0}}},{\"id\":\"1264937113_10207017739142983\",\"from\":{\"name\":\"Alexander Korsak\",\"id\":\"1264937113\"},\"created_time\":\"2015-08-18T14:31:47+0000\",\"application\":{\"category\":\"Utilities\",\"link\":\"http://www.youtube.com/?feature=fbr\",\"name\":\"YouTube\",\"namespace\":\"yt-fb-app\",\"id\":\"87741124305\"},\"likes\":{\"data\":[],\"summary\":{\"total_count\":0}},\"comments\":{\"data\":[],\"summary\":{\"order\":\"chronological\",\"total_count\":0}}},{\"id\":\"1264937113_10206841334852986\",\"name\":\"Alexander\",\"picture\":\"https://scontent.xx.fbcdn.net/hphotos-xfa1/v/t1.0-9/s130x130/306745_4250838790276_1909109218_n.jpg?oh=dd3e8ff18c5aed53f3c0abb254fcecac&oe=56649534\",\"link\":\"https://www.facebook.com/photo.php?fbid=4250838790276&set=a.3933811904802.2170367.1264937113&type=1\",\"from\":{\"name\":\"Alexander Korsak\",\"id\":\"1264937113\"},\"created_time\":\"2015-07-28T08:34:32+0000\",\"likes\":{\"data\":[{\"id\":\"292250190938286\",\"name\":\"Valerie Mikhalevich\"}],\"paging\":{\"cursors\":{\"after\":\"MjkyMjUwMTkwOTM4Mjg2\",\"before\":\"MjkyMjUwMTkwOTM4Mjg2\"},\"next\":\"https://graph.facebook.com/v2.3/1264937113_10206841334852986/likes?limit=1&summary=true&access_token=CAAHHZBahuow0BAInebmOqjxa55Rcv12PQW14zX30DxCF3GyTu8EVMPMyoTWbSZC1kIG6RLngnfSd9WvUxYZBvbm9aHdMHt6jMSp6yysqs65e1g5YadBGdWECkq105i1daaSTLOpZAhRCumJB328vNTZAuWSxccVod50WdSPZATY3qGTRLSZAW4wd0HhKwZCIQ25rXR0UK3ohmwZDZD&after=MjkyMjUwMTkwOTM4Mjg2\"},\"summary\":{\"total_count\":5}},\"comments\":{\"data\":[{\"id\":\"10206841334852986_10206843852875935\",\"from\":{\"name\":\"Anna Korsak\",\"id\":\"1025302206\"},\"message\":\"\xD0\x9E\xD1\x85 \xD0\xBA\xD0\xB0\xD0\xBA\xD0\xBE\xD0\xB9 \xD1\x8F \xD1\x85\xD1\x83\xD0\xB4\xD1\x8B\xD1\x88 \xD1\x82\xD1\x83\xD1\x82\",\"can_remove\":true,\"created_time\":\"2015-07-28T15:41:53+0000\",\"like_count\":0,\"user_likes\":false}],\"paging\":{\"cursors\":{\"after\":\"WTI5dGJXVnVkRjlqZFhKemIzSTZNVEF5TURZNE5ETTROVEk0TnpVNU16VTZNVFF6T0RBNU9ERXhNdz09\",\"before\":\"WTI5dGJXVnVkRjlqZFhKemIzSTZNVEF5TURZNE5ETTROVEk0TnpVNU16VTZNVFF6T0RBNU9ERXhNdz09\"}},\"summary\":{\"order\":\"chronological\",\"total_count\":1}}},{\"id\":\"1025302206_10205897116360126\",\"picture\":\"https://fbcdn-photos-b-a.akamaihd.net/hphotos-ak-xfp1/v/t1.0-0/q85/s130x130/11694833_10205897116360126_3053518648697909609_n.jpg?oh=135f585711339739df07f242b18b2010&oe=567D00A9&__gda__=1449337946_69ffe3f2a49798c60bde90b8e4701a5d\",\"link\":\"https://www.facebook.com/photo.php?fbid=10205897116360126&set=p.10205897116360126&type=1\",\"from\":{\"name\":\"Anna Korsak\",\"id\":\"1025302206\"},\"created_time\":\"2015-07-17T12:50:00+0000\",\"likes\":{\"data\":[],\"summary\":{\"total_count\":0}},\"comments\":{\"data\":[{\"id\":\"10205897116360126_10205900868533928\",\"from\":{\"name\":\"Natallia Arkhipova\",\"id\":\"834791393201302\"},\"message\":\"\xD0\xBD\xD0\xBE\xD1\x80\xD0\xB2\xD0\xB5\xD0\xB6\xD1\x81\xD0\xBA\xD0\xB8\xD0\xB9 \xD0\xBB\xD0\xBE\xD1\x81\xD1\x8C?\",\"can_remove\":false,\"created_time\":\"2015-07-30T12:38:41+0000\",\"like_count\":1,\"user_likes\":true}],\"paging\":{\"cursors\":{\"after\":\"WTI5dGJXVnVkRjlqZFhKemIzSTZNVEF5TURVNU1EQTROamcxTXpNNU1qZzZNVFF6T0RJMU9Ua3lNUT09\",\"before\":\"WTI5dGJXVnVkRjlqZFhKemIzSTZNVEF5TURVNU1EQTROamcxTXpNNU1qZzZNVFF6T0RJMU9Ua3lNUT09\"}},\"summary\":{\"order\":\"chronological\",\"total_count\":1}}},{\"id\":\"1264937113_10206714314277551\",\"name\":\"Skylight\",\"picture\":\"https://fbexternal-a.akamaihd.net/safe_image.php?d=AQAUpfP7e6D0p-ht&w=130&h=130&url=https%3A%2F%2Fd1xmotl1g5cxcm.cloudfront.net%2Fproduction%2Fassets%2Fclose-button-f1c9dec6a12b07710ba03e36fa07bfb1.png&cfs=1\",\"description\":\"Ditch complicated plans and pushy salespeople. With Skylight, you only pay for what you use. Pricing starts at $20 for the first million requests, with automatic discounts for high-volume customers. Simple.\",\"link\":\"https://www.skylight.io/r/apJHiKbfjE3D\",\"from\":{\"name\":\"Alexander Korsak\",\"id\":\"1264937113\"},\"created_time\":\"2015-07-10T09:01:36+0000\",\"likes\":{\"data\":[],\"summary\":{\"total_count\":0}},\"comments\":{\"data\":[],\"summary\":{\"order\":\"chronological\",\"total_count\":0}}},{\"id\":\"1264937113_10206701611239983\",\"from\":{\"name\":\"Alexander Korsak\",\"id\":\"1264937113\"},\"created_time\":\"2015-07-08T10:21:03+0000\",\"application\":{\"category\":\"Entertainment\",\"link\":\"https://www.mixcloud.com/\",\"name\":\"Mixcloud\",\"namespace\":\"mixcloud\",\"id\":\"49631911630\"},\"likes\":{\"data\":[],\"summary\":{\"total_count\":0}},\"comments\":{\"data\":[],\"summary\":{\"order\":\"chronological\",\"total_count\":0}}}]],\"retry\":2,\"queue\":\"timelines\",\"unique\":true,\"jid\":\"0fb32c71a5b3f689bb2fe5d5\",\"created_at\":1440881551.4436812,\"enqueued_at\":1440881551.443803}"

    expect {
      Klass.perform_async(JSON.parse(test))
    }.not_to raise_error
  end
end
