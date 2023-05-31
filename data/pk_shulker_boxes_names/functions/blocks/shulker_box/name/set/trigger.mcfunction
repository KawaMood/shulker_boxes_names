#> pk_shulker_boxes_names:blocks/shulker_box/name/set/trigger

# Increment the component.id score
scoreboard players add $next pk.custom_block.component.id 1

# Place the text display
execute positioned ~0.5 ~0.5 ~0.5 summon text_display run function pk_shulker_boxes_names:blocks/shulker_box/name/set/initialize

# Store in blocks list
function pk_shulker_boxes_names:blocks/shulker_box/name/set/blocks_list/store

# Debug logs
execute if score $logs.datapack.sh_bo pk.value matches 1 run tellraw @a[tag=pk.dev] [{"text": "Shulker box has been placed","color": "gray"}]