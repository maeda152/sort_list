set = []


if File.exist?('sort_data.txt')
    File.open("sort_data.txt", mode = "rt") do |f|
        set = f.readlines(chomp: true)
    end
else
    File.open("sort_data.txt", "w")
end

p set
mode = "add"
loop do
    if mode == "add"
        puts '追加する文字を入力してください(削除したい場合：/delete 閲覧:/sort 終了:/end)'
        pick = $stdin.gets
        p pick.chomp
        if pick != "/add\n" and pick != "/delete\n" and pick != "/sort\n" and pick != "/end\n" and pick != "/new\n"
            set.push(pick.chomp)
        end
    end
    if mode == "delete"
        puts '削除する文字を入力してください(追加したい場合：/add 閲覧:/sort 終了:/end すべて削除:/new)'
        pick = $stdin.gets
        p pick.chomp
        if pick != "/add\n" and pick != "/delete\n" and pick != "/sort\n" and pick != "/end\n" and pick != "/new\n"
            set.delete(pick.chomp)
        end
        if pick == "/new\n"
            set = []
        end
    end

    case pick
    when "/add\n" then
        mode = "add"
    when "/delete\n" then
        mode = "delete"
    when "/sort\n" then
        p set.sort
    when "/end\n" then
        break
    end

end

set.delete("\n")
file = File.open('sort_data.txt',"w")
set.each do |text|
    file.puts(text)
end
