local fasta = {}

function fasta.parser(file_name)
	local models = {}
	local current_model = None
	for line in io.lines(file_name) do
		if line:startswith(">") then
			current_model = line:sub(2)
			models[current_model] = ""
		else
			models[current_model] = models[current_model] .. line
		end
	end
	return models
end

function fasta.tostr(fasta)
	local s = ""
	for m, seq in pairs(fasta) do
		s = s .. ">" .. m .. "\n"
		local n = #seq
		local i = 1
		local f = 60
		while i < n do
			s = s .. seq:sub(i,f) .. "\n"
			i = i + 60
			f = f + 60
		end
	end
	return s
end

return fasta