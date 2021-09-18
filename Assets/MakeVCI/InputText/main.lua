local rod = vci.assets.GetTransform("rod")

--Textオブジェクトを取得しておく
local texts = {}
texts[0] = "Text0"
texts[1] = "Text1"
texts[2] = "Text2"

local hiragana = {}
hiragana[0] = "あいうえお"
hiragana[#hiragana + 1] = "かきくけこ"
hiragana[#hiragana + 1] = "さしすせそ"
hiragana[#hiragana + 1] = "たちつてと"
hiragana[#hiragana + 1] = "なにぬねの"
hiragana[#hiragana + 1] = "はひふへほ"
hiragana[#hiragana + 1] = "まみむめも"
hiragana[#hiragana + 1] = "やゆよ"
hiragana[#hiragana + 1] = "わをん"


--入力結果を表示するテキスト
local input_text = ""

function onUse(use)
    if rod.IsAttached then
        print("rodを脱着")
        rod.DetachFromAvatar()
    else
        print("rodを装着")
        rod.AttachToAvatar()
    end
end

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

function update()
    -- キーの状態がVector3でsxisに格納されます
    --local axis = vci.me.GetAxisInput()

    local rod_rotation = rod.GetRotation()

    -- コンソールに表示    
    --print(" axis : "..tostring(axis))
    print(" rod : "..tostring(rod_rotation))
end

vci.StartCoroutine(
    coroutine.create(
        function()
            while true do
                local isAttached = rod.IsAttached
                if isAttached then
                    print("装着しています")
                else
                    print("装着していません")
                end
                sleep(1)
            end
        end
    )
)

function sleep(sec)
    local t0 = os.time() + sec
    while os.time() < t0 do
        coroutine.yield()
    end
end