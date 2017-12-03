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

file = io.open("input", "r")
sum = 0

for data in file:lines() do
	numbers = {}

	for i in data:gmatch("%S+") do
		table.insert(numbers, tonumber(i))
	end

	for i = 1, #numbers do
		for j = i+1, #numbers do
			first = numbers[i]
			second = numbers[j]

			if (first < second) then
				temp = first
				first = second
				second = temp
			end

			result = math.fmod(first, second)

			if (result == 0) then
				sum = sum + (first / second)
				print(first .. ":" .. second .. "|" .. result)
			end
		end
	end
end

print("Part 2: " .. sum)