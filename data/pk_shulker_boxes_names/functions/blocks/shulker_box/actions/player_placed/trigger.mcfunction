#> pk_shulker_boxes_names:blocks/shulker_box/actions/player_placed/trigger
# Player placed a shulker box
#@within advancement pk_shulker_boxes_names:interactions/placed_shulker_box

# Revoke advancement
advancement revoke @s only pk_shulker_boxes_names:interactions/placed_shulker_box

# Store item data the player used to place the Shulker Box
data remove storage pk.common:data Temp.Item
data modify storage pk.common:data Temp.Item set from entity @s SelectedItem

# Search the placed shulker box
tag @s add pk.temp.current
function pk_shulker_boxes_names:blocks/shulker_box/actions/player_placed/search_block/start
tag @s remove pk.temp.current