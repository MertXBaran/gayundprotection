ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local uberwebhook = "webhook giriniz"
local malgaunth = {
	{event = "viber-base:armor:additem", kick=true, log=true , webhook="webhook giriniz"},
	{event = "m3:armor:additem", kick=true, log=true , webhook="webhook giriniz"},
}

Citizen.CreateThread(function()
    for k, v in pairs(malgaunth) do
        print(v.event)
        RegisterServerEvent(v.event)
        AddEventHandler(v.event, function(itemname)
            local player = ESX.GetPlayerFromId(source)
            if itemname:match("weapon") or itemname:match("WEAPON") then
                if v.kick then
                    --if you want ban you can add your ban trigger
					print(itemname)
                    DropPlayer(source, "WeaponBasmayi denedi ya mal "..itemname)
                end
                if v.log then
                    dclog(v.webhook, player ,"Weapon Basmayi denedi ve sunucudan atildi. Basmaya Çalıştığı item: "..itemname)
                end
            end
        end)
    end
end)


--uber exploit
RegisterServerEvent("esx_uber:pay")
AddEventHandler("esx_uber:pay",function()
	print("has ok "..source)
	TriggerClientEvent("kontroletbeniya", source)
end)
RegisterServerEvent("dropme")
AddEventHandler("dropme", function(reason)
    local player = ESX.GetPlayerFromId(source)
    if source == nil then
        return
    end
    DropPlayer(source, "Gaunth Malı Farkı ile Sunucudan atıldınız Sebebiyedülvahşet: "..reason)
    dclog(uberwebhook, player, "Oyuncu Sunucudan atıldı Sebebiyedülvahşey: "..reason)
end)


--discord logs
function dclog(webhook, xPlayer, text)
	local playerName = Sanitize(xPlayer.getName())
	local headers = {
	  ['Content-Type'] = 'application/json'
	}
	local data = {
	  ["username"] = "Gayundlow",
	  ["avatar_url"] = "https://cdn.discordapp.com/attachments/972044292338098196/972051323790954506/dsadsa.png",
	  ["embeds"] = {{
		["author"] = {
		  ["name"] = playerName .. ' - ' .. xPlayer.identifier
		},
		["color"] = 1942002,
		["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
	  }}
	}
	data['embeds'][1]['description'] = text
	PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode(data), headers)
end
function Sanitize(str)
	local replacements = {
		['&' ] = '&amp;',
		['<' ] = '&lt;',
		['>' ] = '&gt;',
		['\n'] = '<br/>'
	}
	return str
		:gsub('[&<>\n]', replacements)
		:gsub(' +', function(s)
			return ' '..('&nbsp;'):rep(#s-1)
	end)
end