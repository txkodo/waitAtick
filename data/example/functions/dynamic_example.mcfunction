data modify storage waitatick: IO set value {}
execute store result storage waitatick: IO.time int 1 run time query gametime

scoreboard players set $tick waitatick 10
function waitatick:api/dynamic_ex
function waitatick:api/dynamic_ex
function waitatick:api/dynamic_ex
