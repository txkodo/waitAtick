data modify storage waitatick: IO set value {}
execute store result storage waitatick: IO.time int 1 run time query gametime

function waitatick:api/static_ex
