#> pk_shulker_boxes_names:blocks/shulker_box/name/remove/blocks_list/remove
# Remove the current Waystone from the pk.sh_bo:data Blocks.ShulkerBoxes storage

data remove storage pk.common:data Temp.Array
data modify storage pk.common:data Temp.Array.Search set from storage pk.sh_bo:data Blocks.ShulkerBoxes
data modify storage pk.common:data Temp.Array.New set value []
function pk_shulker_boxes_names:blocks/shulker_box/name/remove/blocks_list/remove_recursive

data remove storage pk.sh_bo:data Blocks.ShulkerBoxes
data modify storage pk.sh_bo:data Blocks.ShulkerBoxes set from storage pk.common:data Temp.Array.New