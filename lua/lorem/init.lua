local function printLorem()
    words = vim.fn.readfile("/home/craggle/code/vim/lorem-nvim/words")

    math.randomseed(os.time())
    commaDelay = math.random(vim.g["lorem#commamin"],vim.g["lorem#commamax"])
    periodDelay = math.random(vim.g["lorem#periodmin"],vim.g["lorem#periodmax"])
    paragraphDelay = math.random(vim.g["lorem#paragraphmin"],vim.g["lorem#paragraphmax"])

    s = ""
    delimiter = " "
    count = vim.v.count1
    for i=1,count do
        local count = 0
        for _ in pairs(words) do count = count + 1 end
        local num = math.random(1, count)

        -- Capitalize first letter of a sentence.
        if i == 1 or delimiter == ". " or delimiter == ".\n" then
            word = words[num]:gsub("^%l", string.upper)
        else
            word = words[num]
        end

        -- Set delimiter based on punctuation delays.
        if periodDelay == 0 then
            periodDelay = math.random(vim.g["lorem#periodmin"],vim.g["lorem#periodmax"])
            if paragraphDelay == 0 then
                paragraphDelay = math.random(vim.g["lorem#paragraphmin"],vim.g["lorem#paragraphmax"])
                delimiter = ".\n"
            else
                delimiter = ". "
            end
            paragraphDelay = paragraphDelay - 1
        elseif i == count then delimiter = ".\n"
        elseif commaDelay == 0 then delimiter = ", "; commaDelay = math.random(vim.g["lorem#commamin"],vim.g["lorem#commamax"])
        else delimiter = " " end

        s = s..word..delimiter
        commaDelay = commaDelay - 1; periodDelay = periodDelay - 1
    end
    vim.api.nvim_paste(s, true, 1)
end

return {
    printLorem = printLorem
}
