file = io.open("input", "r")
data = file:read()
file:close()

banks = {}

for bank in data:gmatch("%S+") do
	table.insert(banks, tonumber(bank))
end

bank_history = {}
duplicate_found = false
count = 0

while duplicate_found == false do
	-- Find largest
	largest_bank_index = 1

	for bank_index = 1, #banks do
		if (banks[bank_index] > banks[largest_bank_index]) then
			largest_bank_index = bank_index
		end
	end

	-- Share the love
	memory = banks[largest_bank_index]
	banks[largest_bank_index] = 0

	while memory > 0 do
		largest_bank_index = largest_bank_index + 1

		if (largest_bank_index > #banks) then
			largest_bank_index = 1
		end

		banks[largest_bank_index] = banks[largest_bank_index] + 1
		memory = memory - 1
	end

	-- Story in history
	count = count + 1
	id = ""

	for bank_index = 1, #banks do
		id = id .. "|" .. banks[bank_index]
	end

	if (bank_history[id]) then
		duplicate_found = true
	else
		bank_history[id] = true
	end
end

print("Part 1: " .. count)