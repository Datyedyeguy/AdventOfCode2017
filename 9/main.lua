file = io.open("input", "r")
data = file:read()
file:close()

groups = {}
group_level = 0
is_garbage = false
skip = false

for i=1, #data do
	local input = data:sub(i, i)

	if (skip) then
		skip = false
	elseif (input == "!") then
		skip = true
	elseif (is_garbage and input == ">") then
		is_garbage = false
	elseif (input == "{" and not is_garbage) then
		group_level = group_level + 1
		if (groups[group_level] == nil) then
			groups[group_level] = 0
		end

		groups[group_level] = groups[group_level] + 1
	elseif (input == "}" and not is_garbage) then
		group_level = group_level - 1
	elseif (input == "<" and not is_garbage) then
		is_garbage = true
	end
end

score = 0

for i=1, #groups do
	score = score + (i * groups[i])
end

print("Part 1: " .. score)