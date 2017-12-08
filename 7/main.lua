file = io.open("input", "r")
disks = {}

for line in file:lines() do
	disk = {branches = {}, is_bottom = true, goal_weight = 0}
	branches = {}

	for part in line:gmatch("%S+") do
		if disk["id"] == nil then
			disk.id = part
		elseif disk["weight"] == nil then
			disk.weight = tonumber(part:sub(2,(#part)-1))
		elseif part ~= "->" then
			part = string.gsub(part,",","") 
			table.insert(disk.branches, part)
		end
	end

	disks[disk.id] = disk
end

file:close();

for id, disk in pairs(disks) do
	for j=1, #(disk.branches) do
		local branch = disk.branches[j]
		
		disks[branch].is_bottom = false
	end
end

result = ""
goal_weight = -1

function check_weight(disk)
	if (#disk.branches == 0) then
		return disk.weight
	end

	local total = disk.weight
	local branch_weights = {}

	for b=1, #disk.branches do
		table.insert(branch_weights, check_weight(disks[disk.branches[b]]))
	end

	local min = 99999
	local max = -1

	for b=1, #branch_weights do
		if min > branch_weights[b] then
			min = branch_weights[b]
		end
		if max < branch_weights[b] then
			max = branch_weights[b]
		end
	end

	if min ~= max then
		-- We found the error!  Find which branch should be adjusted
		local min_count = 0
		local max_count = 0

		for b=1, #branch_weights do
			if (branch_weights[b] == min) then
				min_count = min_count + 1
			else
				max_count = max_count + 1
			end
		end

		local goal = 0
		local diff = 0

		if (min_count == 1) then
			goal = min
			diff = max - min
		else
			goal = max
			diff = min - max
		end

		for b=1, #branch_weights do
			if (branch_weights[b] == goal) then
				goal_weight = disks[disk.branches[b]].weight + diff
				b = #branch_weights
			end
		end
	end

	return total + (min * #branch_weights)
end

for id, disk in pairs(disks) do
	if (disk.is_bottom) then
		result = id
		check_weight(disk)
	end
end

print("Part 1: " .. result)

print("Part 2: " .. goal_weight)