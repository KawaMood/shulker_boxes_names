#> pk_shulker_boxes_names:blocks/shulker_box/name/set/blocks_list/store
# @context as the placer (placing player) at the placed block

# Clear storage
data remove storage pk.common:data Temp.ShulkerBox

# Set component score id
execute store result storage pk.common:data Temp.ShulkerBox.id int 1 run scoreboard players get $next pk.custom_block.component.id

# Set name
data modify storage pk.common:data Temp.ShulkerBox.CustomName set from storage pk.common:data Temp.Block.CustomName

# Set coordinates
data modify storage pk.common:data Temp.ShulkerBox.x set from storage pk.common:data Temp.Block.x
data modify storage pk.common:data Temp.ShulkerBox.y set from storage pk.common:data Temp.Block.y
data modify storage pk.common:data Temp.ShulkerBox.z set from storage pk.common:data Temp.Block.z

# Set dimension
data modify storage pk.common:data Temp.ShulkerBox.Dimension set from entity @s Dimension

# Store current block's info into the list
data modify storage pk.sh_bo:data Blocks.ShulkerBoxes append from storage pk.common:data Temp.ShulkerBox