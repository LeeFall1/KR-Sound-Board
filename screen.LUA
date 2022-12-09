--[[ Spoon ]]--

--[[ Some dude named Bonusaben made this ]]--
--[[   Come visit the Underdun Arcade    ]]--



if not init then
    init = true
    
    rx,ry = getResolution()
    sinCounter = 0
    dt = getDeltaTime()
    
    cols = {
        {0.035,0.045,0.08},
        {1.00,1.00,1.00},
        {0.50,0.00,0.12},
        {0.01,0.33,0.50},
        {0.00,0.50,0.35}
    }
    
    --charList = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#¤%&"
    charList = "ABCČĆDĐEFGHIJKLMNOPQRSŠTUVWXYZŽabcčćdđefghijklmnopqrsštuvwxyzžАБВГҐДЂЕЁЄЖЗЅИІЇЙЈКЛЉМНЊОПРСТЋУЎФХЦЧЏШЩЪЫЬЭЮЯабвгґдђеёєжзѕиіїйјклљмнњопрстћуўфхцчџшщъыьэюяΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩαβγδεζηθικλμνξοπρστυφχψωĂÂÊÔƠƯăâêôơư1234567890‘?’“!”%#{@}&®©$€£¥¢"
    
    end --init

if not Letter then
    letter = {}
    letter.__index = letter
    
    function Letter(layer,parent,increment,char,font,pos,delay,life)
        local self = {}
        self.layer = layer or 1
        self.parent = parent or letters1
        self.increment = increment or ry/20
        self.char = char or ""
        self.font = font
        self.pos = pos or {0,0}
        self.delay = delay or 1
        self.life = life or 1
        self.dtCount = 0.0
        self.activated = false
        return setmetatable(self,letter)
        end
    
    function letter:update()
        setNextFillColor(self.layer,self.life,0.5+self.life,self.life,self.life)
        addText(self.layer,self.font,self.char,self.pos[1],self.pos[2])
        self.life = self.life -0.035
        
        if self.dtCount > self.delay and self.activated == false then
            self.parent[#self.parent+1] = Letter(self.layer,self.parent,self.increment,GetRandomChar(),self.font,{self.pos[1],self.pos[2]+self.increment},self.delay)
            self.dtCount = 0.0
            self.activated = true
            if math.random() > 0.8 then
                self.char = GetRandomChar()
                end
            else
            self.dtCount = self.dtCount + dt
            end
        
        if self.pos[2] > ry then
            self.pos[2] = 0
            end
        
        end
    
    function GetRandomChar()
        local r = math.random(#charList)
        local c = string.sub(charList,r,r)
        return c
        end
    
    end --Letter

setBackgroundColor(0,0.02,0)
l3 = createLayer()
l2 = createLayer()
l1 = createLayer()
font1 = loadFont("RobotoMono",14)
font2 = loadFont("RobotoMono",10)
font3 = loadFont("RobotoMono",7)

if not loaded then
    loaded = 1
    
    letters1 = {}
    letters2 = {}
    letters3 = {}
    
    cols1 = 68
    rows1 = 42
    
    cols2 = 98
    rows2 = 62
    
    cols3 = 148
    rows3 = 82
    
    logMessage("Creating chars")
    for i=1,cols1 do
        letters1[i] = Letter(l1,letters1,ry/rows1,GetRandomChar(),font1,{rx/cols1*i,ry/rows1*math.floor(math.random(rows1))},math.random()/12)
        end
    
    for i=1,cols2 do
        --letters2[i] = Letter(l2,letters2,ry/rows2,GetRandomChar(),font2,{rx/cols2*i,ry/rows2*math.floor(math.random(rows2))},math.random()/5)
        table.insert(letters2, Letter(l2,letters2,ry/rows2,GetRandomChar(),font2,{rx/cols2*i,ry/rows2*math.floor(math.random(rows2))},math.random()/10))
        table.insert(letters2, Letter(l2,letters2,ry/rows2,GetRandomChar(),font2,{rx/cols2*i,ry/rows2*math.floor(math.random(rows2))},math.random()/10))
        end
    
    for i=1,cols3 do
        --letters3[i] = Letter(l3,letters3,ry/rows3,GetRandomChar(),font3,{rx/cols3*i,ry/rows3*math.floor(math.random(rows3))},math.random()/3)
        table.insert(letters3,Letter(l3,letters3,ry/rows3,GetRandomChar(),font3,{rx/cols3*i,ry/rows3*math.floor(math.random(rows3))},math.random()/8))
        table.insert(letters3,Letter(l3,letters3,ry/rows3,GetRandomChar(),font3,{rx/cols3*i,ry/rows3*math.floor(math.random(rows3))},math.random()/8))
        --table.insert(letters3,Letter(l3,letters3,ry/rows3,GetRandomChar(),font3,{rx/cols3*i,ry/rows3*math.floor(math.random(rows3))},math.random()/8))
        --table.insert(letters3,Letter(l3,letters3,ry/rows3,GetRandomChar(),font3,{rx/cols3*i,ry/rows3*math.floor(math.random(rows3))},math.random()/8))
        end
    
    
    
    end




for i=#letters1,1,-1 do
    letters1[i]:update()
    if letters1[i].life <= 0 then
        table.remove(letters1,i)
        end
    end

for i=#letters2,1,-1 do
    letters2[i]:update()
    if letters2[i].life <= 0 then
        table.remove(letters2,i)
        end
    end

for i=#letters3,1,-1 do
    letters3[i]:update()
    if letters3[i].life <= 0 then
        table.remove(letters3,i)
        end
    end


sinCounter = sinCounter + 0.05
dt = getDeltaTime()
requestAnimationFrame(1)



--------------------------------------------------------------------------------





--[[----------------------------------------------------------------------------
-- Add the following section to a programming boards System.Update()
-- Link the screen unit and three lights to the programming board
-- Name the slots in the programming board respectively: screen, light0, light1, light2

local handlers = {}
handlers['Light 0'] = function() light0.toggle() end
handlers['Light 1'] = function() light1.toggle() end
handlers['Light 2'] = function() light2.toggle() end

local output = screen.getScriptOutput()
if #output > 0 then
    screen.clearScriptOutput()
    if handlers[output] then handlers[output]() end
end

--]]----------------------------------------------------------------------------
-- Screen render script below
--------------------------------------------------------------------------------

font = loadFont('Play-Bold', 18)
rx, ry = getResolution()
cx, cy = getCursor()
layer = createLayer()
click = getCursorPressed()

--------------------------------------------------------------------------------

if not Button then
    local mt = {}
    mt.__index = mt
    function Button (text, x, y)
        return setmetatable({
            text = text,
            x = x,
            y = y,
        }, mt)
    end

    function mt:draw ()
        local sx, sy = self:getSize()
        local x0 = self.x - sx/2
        local y0 = self.y - sy/2
        local x1 = x0 + sx
        local y1 = y0 + sy
        
        local r, g, b = 0.1, 0.4, 0.1
        if cx >= x0 and cx <= x1 and cy >= y0 and cy <= y1 then
            r, g, b = 1.0, 0.0, 0.4
            if click then setOutput(self.text) end
        end
        
        setNextShadow(layer, 64, r, g, b, 0.3)
        setNextFillColor(layer, 0.1, 0.1, 0.1, 1)
        setNextStrokeColor(layer, r, g, b, 1)
        setNextStrokeWidth(layer, 2)
        addBoxRounded(layer, self.x - sx/2, self.y - sy/2, sx, sy, 4)
        setNextFillColor(layer, 1, 1, 1, 1)
        setNextTextAlign(layer, AlignH_Center, AlignV_Middle)
        addText(layer, font, self.text, self.x, self.y)
    end

    function mt:getSize ()
        local sx, sy = getTextBounds(font, self.text)
        return sx + 32, sy + 16
    end

    function mt:setPos (x, y)
        self.x, self.y = x, y
    end
end

function drawFree (elems)
    for i, v in ipairs(elems) do v:draw() end
end

function drawListV (elems, x, y)
    for i, v in ipairs(elems) do
        local sx, sy = v:getSize()
        v:setPos(x, y)
        v:draw()
        y = y + sy + 4
    end
end

function drawUsage ()
    local font = loadFont('FiraMono', 28)
    setNextTextAlign(layer, AlignH_Center, AlignV_Top)
    addText(layer, font, "Activate board!", rx/2, ry - 32)
end

function drawCursor ()
    if cx < 0 then return end
    addLine(layer, cx - 12, cy - 12, cx + 12, cy + 12)
    addLine(layer, cx + 12, cy - 12, cx - 12, cy + 12)
end

--------------------------------------------------------------------------------

local buttons = {
    Button('Sound 1', 128, 50),
    Button('Sound 2', 128, 100),
    Button('Sound 3', 128, 150),
    Button('Sound 4', 128, 200),
    Button('Sound 5', 128, 250),
    Button('Sound 6', 128, 300),
    Button('Sound 7', 128, 350),
    Button('Sound 8', 128, 400),
    Button('Sound 9', 128, 450),
    Button('Sound 10', 128, 500),
    Button('Sound 11', 128, 550), 
    
    Button('Sound 12', 256, 50),
    Button('Sound 13', 256, 100),
    Button('Sound 14', 256, 150),
    Button('Sound 15', 256, 200),
    Button('Sound 16', 256, 250),
    Button('Sound 17', 256, 300),
    Button('Sound 18', 256, 350),
    Button('Sound 19', 256, 400),
    Button('Sound 20', 256, 450),
    Button('Sound 21', 256, 500),
    Button('Sound 22', 256, 550),
    
    Button('Sound 23', 384, 50),
    Button('Sound 24', 384, 100),
    Button('Sound 25', 384, 150),
    Button('Sound 26', 384, 200),
    Button('Sound 27', 384, 250),
    Button('Sound 28', 384, 300),
    Button('Sound 29', 384, 350),
    Button('Sound 30', 384, 400),
    Button('Sound 31', 384, 450),
    Button('Sound 32', 384, 500),
    Button('Sound 33', 384, 550),
    
    Button('Sound 34', 512, 50),
    Button('Sound 35', 512, 100),
    Button('Sound 36', 512, 150),
    Button('Sound 37', 512, 200),
    Button('Sound 38', 512, 250),
    Button('Sound 39', 512, 300),
    Button('Sound 40', 512, 350),
    Button('Sound 41', 512, 400),
    Button('Sound 42', 512, 450),
    Button('Sound 43', 512, 500),
    Button('Sound 44', 512, 550),
    
    Button('Sound 45', 640, 50),
    Button('Sound 46', 640, 100),
    Button('Sound 47', 640, 150),
    Button('Sound 48', 640, 200),
    Button('Sound 49', 640, 250),
    Button('Sound 50', 640, 300),
    Button('Sound 51', 640, 350),
    Button('Sound 52', 640, 400),
    Button('Sound 53', 640, 450),
    Button('Sound 54', 640, 500), 
    Button('Sound 55', 640, 550),     
    
    Button('Sound 56', 768, 50),
    Button('Sound 57', 768, 100),
    Button('Sound 58', 768, 150),
    Button('Sound 59', 768, 200),
    Button('Sound 60', 768, 250),
    Button('Sound 61', 768, 300),
    Button('Sound 62', 768, 350),
    Button('Sound 63', 768, 400),
    Button('Sound 64', 768, 450),
    Button('Sound 65', 768, 500),   
    Button('Sound 66', 768, 550), 
   
    Button('Sound 67', 896, 50),
    Button('Sound 68', 896, 100),
    Button('Sound 69', 896, 150),
    Button('Sound 70', 896, 200),
    Button('Sound 71', 896, 250),
    Button('Sound 72', 896, 300),
    Button('Sound 73', 896, 350),
    Button('Sound 74', 896, 400),
    Button('Sound 75', 896, 450),
    Button('Sound 76', 896, 500),  
    Button('Sound 77', 896, 550),     
   
}

drawFree(buttons)

drawUsage()
drawCursor()

requestAnimationFrame(5)
