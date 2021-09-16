local rot = vci.assets.GetTransform("rod")

--Textオブジェクトを取得しておく
local texts = {}
texts["Text1"] = "A"
texts["Text2"] = "B"
texts["Text3"] = "C"

--入力結果を表示するテキスト
local input_text = ""

function onTriggerEnter(item, hit)
    print("Collision Enter")
    print(string.format("%s <= %s", item, hit))

    print(texts[hit])

    --接触オブジェクトと同名のテキストオブジェクトを検索
    if(texts[hit]) then
        --存在すれば入力結果にテキストを追加
        input_text = input_text .. texts[hit]
        vci.assets.SetText("InputText", input_text)
    end
end