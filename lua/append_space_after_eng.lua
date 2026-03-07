-- 英文选词后自动加空格：选中纯英文候选时，上屏内容末尾自动带一个空格
-- 在 engine/filters 中加入: lua_filter@*append_space_after_eng
-- 放在 uniquifier 之前即可

local function append_space_after_eng_filter(input, env)
  for cand in input:iter() do
    local text = cand.text
    -- 纯英文（字母与撇号，如 don't）则末尾加空格
    if text and text:match("^[%a']+$") then
      cand = cand:to_shadow_candidate("append_space_after_eng", text .. " ", cand.comment)
    end
    yield(cand)
  end
end

return append_space_after_eng_filter
