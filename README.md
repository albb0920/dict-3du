# dict-3du 說明文件

## 這是什麼?

這是目前 host 在 http://api.3du.tw 上的教育部字典 API

## 如何安裝

1. 安裝 rails 環境
       目前 api.3du.tw 上面是用 nginx + unicorn，不過其實怎麼弄都 OK

2. 下載這份 source code
        git clone https://github.com/albb0920/dict-3du.git

3. 準備環境

        cd dict-3du
        bundle install
        rake db:schema:load
        rake db:seed

4. 完成，使用方式詳見 http://3du.tw

## 問題回報 & 協助開發

問題回報請直接在 GitHub 開 issue<br>
如果想送 patch (應該沒人吧ww)，請先 fork，建立一個新的 branch 後，發 Pull Request

## 授權條款

採用 MIT 授權，條款請見 [LICENSE](https://github.com/albb0920/dict-3du/blob/master/LICENSE)

## 替代方案

目前有很多其他的 API Server，API 基本上跟 3du.tw 的 spec 差不多，但各有自己的特異功能，客倌也可以參考看看

* https://github.com/g0v/moedict.tw<br>
  由 au 大大實作，以靜態的 JSON 檔案實作<br>
  目前 host 在 http://www.moedict.tw/uni/字

* https://github.com/pct/moedict-server<br>
  由 pct 大大實作，採用 Node.js

* https://github.com/viirya/moedict-web<br>
  由 viirya 大大實作，採用 Node.js<br>
  目前 host 在 http://moedict-viirya.dotcloud.com/q/%E5%AD%97


完整的列表請參考 [3du hackpad](http://hackpad.com/3du.tw-UJJETE2igdi)
