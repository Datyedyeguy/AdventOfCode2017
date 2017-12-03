ring = 0
square = 1
goal = 325489

print("goal: " .. goal)

while (square * square < goal) do
	square = square + 2;
	ring = ring + 1
end

prev = (square-2)*(square-2)
test = prev + 1
step = (ring*2)-1
inc = false

while (test < goal) do
	test = test + 1

	if (inc) then
		step = step + 1

		if (step == ring * 2) then
			inc = false
		end
	else
		step = step - 1
		if (step == ring) then
			inc = true
		end
	end
end

print("Part 1: " .. step)