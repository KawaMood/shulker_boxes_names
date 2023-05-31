#> pk_shulker_boxes_names:blocks/shulker_box/name/remove/trigger

# Set score
scoreboard players operation $temp pk.custom_block.component.id = @s pk.custom_block.component.id

# Remove from block list
execute unless score $uninstall pk.temp matches 1 run function pk_shulker_boxes_names:blocks/shulker_box/name/remove/blocks_list/remove

# Kill the text display
kill @s

# Debug logs
execute if score $logs.datapack.sh_bo pk.value matches 1 run tellraw @a[tag=pk.dev] [{"text": "Shulker box has been removed","color": "gray"}]