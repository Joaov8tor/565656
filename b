local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Criar o painel
local painel = Instance.new("Frame")
painel.Size = UDim2.new(0, 300, 0, 200)
painel.Position = UDim2.new(0.5, -150, 0.5, -100)
painel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
painel.Visible = false -- Começa invisível
painel.Parent = playerGui

-- Criar a caixa de texto para digitar a velocidade
local caixaTexto = Instance.new("TextBox")
caixaTexto.Size = UDim2.new(0, 200, 0, 50)
caixaTexto.Position = UDim2.new(0.5, -100, 0.3, 0)
caixaTexto.PlaceholderText = "Digite a velocidade"
caixaTexto.TextColor3 = Color3.fromRGB(255, 255, 255)
caixaTexto.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
caixaTexto.ClearTextOnFocus = true
caixaTexto.Parent = painel

-- Criar o botão para aplicar a velocidade
local botaoAplicar = Instance.new("TextButton")
botaoAplicar.Size = UDim2.new(0, 200, 0, 50)
botaoAplicar.Position = UDim2.new(0.5, -100, 0.6, 0)
botaoAplicar.Text = "Aplicar Velocidade"
botaoAplicar.TextColor3 = Color3.fromRGB(255, 255, 255)
botaoAplicar.BackgroundColor3 = Color3.fromRGB(0, 128, 0)
botaoAplicar.Parent = painel

-- Criar o botão para abrir/fechar o painel
local botaoHub = Instance.new("TextButton")
botaoHub.Size = UDim2.new(0, 100, 0, 50)
botaoHub.Position = UDim2.new(0.5, -50, 0.1, 0)
botaoHub.Text = "Abrir/Fechar"
botaoHub.TextColor3 = Color3.fromRGB(255, 255, 255)
botaoHub.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
botaoHub.Parent = playerGui

-- Função para alternar a visibilidade do painel
botaoHub.MouseButton1Click:Connect(function()
    painel.Visible = not painel.Visible
end)

-- Função para aplicar a velocidade ao personagem
botaoAplicar.MouseButton1Click:Connect(function()
    local velocidade = tonumber(caixaTexto.Text) -- Obtém a velocidade da caixa de texto
    if velocidade and velocidade > 0 then
        local personagem = player.Character
        if personagem then
            local humanoide = personagem:FindFirstChildOfClass("Humanoid")
            if humanoide then
                humanoide.WalkSpeed = velocidade
            end
        end
    else
        print("Valor de velocidade inválido")
    end
end)
