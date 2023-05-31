#> pk_shulker_boxes_names:blocks/shulker_box/actions/player_placed/search_block/found
# Block has been found
# Will not prevent the loop to continue: will still check all shulker boxes around

# Store the block data
data modify storage pk.common:data Temp.Block set from block ~ ~ ~

# Check before placing a name
execute if data storage pk.common:data Temp.Block.CustomName unless entity @e[type=text_display,tag=pk.sh_bo.controller,dx=0] run function pk_shulker_boxes_names:blocks/shulker_box/name/set/trigger