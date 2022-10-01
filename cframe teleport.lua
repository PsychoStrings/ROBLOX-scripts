--Script by LaTehuana

script.Parent.Touched:Connect(function(q)
    if q.Parent and q.Parent:FindFirstChild("Humanoid") then
        q.Parent.Head.CFrame = CFrame.new(-92.5, 143, -370)
    end
end)
