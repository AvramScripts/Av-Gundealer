QBCore = nil

local spawnedPeds = {}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		for k,v in pairs(Config.PedSpawn) do
			local playerCoords = GetEntityCoords(PlayerPedId())
			local distance = #(playerCoords - v.coords.xyz)

			if distance < Config.DistanceSpawn and not spawnedPeds[k] then
				local spawnedPed = NearPed(v.model, v.coords, v.gender, v.animDict, v.animName, v.scenario)
				spawnedPeds[k] = { spawnedPed = spawnedPed }
			end

			if distance >= Config.DistanceSpawn and spawnedPeds[k] then
				if Config.FadeIn then
					for i = 255, 0, -51 do
						Citizen.Wait(50)
						SetEntityAlpha(spawnedPeds[k].spawnedPed, i, false)
					end
				end
				DeletePed(spawnedPeds[k].spawnedPed)
				spawnedPeds[k] = nil
			end
		end
	end
end)

function NearPed(model, coords, gender, animDict, animName, scenario)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(50)
	end

	if Config.MinusOne then
		spawnedPed = CreatePed(Config.GenderNumbers[gender], model, coords.x, coords.y, coords.z - 1.0, coords.w, false, true)
	else
		spawnedPed = CreatePed(Config.GenderNumbers[gender], model, coords.x, coords.y, coords.z, coords.w, false, true)
	end

	SetEntityAlpha(spawnedPed, 0, false)

	if Config.Frozen then
		FreezeEntityPosition(spawnedPed, true)
	end

	if Config.Invincible then
		SetEntityInvincible(spawnedPed, true)
	end

	if Config.Stoic then
		SetBlockingOfNonTemporaryEvents(spawnedPed, true)
	end

	if animDict and animName then
		RequestAnimDict(animDict)
		while not HasAnimDictLoaded(animDict) do
			Citizen.Wait(50)
		end

		TaskPlayAnim(spawnedPed, animDict, animName, 8.0, 0, -1, 1, 0, 0, 0)
	end

    if scenario then
        TaskStartScenarioInPlace(spawnedPed, scenario, 0, true)
    end

	if Config.FadeIn then
		for i = 0, 255, 51 do
			Citizen.Wait(50)
			SetEntityAlpha(spawnedPed, i, false)
		end
	end

	return spawnedPed
end


--- till here Ped Spawn

local function DrawText3D(x, y, z, text)
    SetTextScale(0.50, 0.50)
    SetTextFont(7)
    SetTextProportional(1)
    SetTextColour(136, 8, 8, 255)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    -- DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if QBCore == nil then
            TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            Citizen.Wait(200)
        end
    end
end)



isLoggedIn = false
local PlayerJob = {}



RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerJob = QBCore.Functions.GetPlayerData().job
    

end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo

end)

local onDuty = true 

CreateThread(function()
    Wait(1000)
    while true do
        local sleep = 2000
        if LocalPlayer.state.isLoggedIn and PlayerJob.name == "gundealer" then
            local pos = GetEntityCoords(PlayerPedId())
            for k, v in pairs(Config.Locations["GunDealerStore"]) do
                if #(pos - v) < 4.5 then
                    if onDuty then
                        sleep = 5
                        if #(pos - v) < 1.5 then
                            DrawText3D(v.x, v.y, v.z, "~y~Press E To Open GunDealerStore")
                            if IsControlJustReleased(0, 38) then
                                local authorizedItems = {
                                    label = "Gundealer",
                                    slots = 30,
                                    items = {}
                                }

                                TriggerServerEvent("inventory:server:OpenInventory", "shop", "gundealer", Config.GunDealer) 
                            end
                        elseif #(pos - v) < 30 then
                            DrawText3D(v.x, v.y, v.z, "~y~GunDealerStore")
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

