#> pk_shulker_boxes_names:base/uninstall/start
# Uninstall the data pack and remove the common feature if there is no KawaMood data pack installed anymore

# Tag player
tag @s add pk.uninstaller

# Turn off command blocks output in chat during the process
execute store success score $gm_command_block_output_state pk.value run gamerule commandBlockOutput false

# Check if the specific chunk that need to stay loaded is loaded 
execute store result score $forceload_main pk.temp run forceload query -30000000 1611
execute if score $forceload_main pk.temp matches 0 run forceload add -30000000 1611

# Prepare the list of elements to remove and the list of chunks where these elements are
data remove storage pk.common:data Uninstall
data modify storage pk.common:data Uninstall.Elements set value []
data modify storage pk.common:data Uninstall.Chunks set value []

# Specific: Append Attempt Blocks
data modify storage pk.common:data Uninstall.Elements append from storage pk.sh_bo:data Blocks.ShulkerBoxes[]

# Create list of chunks
execute if data storage pk.common:data Uninstall.Elements[{}] run function pk_shulker_boxes_names:base/uninstall/chunks_list_create_recursive

# Prepare command blocks chain recursively
execute store result score $uninstall.remaining_chunks pk.value run data get storage pk.common:data Uninstall.Chunks
execute if score $uninstall.remaining_chunks pk.value matches 0 run function pk_shulker_boxes_names:base/uninstall/stop
execute if score $uninstall.remaining_chunks pk.value matches 1.. run function pk_shulker_boxes_names:base/uninstall/cbs_prepare_recursive