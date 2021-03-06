local function printLorem()
    local words = vim.fn.readfile(vim.g["lorem#wordspath"])

    -- Set seed based on time, generate delays randomly between min and max
    math.randomseed(vim.fn.reltimefloat(vim.fn.reltime()))
    local commaDelay = math.random(vim.g["lorem#commamin"],vim.g["lorem#commamax"])
    local periodDelay = math.random(vim.g["lorem#periodmin"],vim.g["lorem#periodmax"])
    local paragraphDelay = math.random(vim.g["lorem#paragraphmin"],vim.g["lorem#paragraphmax"])

    local s = ""
    local delimiter = " "
    local count = vim.v.count1
    for i=1,count do
        local len = 0
        for _ in pairs(words) do len = len + 1 end
        local num = math.random(1, len)

        -- Capitalize first letter of a sentence.
        local word = words[num]
        if i == 1 or delimiter == ". " or delimiter == ".\n" then
            word = word:gsub("^%l", string.upper)
        end

        -- Set delimiter based on punctuation delays.
        if i == count then delimiter = ".\n"
        elseif periodDelay == 0 then
            periodDelay = math.random(vim.g["lorem#periodmin"],vim.g["lorem#periodmax"])
            if paragraphDelay == 0 then
                paragraphDelay = math.random(vim.g["lorem#paragraphmin"],vim.g["lorem#paragraphmax"])
                delimiter = ".\n"
            else
                delimiter = ". "
            end
            paragraphDelay = paragraphDelay - 1
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
