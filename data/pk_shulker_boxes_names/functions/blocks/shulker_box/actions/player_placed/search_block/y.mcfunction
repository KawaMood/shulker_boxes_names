#> pk_shulker_boxes_names:blocks/shulker_box/actions/player_placed/search_block/y
# Recursively search on the Y axis

scoreboard players set $z pk.temp 10
function pk_shulker_boxes_names:blocks/shulker_box/actions/player_placed/search_block/z
scoreboard players remove $y pk.temp 1
execute if score $found pk.temp matches 0 if score $y pk.temp matches 1.. positioned ~ ~1 ~ run function pk_shulker_boxes_names:blocks/shulker_box/actions/player_placed/search_block/y