file = io.open("input", "r")
instructions = {}
registers = {}

for line in file:lines() do
	local instruction = {condition = {}}

	for part in line:gmatch("%S+") do
		if instruction.register == nil then
			instruction.register = part
		elseif instruction.command == nil then
			instruction.command = part
		elseif instruction.amount == nil then
			instruction.amount = tonumber(part)
		elseif part ~= "if" then
			if instruction.condition.register == nil then
				instruction.condition.register = part
			elseif instruction.condition.command == nil then
				instruction.condition.command = part
			else
				instruction.condition.value = tonumber(part)
			end
		end
	end

	if registers[instruction.register] == nil then
		registers[instruction.register] = 0
	end

	if registers[instruction.condition.register] == nil then
		registers[instruction.condition.register] = 0
	end

	table.insert(instructions, instruction)
end

file:close();

for i=1, #instructions do
	local eval = true
	local instruction = instructions[i]

	if instruction.condition.command == "==" then
		eval = registers[instruction.condition.register] == instruction.condition.value
	elseif instruction.condition.command == "!=" then
		eval = registers[instruction.condition.register] ~= instruction.condition.value
	elseif instruction.condition.command == "<=" then
		eval = registers[instruction.condition.register] <= instruction.condition.value
	elseif instruction.condition.command == ">=" then
		eval = registers[instruction.condition.register] >= instruction.condition.value
	elseif instruction.condition.command == "<" then
		eval = registers[instruction.condition.register] < instruction.condition.value
	else
		eval = registers[instruction.condition.register] > instruction.condition.value
	end

	if eval then
		if instruction.command == "inc" then
			registers[instruction.register] = registers[instruction.register] + instruction.amount
		else
			registers[instruction.register] = registers[instruction.register] - instruction.amount
		end
	end
end

local max_value = -9999999

for key, value in pairs(registers) do
	if value > max_value then
		max_value = value
	end
end

print("Part 1: " .. max_value)