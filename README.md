# hop
rogue serverhop bind cuz im lazy to execute gui(synapse only)
## guide
this thing uses webhooks cuz webhooks are cool,to make webhook work,create in workspace folder file data.lua
and put this
```
{"webhook":"link","key":"z"}
```
if you dont stupid you know that you need to replace link with webhook link,
then create in autoexec folder file with this
```
if game.PlaceId == 3016661674 then
    syn.queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/ikottiz/hop/main/lua", true))()')
    repeat task.wait() until false
end
```
and now if you press your bind,it will serverhop(you need to wait some time,test it before you be in danger to know how much time you need to serverhop)
