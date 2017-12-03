file = io.open("input", "r")
data = file:read()
file:close()

sum = 0
i = data:len()
last = data:sub(1,1)

while (i >= 0) do
	curr = data:sub(i,i)

	if (curr == last) then
		sum = sum + curr
	end

	last = curr
	i = i - 1
end

print(sum)