file = io.open("input", "r")
disks = {}

for line in file:lines() do
	disk = {branches = {}, is_bottom = true}
	branches = {}

	for part in line:gmatch("%S+") do
		if disk["id"] == nil then
			disk.id = part
		elseif disk["weight"] == nil then
			disk.weight = part:sub(2,(#part)-1)
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

for id, disk in pairs(disks) do
	if (disk.is_bottom) then
		result = id
	end
end

print("Part 1: " .. result)