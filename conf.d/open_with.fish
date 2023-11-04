# Open file with application
function phpstorm $argv
    open "./$argv" -a PhpStorm
end

function pycharm $argv
    open "./$argv" -a PyCharm
end

function code $argv
    open "./$argv" -a "Visual Studio Code"
end

function intellij $argv
    open "./$argv" -a "IntelliJ IDEA Ultimate"
end
