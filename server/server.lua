QBCore = exports[Config.Corename]:GetCoreObject()
--pdm
RegisterServerEvent('ef-jobreceipt:Server:UploadPDM')
AddEventHandler('ef-jobreceipt:Server:UploadPDM', function(sname, bname, bcitizenid, vnumber, sellingprice, finance, financedownpay)
    PDMWebhook (
        "Seller Name: " .. sname ..
        "\n" ..
        "\n" ..
        "Buyer Name: " .. bname ..
        "\n" ..
        "\n" ..
        "Buyer Citizen ID: " .. bcitizenid ..
        "\n" ..
        "\n" ..
        "Vehicle Number: " .. vnumber ..
        "\n" ..
        "\n" ..
        "Selling Price: " .. sellingprice ..
        "\n" ..
        "\n" ..
        "Have the Buyer Finance The Vehicle ? " .. finance ..
        "\n" ..
        "\n" ..
        "Finance Down Payment " .. financedownpay
        )
end)
--mechanic
RegisterServerEvent('ef-jobreceipt:Server:UploadMechanic')
AddEventHandler('ef-jobreceipt:Server:UploadMechanic', function(cname, vname, cid, upcost, rcost, custcost, mname)
    MechanicWebhook (
        "Customer Name: " .. cname ..
        "\n" ..
        "\n" ..
        "Vehicle Name: " .. vname ..
        "\n" ..
        "\n" ..
        "Customer Citizen ID: " .. cid ..
        "\n" ..
        "\n" ..
        "Vehicle Upgrade Cost: " .. upcost ..
        "\n" ..
        "\n" ..
        "Vehicle Repair Cost: " .. rcost ..
        "\n" ..
        "\n" ..
        "Vehicle Customize Cost: " .. custcost .. 
        "\n" ..
        "\n" ..
        "Mechainc Name: " .. mname
        )
end)
--EDM
RegisterServerEvent('ef-jobreceipt:Server:UploadEDM')
AddEventHandler('ef-jobreceipt:Server:UploadEDM', function(sname, bname, bcitizenid, vnumber, sellingprice, finance, financedownpay)
    EDMWebhook (
        "Seller Name: " .. sname ..
        "\n" ..
        "\n" ..
        "Buyer Name: " .. bname ..
        "\n" ..
        "\n" ..
        "Buyer Citizen ID: " .. bcitizenid ..
        "\n" ..
        "\n" ..
        "Vehicle Number: " .. vnumber ..
        "\n" ..
        "\n" ..
        "Selling Price: " .. sellingprice ..
        "\n" ..
        "\n" ..
        "Have the Buyer Finance The Vehicle ? " .. finance ..
        "\n" ..
        "\n" ..
        "Finance Down Payment " .. financedownpay
        )
end)
--pdm webhook
function PDMWebhook(pdmmessage)
    local embed = {}
    embed = {
        {
            ["color"] = 65280,
            ["title"] = "PDM | Sales Logs",
            ["description"] = "" .. pdmmessage ..  "",
            ["footer"] = {
                ["icon_url"] = "https://cdn.discordapp.com/attachments/1007717270241427516/1018449348633305108/Ef_productions.gif",
                ["text"] = 'ef-jobreceipt | https://discord.gg/WbDp5GQ45t',
            },
        }
    }
    PerformHttpRequest(Config.PDM.Wehbhook, 
    function(err, text, headers) end, 'POST', json.encode({username = 'ef-jobreceipt - PDM Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end
---MECHANIC
function MechanicWebhook(Mmessage)
    local embed = {}
    embed = {
        {
            ["color"] = 65280,
            ["title"] = "Mechanic | Logs",
            ["description"] = "" .. Mmessage ..  "",
            ["footer"] = {
                ["icon_url"] = "https://cdn.discordapp.com/attachments/1007717270241427516/1018449348633305108/Ef_productions.gif",
                ["text"] = 'ef-jobreceipt | https://discord.gg/WbDp5GQ45t',
            },
        }
    }
    PerformHttpRequest(Config.MechanicWebhook.Wehbhook, 
    function(err, text, headers) end, 'POST', json.encode({username = 'ef-jobreceipt - Mechanic Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end
--EDM webhook
function EDMWebhook(edmmessage)
    local embed = {}
    embed = {
        {
            ["color"] = 65280,
            ["title"] = "EDM | Sales Logs",
            ["description"] = "" .. edmmessage ..  "",
            ["footer"] = {
                ["icon_url"] = "https://cdn.discordapp.com/attachments/1007717270241427516/1018449348633305108/Ef_productions.gif",
                ["text"] = 'ef-jobreceipt | https://discord.gg/WbDp5GQ45t',
            },
        }
    }
    PerformHttpRequest(Config.EDMWebhook.Wehbhook, 
    function(err, text, headers) end, 'POST', json.encode({username = 'ef-jobreceipt - EDM Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

print("^2cfx.reMonitor ^2EF^7-^2JobReceipt ^2Script Made By- ^1BlasterSuraj^7 ^2 ^1https://discord.gg/WbDp5GQ45t^1")







RegisterNetEvent('ef-suraj:Server:AddItem', function(item, itemData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(source, itemData)
end)

RegisterNetEvent('ef-reciept:surajprint', function(suraj2)
    local itemData = {
        sname = suraj2[1],
        bname = suraj2[2],
        bcitizenid = suraj2[3],
        vnumber = suraj2[4],
        sellingprice = suraj2[5],
        finance = suraj2[6],
        financedownpay = suraj2[7]
    }
end)

QBCore.Functions.CreateUseableItem('tablet', function(source, itemData)
	local Player = QBCore.Functions.GetPlayer(source)
    if not source then return end
    local suraj = item.info
    if item.metadata then suraj = item.metadata end
    TriggerEvent('ef-suraj:Server:AddItem', source, suraj)
end)
