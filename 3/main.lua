ring = 0
square = 1
goal = 325489

while (square * square < goal) do
	square = square + 2;
	ring = ring + 1
end

prev = (square-2)*(square-2)
test = prev + 1
step = (ring*2)-1
inc = false

while (test < goal) do
	test = test + 1

	if (inc) then
		step = step + 1

		if (step == ring * 2) then
			inc = false
		end
	else
		step = step - 1
		if (step == ring) then
			inc = true
		end
	end
end

print("Part 1: " .. step)

data = {}
x = 1
y = 0
data["0,0"] = 1
last = 1
dir = "U"

while (last < goal) do
	temp = 0

	index = (x-1)..","..(y-1)
	if (data[index]) then
		temp = temp + data[index]
	end
	index = (x-1)..","..(y-0)
	if (data[index]) then
		temp = temp + data[index]
	end
	index = (x-1)..","..(y+1)
	if (data[index]) then
		temp = temp + data[index]
	end
	index = (x-0)..","..(y-1)
	if (data[index]) then
		temp = temp + data[index]
	end
	index = (x-0)..","..(y+1)
	if (data[index]) then
		temp = temp + data[index]
	end
	index = (x+1)..","..(y-1)
	if (data[index]) then
		temp = temp + data[index]
	end
	index = (x+1)..","..(y-0)
	if (data[index]) then
		temp = temp + data[index]
	end
	index = (x+1)..","..(y+1)
	if (data[index]) then
		temp = temp + data[index]
	end

	data[x..","..y] = temp
	last = temp

	if (dir == "U") then
		if (x == y) then
			dir = "L"
			x = x - 1
		else
			y = y + 1
		end
	elseif (dir == "L") then
		if (-x == y) then
			dir = "D"
			y = y - 1
		else
			x = x - 1
		end
	elseif (dir == "D") then
		if (x == y) then
			dir = "R"
			x = x + 1
		else
			y = y - 1
		end
	elseif (dir == "R") then
		if (x == -y) then
			dir = "U"
		end

		x = x + 1
	end
end

print("Part 2: " .. last)