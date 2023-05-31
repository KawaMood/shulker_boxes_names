#> pk_shulker_boxes_names:base/load
# Main load

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Settings:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

# Common:
# - $logs.load pk.value | default: (undefined) | <=0 = mask load logs | (undefined) or >=1 = show load logs
# - $logs.tick pk.value | default: (undefined) | (undefined) or <=0 = mask tick logs | >=1 = show tick logs

# Special tags:
# - pk.dev : Allow player to see data packs specific logs

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Locations:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# Location -30000000 0 1611 in Overworld | Standardized chunk used by many data packs, used here to run command blocks processes
# Will be used only during uninstall process

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Storage:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# Define storage
# - pk.common.data | Used to store installed PK Datapacks names and version and for temp data manipulation
# - pk.sh_bo:data Block | Used to store features of a specific custom block from this data pack
# - pk.sh_bo:data Blocks | Used to store the list of the placed custom block from this data pack
#declare storage pk.common:data
#declare storage pk.sh_bo:data

# Initialize PK data packs storage if needed
execute unless data storage pk.common:data Datapacks[{}] run data modify storage pk.common:data Datapacks set value []

# Add current data pack into the PK data packs storage if needed
execute unless data storage pk.common:data Datapacks[{Name:"Shulker Boxes Names"}] run data modify storage pk.common:data Datapacks append value {Name:"Shulker Boxes Names"}

# Initialize the storage used to store Shulker Boxes location
execute unless data storage pk.sh_bo:data Blocks.ShulkerBoxes[{}] run data modify storage pk.sh_bo:data Blocks.ShulkerBoxes set value []

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Scores:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# Define objectives that are common to each PK data pack:
# - pk.temp only concerns temp values that can be cleared at any time without risks.
# - pk.value is used for fixed values and variable settings, and won't be cleared on uninstallation until there is no PK data pack anymore.
scoreboard objectives add pk.temp dummy
scoreboard objectives add pk.value dummy
scoreboard objectives add pk.custom_block.component.id dummy

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Updates:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
execute unless score $pk.sh_bo.version pk.value matches 2 run function pk_shulker_boxes_names:base/update/start

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Logs:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
execute unless score $logs.load pk.value matches ..0 run tellraw @a [{"text": "Loaded ","color": "yellow"},{"text": "KawaMood's Shulker Boxes Names ","color": "aqua","bold": true},{"text": "(V.","color": "aqua"},{"nbt":"Datapacks[{Name:\"Shulker Boxes Names\"}].Version", "storage": "pk.common:data","color": "aqua"},{"text": ")","color": "aqua"},{"text": " successfully"}]