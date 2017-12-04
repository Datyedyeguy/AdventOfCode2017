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

file = io.open("input", "r")
valid_count = 0

for data in file:lines() do
	words = {}
	pass = true

	for word in data:gmatch("%S+") do
		-- Sort letters in word
		sorted_word = ""

		while (#word > 0) do
			min_l = 1

			for l = 2, #word do
				if (tonumber(word:sub(l,l),36) < tonumber(word:sub(min_l, min_l),36)) then
					min_l = l
				end
			end

			sorted_word = sorted_word .. word:sub(min_l,min_l)
			word = word:sub(1,min_l-1) .. word:sub(min_l+1)
		end

		if (words[sorted_word]) then
			pass = false
		else
			words[sorted_word] = true
		end
	end

	if (pass) then
		valid_count = valid_count + 1
	end
end

file:close()
print("Part 2: " .. valid_count)