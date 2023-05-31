#> pk_shulker_boxes_names:base/uninstall/remove_specific_features
# Specific: remove features

# Remove current data pack storage
data remove storage pk.sh_bo:data Blocks

# Remove the current data pack from the installed PK data packs list
data remove storage pk.common:data Datapacks[{Name:"Shulker Boxes Names"}]

# Remove installed version score
scoreboard players reset $pk.sh_bo.version pk.value