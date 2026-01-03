local Debug = function(text)
    if not Config.Debug then return end
    print(text)
end

CreateThread(function()
    Wait(5000)
    local dict_txd = CreateRuntimeTxd('replace_blip')
    for name, path in pairs(Setting.Replaces) do 
        local texture = CreateRuntimeTextureFromImage(dict_txd, 'replace_' .. name, path)
    end
    RequestStreamedTextureDict('replace_blip', false)
    while not HasStreamedTextureDictLoaded('replace_blip') do 
        Wait(100)
        Debug('Loading Texture Dict...')
    end
    for name, _ in pairs(Setting.Replaces) do
        AddReplaceTexture('minimap', name, 'replace_blip', 'replace_' .. name)
    end
    Debug('All minimap blip textures have been replaced.')
end)
