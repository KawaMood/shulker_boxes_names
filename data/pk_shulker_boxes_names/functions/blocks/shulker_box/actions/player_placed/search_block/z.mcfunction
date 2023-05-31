#> pk_shulker_boxes_names:blocks/shulker_box/actions/player_placed/search_block/z
# Recursively search on the Z axis

execute if block ~ ~ ~ #pk_shulker_boxes_names:shulker_boxes run function pk_shulker_boxes_names:blocks/shulker_box/actions/player_placed/search_block/found
scoreboard players remove $z pk.temp 1
execute if score $z pk.temp matches 1.. positioned ~ ~ ~1 run function pk_shulker_boxes_names:blocks/shulker_box/actions/player_placed/search_block/z