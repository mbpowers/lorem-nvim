local function printLorem(count)
    words = vim.fn.readfile("words")

    math.randomseed(os.time())
    commaDelay = math.random(2,9)
    periodDelay = math.random(6,14)
    paragraphDelay = math.random(4,10)

    s = ""
    delimiter = " "
    len = vim.v.count1
    for i=1,len do
        local num = math.random(1,156)

        if i == 1 or delimiter == ". " then word = words[num]:gsub("^%l", string.upper)
        else word = words[num] end

        if periodDelay == 0 then
            paragraphDelay = paragraphDelay - 1
            delimiter = ". "
            if paragraphDelay == 0 then
                delimiter = delimiter.."\n"
                paragraphDelay = math.random(4,10) end
            periodDelay = math.random(6, 16)
        elseif i == len then delimiter = ". "
        elseif commaDelay == 0 then delimiter = ", "; commaDelay = math.random(3, 9)
        else delimiter = " " end

        s = s..word..delimiter
        commaDelay = commaDelay - 1; periodDelay = periodDelay - 1
    end
    vim.api.nvim_paste(s, true, 1)
end

return {
    printLorem = printLorem
}
