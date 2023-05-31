#> pk_shulker_boxes_names:blocks/shulker_box/name/set/initialize

# Set score
scoreboard players operation @s pk.custom_block.component.id = $next pk.custom_block.component.id

# Add tags
tag @s add pk.sh_bo
tag @s add pk.sh_bo.controller
tag @s add pk.sh_bo.name

# Add data
data modify entity @s text set from storage pk.common:data Temp.Block.CustomName
data modify entity @s transformation.translation set value [0f,-0.15f,1f]
execute if block ~ ~ ~ #shulker_boxes[facing=down] run data modify entity @s transformation.translation set value [0f,-1f,0f]
execute if block ~ ~ ~ #shulker_boxes[facing=up] run data modify entity @s transformation.translation set value [0f,0.7f,0f]
data modify entity @s billboard set value "center"