file = io.open("input", "r")
data = file:read()
file:close()

marks = {}

for i=1, 256 do
	table.insert(marks, i-1)
end

current_position = 1
skip_size = 0

for length in data:gmatch("%w+") do
	local left = current_position
	local right = current_position + length - 1
	local goal = math.ceil((right - left) / 2) + left

	if (right > #marks) then
		right = right - #marks
	end

	if (goal > #marks) then
		goal = goal - #marks
	end

	while (left ~= goal) do
		local temp = marks[left]
		marks[left] = marks[right]
		marks[right] = temp

		left = left + 1
		right = right - 1

		if (left > #marks) then
			left = left - #marks
		end

		if (right < 1) then
			right = right + #marks
		end
	end

	current_position = current_position + length + skip_size
	skip_size = skip_size + 1

	while (current_position > #marks) do
		current_position = current_position - #marks
	end
end

print("Part 1: " .. (marks[1] * marks[2]))