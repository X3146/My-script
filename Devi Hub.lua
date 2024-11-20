local window = DrRayLibrary:Load("Devi Hub", "Default")

local tab1 = DrRayLibrary.newTab("Players", "ImageIdHere")

tab1.newButton("50% Walkspeed", "Click", function()

game.Players.LocalPlayer.Character.Humanoid.Walk
Speed = 50
end)

tab1.newButton("Long Jump", "Click", function()

game.Players.LocalPlayer.Character.Humanoid.Jump
Speed = 50
end)

tab1.newToggle("Toggle", "Toggle! (prints the state)", true, function(toggleState)
    if toggleState then
        print("On")
    else
        print("Off")
    end
end)

tab1.newButton("Fly", "Click", function()

<pre style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-tap-highlight-color: rgba(26, 26, 26, 0.3); -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; overflow-wrap: break-word; white-space: pre-wrap;">local plr = game.Players.LocalPlayer
local torso = plr.Character.Torso
local flying = true
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 50
local speed = 0
local bg = nil
local bv = nil

--Actual flying
function Fly()
	game.StarterGui:SetCore("SendNotification", {Title="Fly Activated"; Text="WeAreDevs.net"; Duration=1;})
    bg = Instance.new("BodyGyro", torso)
    bg.P = 9e4
    bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.cframe = torso.CFrame
    bv = Instance.new("BodyVelocity", torso)
    bv.velocity = Vector3.new(0,0.1,0)
    bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
    repeat wait()
      plr.Character.Humanoid.PlatformStand = true
      if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
        speed = speed+.5+(speed/maxspeed)
        if speed &gt; maxspeed then
          speed = maxspeed
        end
      elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
        speed = speed-1
        if speed &lt; 0 then
          speed = 0
        end
      end
      if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
        bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
        lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
      elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
        bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
      else
        bv.velocity = Vector3.new(0,0.1,0)
      end
      bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
    until not flying
    ctrl = {f = 0, b = 0, l = 0, r = 0}
    lastctrl = {f = 0, b = 0, l = 0, r = 0}
    speed = 0
    bg:Destroy()
	bg = nil
    bv:Destroy()
	bv = nil
    plr.Character.Humanoid.PlatformStand = false
	game.StarterGui:SetCore("SendNotification", {Title="Fly Deactivated"; Text="WeAreDevs.net"; Duration=1;})
end

--Controls
mouse.KeyDown:connect(function(key)
	if key:lower() == "e" then
		if flying then 
			flying = false
		else
			flying = true
			Fly()
		end
	elseif key:lower() == "w" then
		ctrl.f = 1
	elseif key:lower() == "s" then
		ctrl.b = -1
	elseif key:lower() == "a" then
		ctrl.l = -1
	elseif key:lower() == "d" then
		ctrl.r = 1
	end
end)

mouse.KeyUp:connect(function(key)
	if key:lower() == "w" then
		ctrl.f = 0
	elseif key:lower() == "s" then
		ctrl.b = 0
	elseif key:lower() == "a" then
		ctrl.l = 0
	elseif key:lower() == "d" then
		ctrl.r = 0
	end
end)

Fly()</pre>

tab1.newToggle("Toggle", "Toggle! (prints the state)", true, function(toggleState)
    if toggleState then
        print("On")
    else
        print("Off")
    end
end)

local tab2 = DrRayLibrary.newTab("FOV", "ImageIdLogoHere")

tab2.newButton("First Person", "Click", function()

local camera = workspace.CurrentCamera
local player = game.Players.LocalPlayer
local character = player.Character
local humanoid = character.Humanoid

player.CameraMaxZoomDistance = 0.5 -- force first person
camera.FieldOfView = 100
humanoid.CameraOffset = Vector3.new(0, 0, -1)

-- set and keep every body part Transparency to its real transparency
for childIndex, child in pairs(character:GetChildren()) do
	if child:IsA("BasePart") and child.Name ~= "Head" then
		
		child:GetPropertyChangedSignal("LocalTransparencyModifier"):Connect(function()
			child.LocalTransparencyModifier = child.Transparency
		end)
		
		child.LocalTransparencyModifier = child.Transparency
		
	end
end

-- if the player steps in a vehicle
camera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
	if camera.CameraSubject:IsA("VehicleSeat") then
		camera.CameraSubject = humanoid
	end
end)

tab2.newToggle("Toggle", "Toggle! (prints the state)", true, function(toggleState)
    if toggleState then
        print("On")
    else
        print("Off")
    end
end)
tab2.newDropdown("Dropdown", "Select one of these options!", {"water", "dog", "air", "bb", "airplane", "wohhho", "yeay", "delete"}, function(selectedOption)
    print(selectedOption)
end)
