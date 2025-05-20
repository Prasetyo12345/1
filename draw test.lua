disDrawAcc()

local paint = newPaint()
paint:setColor("#FF0000")  -- merah
paint:setTextSize(43)
paint:setStyle("填充")
paint:setAntiAlias(true)

local view = newView()

function onDraw(canvas)
    local wh = getWH()
    local width = wh["width"]

    local text = "Waktu: " .. os.date("%H:%M:%S")

    local x = (width / 2) - 170
    local y = 100

    canvas:drawText(text, x, y, paint)
end

view:show(onDraw, 60)

-- loop supaya teks terus update dan muncul selama 1 menit (atau sesuaikan)
local duration = 60 -- detik
local start = os.time()

while os.time() - start < duration do
    gg.sleep(1000) -- refresh tiap 1 detik
    view:invalidate() -- refresh view supaya onDraw dipanggil ulang
end

view:close()q
