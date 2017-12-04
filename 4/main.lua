file = io.open("input", "r")

valid_count = 0

for data in file:lines() do
	words = {}
	pass = true

	for word in data:gmatch("%S+") do
		if (words[word]) then
			pass = false
		else
			words[word] = true
		end
	end

	if (pass) then
		valid_count = valid_count + 1
	end
end

file:close()
print("Part 1: " .. valid_count)