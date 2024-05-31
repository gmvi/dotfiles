
function joinLists (...)
    list = {}
    for i,v in ipairs({...}) do
        size = #list
        for I = 1,#v do
            list[size+I] = v[I]
        end
    end
    return list
end
