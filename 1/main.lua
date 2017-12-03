file = io.open("input", "r")
data = file:read()
file:close()

sum = 0
l = data:len()
i = l
last = data:sub(1,1)

while (i >= 0) do
	curr = data:sub(i,i)

	if (curr == last) then
		sum = sum + curr
	end

	last = curr
	i = i - 1
end

print("Part 1: " .. sum)

sum = 0
i = 0
half = l/2;

while (i <= l) do
	curr = data:sub(i,i)

	if (i < half) then
		last = data:sub(i+half, i+half)
	else
		last = data:sub(i-half, i-half)
	end

	if (curr == last) then
		sum = sum + curr
	end

	i = i + 1
end

print("Part 2: " .. sum)