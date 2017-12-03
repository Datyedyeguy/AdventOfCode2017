file = io.open("input", "r")

sum = 0

for data in file:lines() do
	min = 99999
	max = -1

	for i in data:gmatch("%S+") do
		i = tonumber(i)
		
		if (i > max) then
			max = i
		end

		if (i < min) then
			min = i
		end
	end

	sum = sum + (max - min)
end

file:close()
print("Part 1: " .. sum)