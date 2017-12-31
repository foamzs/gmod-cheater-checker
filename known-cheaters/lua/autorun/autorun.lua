if SERVER then

	local PLAYER = FindMetaTable("Player")
	util.AddNetworkString( "ColoredMessage" )
	function BroadcastMsg(...)
		local args = {...}
		net.Start("ColoredMessage")
		net.WriteTable(args)
		net.Broadcast()
	end

	function PLAYER:PlayerMsg(...)
		local args = {...}
		net.Start("ColoredMessage")
		net.WriteTable(args)
		net.Send(self)
	end






//dont modify above






 


	local function onConnectServer( ply_name, ply_ip )
		for x,ox in pairs(player.GetAll()) do
			if ox:IsAdmin() then
				ox:SendLua([[sound.PlayURL("https://www.dropbox.com/s/m837v9asul643t2/Ding%20Sound%20Effect%20%282%29.mp3?dl=1","mono",function() end)]])
				timer.Simple(1,function()
					ox:PlayerMsg( Color( 67, 239, 124 ), "[NOTIFY] ", Color( 219, 60, 54 ), ply_name, Color( 173, 209, 244 ), " has just ", Color( 255, 71, 221 ), "Connected, their ip is ", Color( 159, 114, 175 ), ply_ip, "!")
				end)
			else
				ox:SendLua([[sound.PlayURL("https://www.dropbox.com/s/m837v9asul643t2/Ding%20Sound%20Effect%20%282%29.mp3?dl=1","mono",function() end)]])
				timer.Simple(1,function()
					ox:PlayerMsg( Color( 67, 239, 124 ), "[NOTIFY] ", Color( 219, 60, 54 ), ply_name, Color( 173, 209, 244 ), " has just ", Color( 255, 71, 221 ), "Connected!")
				end)
			end
		end
		print("[NOTIFY] "..ply_name.." has just connected, their ip is "..ply_ip)
	end
	hook.Add("PlayerConnect", "some_new_unique_name", onConnectServer)




	




	local function onSendingClientInfo( ply )
		for i,v in pairs(player.GetAll()) do
			if v ~= ply then
				v:SendLua([[sound.PlayURL("https://www.dropbox.com/s/m837v9asul643t2/Ding%20Sound%20Effect%20%282%29.mp3?dl=1","mono",function() end)]])
				timer.Simple(1,function()
					v:PlayerMsg( Color( 67, 239, 124 ), "[NOTIFY] ", Color( 219, 60, 54 ), ply:Name(), Color( 173, 209, 244 ), " is currently ", Color( 255, 71, 221 ), "Sending Client Info!")
				end)
			end
		end
		timer.Simple(3,function()

		http.Fetch("https://pastebin.com/raw/g2Xt4SYd", function(body,len,headers,code)
			if string.find(body, ply:SteamID()) then
				print( ply:Name().." is a cheater, be aware!")
				for x,ox in pairs(player.GetAll()) do
					if ox ~= ply then
						ox:SendLua([[sound.PlayURL("https://www.dropbox.com/s/m837v9asul643t2/Ding%20Sound%20Effect%20%282%29.mp3?dl=1","mono",function() end)]])
						timer.Simple(1,function()
							ox:PlayerMsg( Color( 67, 239, 124 ), "[NOTIFY] ", Color( 219, 60, 54 ), ply:Name(), Color( 173, 209, 244 ), " is a known ", Color( 255, 71, 221 ), "Cheater, they will be notified!")
						end) 
					end
				end
				timer.Simple(20,function()
					ply:SendLua([[sound.PlayURL("https://www.dropbox.com/s/m837v9asul643t2/Ding%20Sound%20Effect%20%282%29.mp3?dl=1","mono",function() end)]])
					timer.Simple(1,function()
						ply:PlayerMsg( Color( 67, 239, 124 ), "[NOTIFY] ", Color( 173, 209, 244), "Looks like you are a recognised ", Color( 255, 71, 221 ), "Cheater!")
						ply:PlayerMsg( Color( 67, 239, 124 ), "[NOTIFY] ", Color( 173, 209, 244), "You have one chance, this server is protected by ", Color( 219, 60, 54 ), "FMAC ANTICHEAT!")
					end)

				end)
			else
				--nvm
			end
		end,
		function(error)
			--failed
		end)

		end)
	end
	hook.Add( "PlayerInitialSpawn", "some_unique_name", onSendingClientInfo )




else




















//dont modify below



		net.Receive("ColoredMessage",function(len) 
			local msg = net.ReadTable()
			chat.AddText(unpack(msg))
		end)


end